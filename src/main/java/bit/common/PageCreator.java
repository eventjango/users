package bit.common;


import lombok.Data;

@Data
public class PageCreator {

    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean isPrev;
    private boolean isNext;

    private int displayPageNumber = 10;
    private PageRange pageRange;

    public void start(int totalCount){
        setTotalCount(totalCount); run();
    }

    private void run(){

        endPage = (int) (
                Math.ceil(pageRange.getPage() / (double) displayPageNumber) * displayPageNumber
        );

        startPage = (endPage - displayPageNumber) + 1;

        int tempEndPage = (int) Math.ceil(totalCount /(double) pageRange.getPerPageNumber());

        if(endPage > tempEndPage) endPage = tempEndPage;

        isPrev = startPage == 1 ? false : true;

        isNext = endPage * pageRange.getPerPageNumber() >= totalCount ? false : true;
    }
}
