package com.ccut.bits.constant;

import com.ccut.bits.picture.model.Picture;

/**
 * Created by Demon on 2015/5/15.
 */
public class Constant {
    public static boolean YES = true;
    public static boolean NO = false;

    public static class Page {
        public static final Integer SUGGEST_QUERY_SIZE = 300;
        public static final Integer DEFAULT_PAGE_INDEX = 1;
        public static final Integer DEFAULT_PAGE_SIZE = 6;
        public static final int FIRST_PAGE = 1;
        public static final String UTF_8 = "UTF-8";
        public static final String ISO_8859_1 = "ISO-8859-1";
        public static final String PAGE_NO = "pageNo";
        public static final String PAGE_SIZE = "pageSize";
    }

    public static class Search {
        public static final String KEY = "key";
        public static final String FIELD = "field";

        public static class DIRECTION {
            public static String PICTURE = "picture";
            public static String LITERATURE = "literature";
            public static String PATENT = "patent";
            public static String EXPERT = "expert";
            public static String LITERATURE_CN = "文献";
            public static String PATENT_CN = "专利";
        }
    }

    public static class Index {
        public static final String AUDIO = "audio";
        public static final String VIDEO = "video";
        public static final String PICTURE = "picture";
        public static final String LITERATURE = "literature";
        public static final String PATENT = "patent";
        public static final String EXPERT = "expert";
        public static final String CLASS = "class";
        public static final String INTELLIGENCE = "Intelligence";
        public static final String INDEX_PATH = "d:\\Index";

        public static class Literature {
            public static final String FIELD_ID = "literatureId";
            public static final String FIELD_TITLE = "literatureTitle";
            public static final String FIELD_ABS = "literatureAbs";
            public static final String FIELD_AUTHOR = "literatureAuthor";
            public static final String FIELD_JOURNAL = "literatureJournal";
            public static final String FIELD_KEY = "literatureKey";
            public static final String FIELD_INABS = "literatureInAbs";
            public static final String FIELD_UNIT = "literatureUnit";
            public static final String FIELD_DATE = "literatureDate";
            public static final String[] ALL_FIELD = new String[]{
                    Literature.FIELD_INABS,
                    Literature.FIELD_ID,
                    Literature.FIELD_ABS,
                    Literature.FIELD_KEY,
                    Literature.FIELD_TITLE,
                    Literature.FIELD_AUTHOR,
                    Literature.FIELD_DATE,
                    Literature.FIELD_JOURNAL,
                    Literature.FIELD_UNIT
            };
        }
        public static class All {
            public static final String FIELD_ID = "AllId";
            public static final String FIELD_TITLE = "AllTitle";
            public static final String FIELD_ABS = "AllAbs";
            public static final String FIELD_AUTHOR = "AllAuthor";
            public static final String FIELD_JOURNAL = "AllJournal";
            public static final String FIELD_KEY = "AllKey";
            public static final String FIELD_INABS = "AllInAbs";
            public static final String FIELD_UNIT = "AllUnit";
            public static final String FIELD_DATE = "AllDate";
            public static final String[] ALL_FIELD = new String[]{
                    All.FIELD_INABS,
                    All.FIELD_ID,
                    All.FIELD_ABS,
                    All.FIELD_KEY,
                    All.FIELD_TITLE,
                    All.FIELD_AUTHOR,
                    All.FIELD_DATE,
                    All.FIELD_JOURNAL,
                    All.FIELD_UNIT
            };
        }
        public static class Patent {
            public static final String FIELD_ID = "id";
            public static final String FIELD_TITLE = "title";
            public static final String FIELD_ABS = "abs";
            public static final String FIELD_APPLICANT = "applicant";
            public static final String FIELD_INVENTOR = "inventor";
            public static final String FIELD_DATE = "date";
            public static final String[] ALL_FIELD = new String[]{
                    Patent.FIELD_ID,
                    Patent.FIELD_ABS,
                    Patent.FIELD_APPLICANT,
                    Patent.FIELD_DATE,
                    Patent.FIELD_INVENTOR,
                    Patent.FIELD_TITLE
            };
        }

