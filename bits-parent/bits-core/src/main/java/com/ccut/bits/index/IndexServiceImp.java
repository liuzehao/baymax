package com.ccut.bits.index;

import com.ccut.bits.audio.dao.AudioDao;
import com.ccut.bits.audio.model.Audio;
import com.ccut.bits.constant.Constant;
import com.ccut.bits.expert.dao.ExpertDao;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.picture.model.Picture;
import com.ccut.bits.picture.dao.PictureDao;
import com.ccut.bits.intelligence.dao.IntelligenceDao;
import com.ccut.bits.intelligence.model.Intelligence;
import com.ccut.bits.literature.dao.LiteratureDao;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.lucene.LuceneIndex;
import com.ccut.bits.patent.dao.PatentDao;
import com.ccut.bits.patent.model.Patent;
import com.ccut.bits.theme.dao.ThemeDao;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.video.dao.VideoDao;
import com.ccut.bits.video.model.Video;
import org.apache.lucene.document.*;
import org.apache.lucene.index.IndexableField;

import org.apache.tika.Tika;
import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tika.parser.pdf.PDFParser;
import org.apache.tika.sax.BodyContentHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.xml.sax.SAXException;

import java.io.*;
import java.util.*;

/**
 * 每天凌晨2点进行重新索引，以保证以最新词库进行分词索引，提高命中准确性
 */
@Service("indexService")
public class IndexServiceImp implements IndexService {
    @Autowired
    private AudioDao audioDao;
    @Autowired
    private VideoDao videoDao;
    @Autowired
    private PictureDao pictureDao;
    @Autowired
    private ExpertDao expertDao;
    @Autowired
    private PatentDao patentDao;
    @Autowired
    private LiteratureDao literatureDao;
    @Autowired
    private IntelligenceDao intelligenceDao;
    @Autowired
    private ThemeDao themeDao;
    @Autowired
    private LuceneIndex luceneIndex;
    private List<Field> fields = new ArrayList<>();

    private void setFieldScore(Map<String, Float> score) {
        Iterator<Field> i = this.fields.iterator();
        Field field;
        while (i.hasNext()) {
            field = i.next();
            if (score.keySet().contains(field.name()))
                field.setBoost(score.get(field.name()));
        }
    }

    private void clearFields() {
        if (this.fields == null) {
            this.fields = new ArrayList<>();
        } else {
            this.fields.clear();
        }
    }

