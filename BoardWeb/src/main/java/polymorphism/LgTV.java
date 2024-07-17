package polymorphism;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("tv")
public class LgTV implements TV{
	
	//@Autowired
	//@Qualifier("sony")
	@Resource(name="sony")
	private Speaker speaker;
	
	public LgTV() {
		System.out.println("========> LG TV 객체 생성");
	}

	@Override
	public void powerOn() {
		System.out.println("LgTV --- 전원 켠다");
		
	}

	@Override
	public void powerOff() {
		System.out.println("LgTV --- 전원 끈다");
		
	}

	@Override
	public void volumeUp() {
		speaker.volumeUp();
		// System.out.println("LgTV --- 소리를 올린다");
		
	}

	@Override
	public void volumeDown() {
		speaker.volumeDown();
		// System.out.println("LgTV --- 소리 내린다");
		
	}
	
	
	
	/*
	public void turnOn() {
		System.out.println("LgTV --- 전원 켠다");
	}
	
	public void turnOff() {
		System.out.println("LgTV --- 전원 끈다");
	}
	
	public void soundUp() {
		System.out.println("LgTV --- 소리를 올린다");
	}
	
	public void soundDown() {
		System.out.println("LgTV --- 소리 내린다");
	}
	*/
	
}
