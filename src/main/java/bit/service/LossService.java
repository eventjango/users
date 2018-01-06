package bit.service;

import bit.dao.LossDAO;
import bit.service.interfaces.Loss;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LossService implements Loss {

    @Autowired
    private LossDAO lossDAO;
}
