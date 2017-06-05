import com.jacknic.shop.utils.Encryption;
import org.junit.Test;

/**
 * 测试加密
 */
public class TestEncryption {
    @Test
    public void testMD5AndSHA1() {
        String fin = "e89b0486c00cf59cb97a08494ae38537";
        String enc = Encryption.MD5(Encryption.SHA1("123456"));
        System.out.println(enc);
        System.out.println(enc.equals(fin));
    }

    @Test
    public void testIntLen() {
        System.out.println(Integer.MAX_VALUE);
        System.out.println(System.currentTimeMillis() / 1000);
        System.out.println(String.valueOf(Integer.MAX_VALUE).length());
    }

}
