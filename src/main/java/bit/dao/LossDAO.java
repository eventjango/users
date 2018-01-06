package bit.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LossDAO {

    @Autowired
    private SqlSessionTemplate session;

    private final String namespace = "bit.dao.LossDAO";
}
