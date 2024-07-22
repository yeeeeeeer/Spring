import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.Scanner;

public class ClientEx {

	public static void main(String[] args) {
		
		BufferedReader in = null; // 받기
		BufferedWriter out = null; // 보내기

		Socket socket = null;

		Scanner sc = new Scanner(System.in);
		try {
			socket = new Socket("192.168.1.36", 9000); // 소켓이 연결됨 ("내 포트번호", "서버가 열어준 포트번호")

			in = new BufferedReader(new InputStreamReader(socket.getInputStream())); // 입력
			out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream())); // 출력

			while (true) { // 무한반복
				String outputMessage = sc.nextLine();

				if (outputMessage.equalsIgnoreCase("bye")) { // equalsIgnoreCase 대소문자 구분 안함
					out.write(outputMessage + "\n"); // 입력한 문자를 쓰고
					out.flush();
					break; // 끝냄
				}

				out.write(outputMessage + "\n");
				out.flush(); // flush : buffer 를 비워줌?
				String inputMessage = in.readLine();
				System.out.println("서버 : " + inputMessage);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				sc.close();
				socket.close();
			} catch (Exception e2) {
			}
		}
	}

}