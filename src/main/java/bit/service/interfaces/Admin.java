package bit.service.interfaces;

import bit.vo.NewsVO;
import bit.vo.NoticeVO;
import bit.vo.RequestLog;

import java.util.List;

public interface Admin {

    int registerRequestLog(RequestLog requestLog);

    List<NoticeVO> getNoticeList(String regAgent);

    NoticeVO getNotice(String no);

    List<NewsVO> getNewsList(String regAgent);

    void updateHitCount(int no);
}
