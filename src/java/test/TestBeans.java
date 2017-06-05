import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Date;

/**
 * 测试beans
 */
@Configuration
public class TestBeans {

    @Bean(name = "time")
    public Date time() {
        return new Date();
    }


}
