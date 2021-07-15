package second_homework.robot;
import second_homework.SharedResources;

public class RobotRunnable implements Runnable {

	private Robot 			robot;
	private SharedResources data;
	
	public RobotRunnable(Robot robot,SharedResources data){
		this.robot 	= robot;
		this.data 	= data;
	}

	// aici declaram comportamentul robotului in thread
	@Override
	public void run() {
		
		while(data.getCount() < 4) {
			// asteapta semnalul de pornire
			try {
				data.sem.acquire();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
			System.out.println("Initializam piesa robotului");
			// initializam piesa in mana robotului, poate fi gandit ca un alt sistem separat
			robot.initializePiece();
			
			System.out.println("Acum ne pregatim sa incepem sa punem piesa");
			// acum vom porni procesul de punere a piesei pe suport
			robot.dropPiece();
			
			// acum ar trebui sa reporneasca sistemul sau sa iasa in conditia in care s-a intampinat o avarie
			data.sem2.release();
		}
	
	}

}
