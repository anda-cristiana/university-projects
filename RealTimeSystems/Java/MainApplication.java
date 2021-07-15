package second_homework;

import second_homework.band.BandRunnable;
import second_homework.band.Stand;
import second_homework.robot.Robot;
import second_homework.robot.RobotRunnable;

public class MainApplication {
	
	public static void main(String[] args) {
		
		
		// declararea variabilelor pe care le vom folosi
		Robot r = new Robot();
		Stand s = new Stand();
		SharedResources rs = new SharedResources();
		
		// crearea celor 2 Runnable pentru thread-uri
		Runnable runn1 = new BandRunnable(s,rs);
		Runnable runn2 = new RobotRunnable(r,rs);
		
		// crearea thread-urilor
		Thread t1 = new Thread(runn1);
		Thread t2 = new Thread(runn2);
		
		// pornirea acestora
		t1.start();
		t2.start();
		
		
	}

}
