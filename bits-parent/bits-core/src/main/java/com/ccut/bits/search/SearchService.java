package com.ccut.bits.search;

import com.ccut.bits.audio.model.Audio;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.intelligence.model.Intelligence;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.picture.model.Picture;
import com.ccut.bits.search.model.SearchRequest;
import com.ccut.bits.search.model.SearchResponse;
import com.ccut.bits.patent.model.Patent;
import com.ccut.bits.video.model.Video;

/**
 * Created by Demon on 2015/4/15.
 */
public interface SearchService {
    SearchResponse<Literature> searchLiterature(SearchRequest request);

    SearchResponse<Literature> searchAll(SearchRequest request);

    SearchResponse<Expert> searchExpert(SearchRequest request);

    SearchResponse<Patent> searchPatent(SearchRequest request);

    SearchResponse<Intelligence> searchGlobal(SearchRequest request);
    SearchResponse<Literature> searchAll1(SearchRequest request);
    SearchResponse<Picture> searchPicture(SearchRequest request);

    SearchResponse<Video> searchVideo(SearchRequest request);
    SearchResponse<Audio> searchAudio(SearchRequest request);
}
