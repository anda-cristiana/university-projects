package second_homework.band;

import second_homework.SharedResources;

public class BandRunnable implements Runnable {

	
	private final int BAND_LENGTH 		= 50;
	private final int SENSOR_POSITION 	= 20;
	
	private Stand 			stand;
	private SharedResources data;
	
	public BandRunnable(Stand stand, SharedResources data) {
		this.stand 	= stand;
		this.data  	= data;
	}
	
	@Override
	public void run() {
		
		// programul va rula pentru 4 suporturi si 4 piese cate avem nevoie pentru a crea produsul final
		while (data.getCount() < 4) {

		System.out.println("Initializam miscarea suportului pe banda...");
		stand.initializeStart();
		
		// miscarea suportului pana la pozitia senzorului
		while(stand.getPositionX() < SENSOR_POSITION) {
			
			if (stand.getPositionX() % 4 == 0)
				System.out.println("Mutam suportul care se afla la pozitia "+ stand.getPositionX());
			
			stand.move();
			
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		
		}
		
		// trimitem semnalul catre robot sa porneasca
		data.sem.release();
		
		// si asteptam ca robotul sa isi termine munca
		try {
			data.sem2.acquire();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
				
		// ne continuam miscarea pana la finalul benzii
		while(stand.getPositionX() < BAND_LENGTH) {
			if (stand.getPositionX() % 10 == 0)
				System.out.println("Mutam suportul care se afla la pozitia "+ stand.getPositionX());
			stand.move();
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		// numaram cate suportului au trecut
		data.increaseCount();
		}
		
			
	}

}