    private Document getDocument() {
        Document doc = new Document();
        Iterator<Field> i = this.fields.iterator();
        while (i.hasNext()) {
            doc.add(i.next());
        }
        return doc;
    }
public  String tikaTool(File f)throws IOException,TikaException {
    Tika tika=new Tika();
    String s= tika.parseToString(f);
    return s;
    }
    public  String tikaTool2(File f)throws IOException,TikaException {
        Parser parser = new PDFParser();
//parser.
        BodyContentHandler handler = new BodyContentHandler(100*1024*1024);
        Metadata metadata = new Metadata();
        InputStream stream = null;
        try {

            stream = new FileInputStream(f);
            parser.parse(stream, handler, metadata, new ParseContext());

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SAXException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (TikaException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                stream.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return  handler.toString();
    }


    @Override
    public boolean initLiteratureIndex() {
        //List<Literature> result = literatureDao.getAllLiterature(null, null);
        List<Document> documents = new LinkedList<>();
       // Map<String, Float> score = new HashMap<>();
        //score.put(Constant.Index.Literature.FIELD_TITLE, 15F);
        //score.put(Constant.Index.Literature.FIELD_KEY, 3F);
        try {
            File f = new File("E:/比特能专家机器人/baymax/bits-parent/bits-webapp/src/main/webapp/upload/documents");
            Document doc = null;
            for (File file : f.listFiles()) {
                Literature literature=literatureDao.getLiteratureByFileName(file.getName());
                if(literature!=null) {
                    doc = new Document();
                    String fileRead=tikaTool(file);
                    doc.add(new TextField(Constant.Index.Literature.FIELD_INABS,fileRead,Field.Store.YES));
                    //doc.add(new Field("path", file.getAbsolutePath(), Field.Store.YES, Field.Index.NOT_ANALYZED));
                    doc.add(new IntField(Constant.Index.Literature.FIELD_ID, literature.getFileId(), Field.Store.YES));
                    doc.add(new TextField(Constant.Index.Literature.FIELD_TITLE, file.getName(), Field.Store.YES));
                    doc.add(new TextField(Constant.Index.Literature.FIELD_ABS, literature.getFileAbstract(), Field.Store.YES));
                    doc.add(new TextField(Constant.Index.Literature.FIELD_KEY, literature.getFileKeywords(), Field.Store.YES));
                    doc.add(new StringField(Constant.Index.CLASS, Constant.Index.LITERATURE, Field.Store.YES));
                    doc.add(new StringField(Constant.Index.Literature.FIELD_DATE, literature.getFileTime(), Field.Store.YES));
                    documents.add(doc);
                }
            }
        } catch (IOException|TikaException e ) {
            System.out.println("text文件未找到");
        }
        /*for (Literature li : result) {
            this.clearFields();
            fields.add(new IntField(Constant.Index.Literature.FIELD_ID, li.getId(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Literature.FIELD_TITLE, li.getTitle(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Literature.FIELD_ABS, li.getAbs(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Literature.FIELD_KEY, li.getKey(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Literature.FIELD_AUTHOR, li.getAuthorCn(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Literature.FIELD_JOURNAL, li.getJournalCn(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Literature.FIELD_UNIT, li.getUnit(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.CLASS, Constant.Index.LITERATURE, Field.Store.YES));
            fields.add(new StringField(Constant.Index.Literature.FIELD_DATE, li.getAppDate(), Field.Store.YES));
            this.setFieldScore(score);
            documents.add(this.getDocument());
        }*/
        System.out.println("正在创建文件索引...");
        return luceneIndex.createIndex(documents);
    }
    @Override
       public boolean initIntelligenceIndex() {
        List<Intelligence> result = intelligenceDao.getAllIntelligence();
        List<Document> documents = new LinkedList<>();
        Document document = null;
        for (Intelligence intel : result) {
            document = new Document();
            document.add(new IntField(Constant.Index.Intelligence.FIELD_ID, intel.getId(), Field.Store.YES));
            document.add(new StringField(Constant.Index.Intelligence.FIELD_URL, intel.getUrl(), Field.Store.YES));
            document.add(new StringField(Constant.Index.Intelligence.FIELD_DATE, intel.getDate(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Intelligence.FIELD_TITLE, intel.getTitle(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Intelligence.FIELD_ABS, intel.getAbs(), Field.Store.YES));
            document.add(new StringField(Constant.Index.CLASS, Constant.Index.INTELLIGENCE, Field.Store.YES));
            documents.add(document);
        }
        System.out.println("正在创建全网索引...");
        return luceneIndex.createIndex(documents);
    }
//全局搜索索引
    @Override
    public boolean initAllIndex() {
        List<Literature> result = literatureDao.getAllFile(null, null);
        List<Document> documents = new LinkedList<>();
        Map<String, Float> score = new HashMap<>();
        //score.put(Constant.Index.All.FIELD_TITLE, 15F);
        //score.put(Constant.Index.All.FIELD_KEY, 3F);
        try {
            File f = new File("E:/比特能专家机器人/baymax/bits-parent/bits-webapp/src/main/webapp/upload/documents");
            Document doc = null;
            for (File file : f.listFiles()) {
                Literature literature=literatureDao.getLiteratureByFileName(file.getName());
                System.out.println(file.getName());

                if(literature!=null) {
                    doc = new Document();
                    String fileRead=tikaTool(file);
                    doc.add(new TextField(Constant.Index.All.FIELD_INABS,fileRead,Field.Store.YES));
                    //doc.add(new Field("path", file.getAbsolutePath(), Field.Store.YES, Field.Index.NOT_ANALYZED));
                    doc.add(new IntField(Constant.Index.All.FIELD_ID, literature.getFileId(), Field.Store.YES));
                    doc.add(new TextField(Constant.Index.All.FIELD_TITLE, file.getName(), Field.Store.YES));
                    doc.add(new TextField(Constant.Index.All.FIELD_ABS, literature.getFileAbstract(), Field.Store.YES));
                    doc.add(new TextField(Constant.Index.All.FIELD_KEY, literature.getFileKeywords(), Field.Store.YES));
                    doc.add(new StringField(Constant.Index.CLASS, Constant.Index.LITERATURE, Field.Store.YES));
                    doc.add(new StringField(Constant.Index.All.FIELD_DATE, literature.getFileTime(), Field.Store.YES));
                    documents.add(doc);
                }
            }
        } catch (IOException|TikaException e) {
            System.out.println("text文件未找到");
        }
        System.out.println("第一阶段结束");
        Iterator<Literature> iter=result.iterator();
        while(iter.hasNext()) {
            Literature li=iter.next();
        if(li.getFileType().equals("word")||li.getFileType().equals("excel")||li.getFileType().equals("ppt")||li.getFileType().equals("ppt_wps")||li.getFileType().equals("excel_wps")||li.getFileType().equals("word_wps")||li.getFileType().equals("html")||li.getFileType().equals("txt")||li.getFileType().equals("pdf")||li.getFileType().equals("zip")||li.getFileType().equals("rar"))
                  iter.remove();
        }
        for (Literature li : result) {
            this.clearFields();
            fields.add(new IntField(Constant.Index.All.FIELD_ID, li.getFileId(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.All.FIELD_TITLE, li.getFileName(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.All.FIELD_ABS, li.getFileAbstract(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.All.FIELD_KEY, li.getFileKeywords(), Field.Store.YES));
            //fields.add(new StringField(Constant.Index.All.FIELD_AUTHOR, li.getAuthorCn(), Field.Store.YES));
            //fields.add(new StringField(Constant.Index.All.FIELD_JOURNAL, li.getJournalCn(), Field.Store.YES));
            //fields.add(new StringField(Constant.Index.All.FIELD_UNIT, li.getUnit(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.CLASS, Constant.Index.LITERATURE, Field.Store.YES));
            fields.add(new StringField(Constant.Index.All.FIELD_DATE, li.getFileTime(), Field.Store.YES));
            this.setFieldScore(score);
            documents.add(this.getDocument());
        }
        System.out.println("正在创建全库索引...");
        return luceneIndex.createIndex(documents);
    }
    @Override
    public boolean initExpertIndex() {
        List<Expert> result = expertDao.getAllExpert(null, null);
        List<Document> docs = new LinkedList<Document>();
        Document document = null;
        for (Expert expert : result) {
            document = new Document();
            document.add(new IntField(Constant.Index.Expert.FIELD_ID, expert.getId(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Expert.FIELD_NAME, expert.getExpertName(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Expert.FIELD_ORGANIZATION, expert.getExpertOrg(), Field.Store.YES));
            document.add(new StringField(Constant.Index.CLASS, Constant.Index.EXPERT, Field.Store.YES));
            docs.add(document);
        }
        return luceneIndex.createIndex(docs);
    }

    @Override
    public boolean initPatentIndex() {
        List<Patent> result = patentDao.getAllPatent(null, null);
        List<Document> documents = new LinkedList<>();
        Map<String, Float> score = new HashMap<>();
        score.put(Constant.Index.Patent.FIELD_TITLE, 15F);
        for (Patent patent : result) {
            this.clearFields();
            fields.add(new IntField(Constant.Index.Patent.FIELD_ID, patent.getId(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Patent.FIELD_TITLE, patent.getTitle(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Patent.FIELD_ABS, patent.getAbs(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Patent.FIELD_APPLICANT, patent.getApplicant(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Patent.FIELD_INVENTOR, patent.getInventor(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Patent.FIELD_DATE, patent.getDate(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.CLASS, Constant.Index.PATENT, Field.Store.YES));
            this.setFieldScore(score);
            documents.add(this.getDocument());
        }
        return luceneIndex.createIndex(documents);
    }



    @Override
    public boolean initPictureIndex() {
        List<Picture> result = pictureDao.getAllPicture(null, null);
        List<Document> documents = new LinkedList<>();
        Map<String, Float> score = new HashMap<>();
        score.put(Constant.Index.Picture.PICTURE_THEME, 15F);
        score.put(Constant.Index.Picture.PICTURE_KEY, 3F);
        for (Picture picture : result) {
            this.clearFields();
            fields.add(new TextField(Constant.Index.Picture.PICTURE_ABS, picture.getFileAbstract(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Picture.PICTURE_KEY, picture.getFileKeywords(), Field.Store.YES));
            fields.add(new IntField(Constant.Index.Picture.PICTURE_ID, picture.getFileId(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Picture.PICTURE_NAME, picture.getFileName(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Picture.PICTURE_DATE, picture.getFileTime(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Picture.PICTURE_SIZE, picture.getFileSize(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Picture.PICTURE_TYPE, picture.getFileType(), Field.Store.YES));
            //fields.add(new StringField(Constant.Index.Patent.FIELD_DATE, patent.getDate(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.CLASS, Constant.Index.PICTURE, Field.Store.YES));
            this.setFieldScore(score);
            documents.add(this.getDocument());
        }
        System.out.println("正在创建图片索引...");
        return luceneIndex.createIndex(documents);
    }

    @Override
    public boolean initVideoIndex() {
        List<Video> result = videoDao.getAllVideo(null, null);
        List<Document> documents = new LinkedList<>();
        Map<String, Float> score = new HashMap<>();
        score.put(Constant.Index.Video.VIDEO__THEME, 15F);
        score.put(Constant.Index.Video.VIDEO__KEY, 3F);
        for (Video video : result) {
            this.clearFields();
            fields.add(new TextField(Constant.Index.Video.VIDEO__ABS, video.getFileAbstract(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Video.VIDEO__KEY, video.getFileKeywords(), Field.Store.YES));
            fields.add(new IntField(Constant.Index.Video.VIDEO_ID, video.getFileId(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Video.VIDEO__NAME, video.getFileName(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Video.VIDEO__DATE, video.getFileTime(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Video.VIDEO__IMGURL, video.getFileImgUrl(), Field.Store.YES));
            //fields.add(new StringField(Constant.Index.Patent.FIELD_DATE, patent.getDate(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.CLASS, Constant.Index.VIDEO, Field.Store.YES));
            this.setFieldScore(score);
            documents.add(this.getDocument());
        }
        System.out.println("正在创建视频索引...");
        return luceneIndex.createIndex(documents);
    }

    @Override
    public boolean initAudioIndex() {
        List<Audio> result = audioDao.getAllAudio(null,null);
        List<Document> documents = new LinkedList<>();
        Map<String, Float> score = new HashMap<>();
        score.put(Constant.Index.Audio.AUDIO_THEME, 15F);
        score.put(Constant.Index.Audio.AUDIO_KEY, 3F);
        for (Audio audio : result) {
            this.clearFields();
            fields.add(new TextField(Constant.Index.Audio.AUDIO__ABS, audio.getFileAbstract(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Audio.AUDIO_KEY, audio.getFileKeywords(), Field.Store.YES));
            fields.add(new IntField(Constant.Index.Audio.AUDIO_ID, audio.getFileId(), Field.Store.YES));
            fields.add(new TextField(Constant.Index.Audio.AUDIO_NAME, audio.getFileName(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Audio.AUDIO__DATE, audio.getFileTime(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.Audio.AUDIO__IMGURL, audio.getFileImgUrl(), Field.Store.YES));
            //fields.add(new StringField(Constant.Index.Patent.FIELD_DATE, patent.getDate(), Field.Store.YES));
            fields.add(new StringField(Constant.Index.CLASS, Constant.Index.VIDEO, Field.Store.YES));
            this.setFieldScore(score);
            documents.add(this.getDocument());
        }
        System.out.println("正在创建音频索引...");
        return luceneIndex.createIndex(documents);
    }

    @Override
    public boolean initThemeIndex() {
        List<Theme> themes = themeDao.getAllTheme();
        List<Document> documents = new LinkedList<>();
        Document document = null;
        for (Theme theme : themes) {
            document = new Document();
            document.add(new IntField(Constant.Index.Theme.FIELD_ID, theme.getId(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Theme.FIELD_THEME_NAME, theme.getThemeName(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Theme.FIELD_KEY_WORD, theme.getKeyWord(), Field.Store.YES));
            documents.add(document);
        }
        return luceneIndex.createIndex(documents);
    }

    /*@Override
    public boolean initTextIndex() {
        List<Document> documents = new LinkedList<>();
        Document doc = null;
        try {
            File f = new File("d:\\testindex");

            for (File file : f.listFiles()) {
                doc = new Document();
                doc.add(new Field("content", new FileReader(file)));
                doc.add(new Field("filemame", file.getName(), Field.Store.YES, Field.Index.NOT_ANALYZED));
                doc.add(new Field("path", file.getAbsolutePath(), Field.Store.YES, Field.Index.NOT_ANALYZED));
                documents.add(doc);
            }
        } catch (IOException e) {
            System.out.println("text文件未找到");
        }
        System.out.println("text成功");
        return luceneIndex.createIndex(documents);
    }*/

    @Override
    @Scheduled(cron = "0 0 2 * * ?")
    public void scheduledReWriteIndex() {
        autoCreateIndex();
    }

    @Override
    public void autoCreateIndex() {
        initAllIndex();
        initLiteratureIndex();
        initIntelligenceIndex();
        initAudioIndex();
        initVideoIndex();
        initPictureIndex();
//initExpertIndex();
        //initPatentIndex();
    }
}
