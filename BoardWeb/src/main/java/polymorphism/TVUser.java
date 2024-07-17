package polymorphism;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {

	public static void main(String[] args) {

		// 1. Spring 컨테이너 구동
		AbstractApplicationContext factory = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
		// TV tv1 = (TV) factory.getBean("tv");
		// TV tv2 = (TV) factory.getBean("tv");
		// TV tv3 = (TV) factory.getBean("tv");
		
		// 2. Spring 컨테이너로부터 필요한 객체 요청하기
		TV tv = (TV) factory.getBean("tv");

		tv.powerOn(); 
		tv.volumeUp(); 
		tv.volumeDown(); 
		tv.powerOff();

		/*
		 * tv.powerOn(); tv.volumeUp(); tv.volumeDown(); tv.powerOff();
		 */
		
		factory.close();

		/*
		 BeanFactory factory = new BeanFactory(); TV tv =
		 (TV)factory.getBean(args[0]);
		 
		 tv.powerOn(); 
		 tv.volumeUp(); 
		 tv.volumeDown(); 
		 tv.powerOff();
		 */
		
		/*
		 LgTV tv = new LgTV();
		 
		 tv.turnOn(); 
		 tv.soundUp(); 
		 tv.soundDown(); 
		 tv.turnOff();
		 */

	}

}
