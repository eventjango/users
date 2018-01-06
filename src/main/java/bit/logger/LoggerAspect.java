package bit.logger;

import lombok.extern.java.Log;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Log
@Aspect
@Component
public class LoggerAspect {

    @Around("execution(* bit.controller.*Controlller.*(..))")
    public Object log(ProceedingJoinPoint joinPoint) throws Throwable{

        log.info("============= advice =============");
        log.info("============= advice =============");
        log.info("============= advice =============");

        return joinPoint.proceed();
    }
}
