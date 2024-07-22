import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class ServerEx {

	public static void main(String[] args) {

		BufferedReader in = null; // 입력
		BufferedWriter out = null; // 출력

		ServerSocket listener = null; // 서버를 열고 기다림
		Socket socket = null; // 직접 통신에 연결함

		Scanner sc = new Scanner(System.in);

		try {
			listener = new ServerSocket(9000); // 9000번 포트를 염
			System.out.println("연결을 기다리고 있습니다.");
			socket = listener.accept();
			System.out.println("정상적으로 연결되었습니다.");

			in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

			while (true) {
				String inputMessage = in.readLine(); // 클라이언트로부터 한 행을 읽기

				if (inputMessage.equals("bye")) { // 클라이언트가 bye 라고 쓰면
					System.out.println("클라이언트가 종료를 하였습니다.");
					break;
				}

				System.out.println("클라이언트에서 보내온 메세지 : " + inputMessage);
				System.out.print("보내기 >>> ");
				String outputMessage = sc.nextLine();
				out.write(outputMessage + "\n");
				out.flush();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				sc.close();
				socket.close();
				listener.close();
			} catch (Exception e) {
			}
		}

	}

}
