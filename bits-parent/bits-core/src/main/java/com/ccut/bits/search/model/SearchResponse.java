package com.ccut.bits.search.model;

import java.util.List;

/**
 * Created by Demon on 2015/4/13.
 */
public class SearchResponse<T> {
    private List<T> result;
    private int totalHits;

    public int getTotalHits() {
        return totalHits;
    }

    public void setTotalHits(int totalHits) {
        this.totalHits = totalHits;
    }

    public SearchResponse(List<T> result,int totalHits){
        this.result = result;
        this.totalHits = totalHits;
    }

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

}
