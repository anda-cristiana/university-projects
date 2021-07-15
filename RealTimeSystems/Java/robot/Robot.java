package second_homework.robot;

// Daca coborarea piesei dureaza mai mult decat timpul maxim pe care il putea avea robotul inseamna
// ca avem o avarie la nivelul robotului 

public class Robot {
	
	// pozitia piesei, ea incepe la 0 si va cobora pana la 
	private int positionPiece;
	
	// constante ce reprezinta timpul maxim pe care l-ar putea lua robotul pentru a 
	// cobori piesa si inaltimea la care va fi lasata piesa 
	private final long MAX_RUNNING_TIME = 10000000;
	private final int STAND_HEIGHT = 80;
	
	// variabila ce indica prezenta unei avarii in robot
	private boolean damage;
	
	// cand robotul primeste semnalul sa coboare piesa atunci starting task va porni si va
	// ramane pornit pentru 3 secunde cat timp se pregateste robotul de coborare si dupa care
	// se va porni semnalul executing task cat timp robotul coboara piesa
	private boolean startingTask;
	private boolean executingTask;
	
	public Robot() {
		damage = false;
		startingTask = false;
		executingTask = false;
	}
	
	public void initializePiece() {
		setPositionPiece(0);
	}
	
	// functia de coborare a piesei
	public void dropPiece() {
		
		startingTask = true; 
		System.out.println("The robot will begin the dropping process...");
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		startingTask = false;
		executingTask = true;
	
		System.out.println("The piece will start to drop");
	
		// vom captura timpul in care robotul coboara piesa pentru a vedea daca a aparut vreo eroare
		long startTime = System.nanoTime();
		while(positionPiece != STAND_HEIGHT) {
			
			if (positionPiece % 10 == 0) {
				System.out.println("Robotul coboara piesa care se afla la inaltimea: "+ (positionPiece+10));
			}
			positionPiece += 1; 
		}
		long endTime = System.nanoTime();
		
		executingTask = false;
		
		// daca avem vreo eroare atunci vom iesi din program cu mesaje de eroare
		if (endTime - startTime > MAX_RUNNING_TIME) {
			damage = true;
			System.out.println("The system has broken and it needs your attention");
			System.out.println(endTime - startTime);
			System.exit(1);
		}
		
		System.out.println("The piece was dropped on the platform!");
	}
	

	public int getPositionPiece() {
		return positionPiece;
	}

	public void setPositionPiece(int positionPiece) {
		this.positionPiece = positionPiece;
	}
	
	
	
	
}
