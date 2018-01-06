package bit.common;

import lombok.Data;

@Data
public class PageRange {

    private int page;
    private int perPageNumber;

    public PageRange(){

        this.page = 1;
        this.perPageNumber = 10;
    }

    public void setPage(int page){

        if(page <= 0){
            this.page = 1; return;
        }

        this.page = page;
    }

    public void setPerPageNumber(int perPageNumber){

        if(perPageNumber <= 0 || perPageNumber > 100){
            this.perPageNumber = 10; return;
        }

        this.perPageNumber = perPageNumber;
    }

    public int getStartPage(){

        return (this.page - 1) * perPageNumber;
    }

    @Override
    public String toString(){

        return String.join(", ", "page->".concat(String.valueOf(page)), "perPageNumber->".concat(String.valueOf(perPageNumber)));
    }
}
