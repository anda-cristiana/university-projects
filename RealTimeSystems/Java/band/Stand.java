package second_homework.band;

public class Stand {
	
	// pozitia suportului pe banda
	private int positionX;
	
	public Stand() {
		positionX = 0;
	}

	public void initializeStart() {
		positionX = 0;
	}
	// miscarea suportului pe banda
	public void move() {
		positionX += 2;
	}
	
	public int getPositionX() {
		return positionX;
	}

	public void setPositionX(int positionX) {
		this.positionX = positionX;
	}
	
	

}
