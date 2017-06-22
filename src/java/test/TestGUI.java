import com.alibaba.fastjson.JSONObject;
import com.jacknic.shop.utils.OrderDescription;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * 简单的图形化界面程序
 */
public class TestGUI {
    @Test
    public void json() {

        List<OrderDescription> list = new ArrayList<OrderDescription>();
        for (int i = 0; i <= 10; i++) {
            OrderDescription description = new OrderDescription();
            description.setGid(12);
            description.setNum(10);
            list.add(description);
        }
        OrderDescription description = JSONObject.parseObject("{\"gid\":102,\"num\":10}", OrderDescription.class);
        System.out.println(description.getNum());
    }


}
