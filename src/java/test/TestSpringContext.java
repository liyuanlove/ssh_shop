import com.alibaba.fastjson.annotation.JSONField;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.test.context.TestExecutionListeners;

import java.util.Date;
import java.util.List;

/**
 * 测试spring Ioc
 */
@TestExecutionListeners
public class TestSpringContext {
    @Test
    public void testBean() {
        ApplicationContext context = new AnnotationConfigApplicationContext(TestBeans.class);
        Date time = (Date) context.getBean("time");
        System.out.println(time);
    }

    @Test
    public void testData() {
        ApplicationContext applicationContext = new FileSystemXmlApplicationContext("E:\\IDEA\\ssh\\src\\main\\resources\\springmvc.xml");
//        ComboPooledDataSource dataSource = (ComboPooledDataSource) applicationContext.getBean("dataSource");
        LocalSessionFactoryBean factory = (LocalSessionFactoryBean) applicationContext.getBean(org.springframework.orm.hibernate4.LocalSessionFactoryBean.class);
    }
}
