package bit.service;

import bit.dao.AdminDAO;
import bit.service.interfaces.Admin;
import bit.vo.NewsVO;
import bit.vo.NoticeVO;
import bit.vo.RequestLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService implements Admin {

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public int registerRequestLog(RequestLog requestLog) {
        return adminDAO.insertRequestLog(requestLog);
    }

    @Override
    public List<NoticeVO> getNoticeList(String regAgent) {
        return adminDAO.selectNotice(regAgent);
    }

    @Override
    public NoticeVO getNotice(String no) {
        return adminDAO.selectNoticeOne(no);
    }

    @Override
    public List<NewsVO> getNewsList(String regAgent) {
        return adminDAO.selectNews(regAgent);
    }

    @Override
    public void updateHitCount(int no){

        adminDAO.updateHitCount(no);
    }
}
