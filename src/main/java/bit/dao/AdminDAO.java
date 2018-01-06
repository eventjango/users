package bit.dao;

import bit.vo.NewsVO;
import bit.vo.NoticeVO;
import bit.vo.RequestLog;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDAO {

    @Autowired
    private SqlSessionTemplate session;

    private final String NAMESPACE = "bit.dao.AdminDAO";

    public int insertRequestLog(RequestLog requestLog){
        return session.insert(NAMESPACE + ".insertRequestLog", requestLog);
    }

    public List<NoticeVO> selectNotice(String regAgent){
        return session.selectList(NAMESPACE + ".selectNotice", regAgent);
    }

    public NoticeVO selectNoticeOne(String no){
        return session.selectOne(NAMESPACE + ".selectNoticeOne", no);
    }

    public List<NewsVO> selectNews(String regAgent){
        return session.selectList(NAMESPACE + ".selectNews", regAgent);
    }

    public void updateHitCount(int no){
        session.update(NAMESPACE + ".updateHitCount", no);
    }
}
