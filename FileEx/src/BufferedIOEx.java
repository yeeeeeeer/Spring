import java.io.BufferedOutputStream;
import java.io.FileReader;
import java.util.Scanner;

public class BufferedIOEx {

	public static void main(String[] args) {
		FileReader fin = null;
		int c;
		try {
			fin = new FileReader("c:\\Temp\\test2.txt");
			BufferedOutputStream out = new BufferedOutputStream(System.out, 5);
		while((c = fin.read()) != -1) {
			out.write(c);
		}
		
		// 파일 데이터가 모두 출력된 상태
		new Scanner(System.in).nextLine();
		out.flush(); // 버퍼에 남아있던 문자 모두 출력
		fin.close();
		out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
