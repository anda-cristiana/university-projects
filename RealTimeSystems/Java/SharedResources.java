package second_homework;

import java.util.concurrent.Semaphore;

public class SharedResources {
	
	private boolean sensor; // senzorul care ne indica unde ar trebui sa se opreasca suportul pe care va fi pusa piesa
	private int 	count; // count numara piesele care au fost puse pe suporturi
	
	public Semaphore sem; //primul semafor va declansa pornirea robotului cand suportul va ajunge in dreptul senzorului
	public Semaphore sem2; // al doilea semafor va declansa repornirea benzii dupa ce piesa a fost pusa pe suport
	
	// initializarea resurselor
	public SharedResources() {
		sensor = false;
		count = 0;
		
		// semafoarele le initializam cu valoarea 0
		sem = new Semaphore(0);
		sem2 = new Semaphore(0);
	}
	
	
	public boolean isSensor() {
		return sensor;
	}
	public void flipSensor() {
		sensor = !sensor;
	}
	
	public int getCount() {
		return count;
	}
	
	public void increaseCount() {
		count++;
	}

	
}
