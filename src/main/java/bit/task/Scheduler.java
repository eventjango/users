package bit.task;


import bit.dao.TaskDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {

    @Autowired
    private TaskDAO taskDAO;

    /**
     * 주기를 돌며 무효한 상품을 선별해서 지운다
     */
    @Scheduled(cron = "0 50 17 * * *")
    public void removeProduct(){

        taskDAO.updateExpirdDeadline();
    }
}