        public static class Picture {
            public static final String PICTURE_ID = "pictureId";
            public static final String PICTURE_KEY = "pictureKey";
            public static final String PICTURE_ABS = "pictureAbs";
            public static final String PICTURE_THEME = "pictureTheme";
            public static final String PICTURE_DATE = "pictureDate";
            public static final String PICTURE_NAME = "pictureName";
            public static final String PICTURE_URL = "pictureUrl";
            public static final String PICTURE_AUTHOR = "pictureAuthor";
            public static final String PICTURE_TYPE = "pictureType";
            public static final String PICTURE_SIZE = "pictureSize";
            public static final String[] ALL_FIELD = new String[]{
                    Picture.PICTURE_ID,
                    Picture.PICTURE_THEME,
                    Picture.PICTURE_DATE,

                    Picture.PICTURE_URL,
                    Picture.PICTURE_ABS,
                    Picture.PICTURE_KEY,
                    Picture.PICTURE_NAME,
                    Picture.PICTURE_AUTHOR,
                    Picture.PICTURE_TYPE,
                    Picture.PICTURE_SIZE

            };
        }

        public static class Video{
            public static final String VIDEO_ID = "videoId";
            public static final String VIDEO__KEY = "videoKey";
            public static final String VIDEO__ABS = "videoAbs";
            public static final String VIDEO__THEME = "videoTheme";
            public static final String VIDEO__DATE = "videoDate";
            public static final String VIDEO__IMGURL= "videoImgurl";
            public static final String VIDEO__NAME = "videoName";
            public static final String VIDEO__URL = "videoUrl";
            public static final String VIDEO__AUTHOR = "videoAuthor";
            public static final String[] ALL_FIELD = new String[]{
                    Video.VIDEO__IMGURL,
                    Video.VIDEO__ABS,
                    Video.VIDEO__AUTHOR,
                    Video.VIDEO__DATE,
                    Video.VIDEO__KEY,
                    Video.VIDEO__NAME,
                    Video.VIDEO__THEME,
                    Video.VIDEO__URL,
                    Video.VIDEO_ID
            };
        }

        public static class Audio{
            public static final String AUDIO_ID = "audioId";
            public static final String AUDIO_KEY = "audioKey";
            public static final String AUDIO__ABS = "audioAbs";
            public static final String AUDIO_THEME = "audioTheme";
            public static final String AUDIO__DATE = "audioDate";
            public static final String AUDIO__IMGURL= "audioImgurl";
            public static final String AUDIO_NAME = "audioName";
            public static final String AUDIO__URL = "audioUrl";
            public static final String AUDIO__AUTHOR = "audioAuthor";
            public static final String[] ALL_FIELD = new String[]{
                    Audio.AUDIO__IMGURL,
                    Audio.AUDIO__ABS,
                    Audio.AUDIO__AUTHOR,
                    Audio.AUDIO__DATE,
                    Audio.AUDIO_KEY,
                    Audio.AUDIO_NAME,
                    Audio.AUDIO_THEME,
                    Audio.AUDIO__URL,
                    Audio.AUDIO_ID
            };
        }


        public static class Expert {
            public static final String FIELD_ID = "id";
            public static final String FIELD_NAME = "name";
            public static final String FIELD_ORGANIZATION = "organization";
            public static final String[] ALL_FIELD = new String[]{
                    Expert.FIELD_ID,
                    Expert.FIELD_NAME,
                    Expert.FIELD_ORGANIZATION
            };
        }

        public static class Intelligence {
            public static final String FIELD_ID = "id";
            public static final String FIELD_TITLE = "title";
            public static final String FIELD_URL = "url";
            public static final String FIELD_DATE = "data";
            public static final String FIELD_ABS = "abs";
        }

        public static class Theme {
            public static final String FIELD_ID = "id";
            public static final String FIELD_THEME_NAME = "themeName";
            public static final String FIELD_KEY_WORD = "keyword";
        }
    }
}