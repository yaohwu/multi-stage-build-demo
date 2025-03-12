import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

/**
 * @author yaohwu
 * created by yaohwu at 2025 3月 12 10:41
 */
public class Main {

    public static void main(String[] args) {
        checkPath();
        System.out.println(readContent());
    }

    private static void checkPath() {
        String path = Objects.requireNonNull(Main.class.getResource("content.txt")).getFile();
        System.out.printf("read from path: [%s]%n", path);
    }

    private static String readContent() {
        try {
            return new String(toByteArray(Objects.requireNonNull(Main.class.getResourceAsStream("content.txt"))), StandardCharsets.UTF_8);
        } catch (IOException e) {
            return "read but got empty.";
        }
    }

    private static byte[] toByteArray(InputStream is) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] tmp = new byte[1024];
        int bytesRead;
        while ((bytesRead = is.read(tmp)) != -1) {
            buffer.write(tmp, 0, bytesRead);
        }
        return buffer.toByteArray();
    }
}
