package polymorphism;

import org.springframework.stereotype.Component;

@Component("apple")
public class AppleSpeaker implements Speaker {

	
	// 생성자 만들기
	public AppleSpeaker() {
		System.out.println("=====> AppleSpeaker 객체 생성");
	}
	
	@Override
	public void volumeUp() {
		System.out.println("AppleSpeaker --- 소리를 올린다.");
	}

	@Override
	public void volumeDown() {
		System.out.println("AppleSpeaker --- 소리를 내린다.");
	}

}
