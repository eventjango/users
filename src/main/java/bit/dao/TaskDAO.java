package bit.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TaskDAO {

    private final String NAMESPACE = "bit.dao.TaskDAO";

    @Autowired
    private SqlSessionTemplate session;


    public void updateExpirdDeadline(){
        session.update(NAMESPACE + ".updateExpirdDeadline");
    }

}
