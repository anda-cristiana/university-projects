package emulator;

public class AddressMode {
	private Memory mem;
	private State state;
	
	private byte regId;
	private byte memId;
	private Integer addr;
	private Integer forcedSegId = null;
	
	public byte getMem8() {
        if (addr == null) {
            return (byte) state.getReg8(memId);
        }
        return mem.getByte(addr);
    }    
    public short getMem16() {
        if (addr == null) {
            return (short) state.getReg(memId);
        }
        
        return mem.getWord(addr);
    }
    public byte getReg8() {
        return state.getReg8(regId);
    }
    public int getReg16() {
        return state.getReg(regId);
    }
    public int getSreg() {
        return state.getSegReg(regId);
    }
    
    public byte getRegIdx() {
        return regId;
    }
    
    public Integer getAddress() {
        return addr;
    }
    
    
    public void setMem8(byte value) {
        if (addr == null) {
            state.setReg8(memId, value);
        } else {
            mem.setByte(addr, value);
        }
    }
    public void setMem16(short value) {
        if (addr == null) {
            state.setReg(memId, value);
        } else {
            mem.setWord(addr, value);
        }
    }
    public void setReg8(byte value) {
        state.setReg8(regId, value);
    }
    public void setReg16(int value) {
        state.setReg(regId, value);
    }
    
    public void setSreg(short value) {
        state.setSreg(regId, value);
    }    
    public void forceSeg(int regIdx) {
        forcedSegId = regIdx;
    }
	
	// Get current instruction from CS and increment IP
    // First case: 8 bits operand
    public byte nextByte() {
        byte result = mem.getByte((state.getCS() << 4) + state.getIP());
        state.setIP(state.getIP() + 1);
        return result;
    }
    
    // Second case: 16 bits operand
    public short nextWord() {
    	short result = mem.getByte((state.getCS() << 4) + state.getIP());
        state.setIP(state.getIP() + 2);
        return result;
    }
    
    public int getAddr(int segIndex, int offs) {
        if (forcedSegId != null) {
            segIndex = forcedSegId;
            forcedSegId = null;
        }
        return (state.getSegReg(segIndex) << 4) + (offs & 0xffff);
    }
    
    // Define Addressing Modes based on the length of the deplacement
    public void read() throws Exception{
    	byte modRM = nextByte();		
    	
    	byte mode = (byte)((modRM >> 6) & 0x03);
    	regId = (byte)((modRM >> 3) & 0x07);
    	memId = (byte)(modRM & 0x07);
    	
    	 switch (mode) {
         case 0:
             addr = getAddressingMode0d();
             break;
         case 1:
             addr = getAddressingMode8d();
             break;
         case 2: 
             addr = getAddressingMode16d();
             break;
         case 3:
             addr = null; 
             break;
         default:
             throw new Exception("Unsupported mode: " + mode);
    	}
    }
    
    private int getAddressingMode0d() {
        switch (memId) {
            case 0:
                return getAddr(state.getDS(), (short) (state.getBX() + state.getSI()));
            case 1:
                return getAddr(state.getDS(), (short) (state.getBX() + state.getDI()));
            case 2:
                return getAddr(state.getSS(), (short) (state.getBP() + state.getSI()));
            case 3:
                return getAddr(state.getSS(), (short) (state.getBP() + state.getDI()));
            case 4:
                return getAddr(state.getDS(), (short) (state.getSI()));
            case 5:
                return getAddr(state.getDS(), (short) (state.getDI()));
            case 6:
                return getAddr(state.getDS(), nextWord());
            case 7:
                return getAddr(state.getDS(), (short) (state.getBX()));
            default:
                throw new RuntimeException("Unknown memIdx: " + memId);
        }
    }
    
    private int getAddressingMode8d() {
        switch (memId) {
            case 0:
                return getAddr(state.getDS(), (short) (state.getBX() + state.getSI() + nextByte()));
            case 1:
                return getAddr(state.getDS(), (short) (state.getBX() + state.getDI() + nextByte()));
            case 2:
                return getAddr(state.getSS(), (short) (state.getBP() + state.getSI() + nextByte()));
            case 3:
                return getAddr(state.getSS(), (short) (state.getBP() + state.getDI() + nextByte()));
            case 4:
                return getAddr(state.getDS(), (short) (state.getSI() + nextByte()));
            case 5:
                return getAddr(state.getDS(), (short) (state.getDI() + nextByte()));
            case 6:
                return getAddr(state.getSS(), (short) (state.getBP() + nextByte()));
            case 7:
                return getAddr(state.getDS(), (short) (state.getBX() + nextByte()));
            default:
                throw new RuntimeException("Unknown memIdx: " + memId);
        }
    }
    
    private int getAddressingMode16d() {
        switch (memId) {
            case 0:
                return getAddr(state.getDS(), (short) (state.getBX() + state.getSI() + nextWord()));
            case 1:
                return getAddr(state.getDS(), (short) (state.getBX() + state.getDI() + nextWord()));
            case 2:
                return getAddr(state.getSS(), (short) (state.getBP() + state.getSI() + nextWord()));
            case 3:
                return getAddr(state.getSS(), (short) (state.getBP() + state.getDI() + nextWord()));
            case 4:
                return getAddr(state.getDS(), (short) (state.getSI() + nextWord()));
            case 5:
                return getAddr(state.getDS(), (short) (state.getDI() + nextWord()));
            case 6:
                return getAddr(state.getSS(), (short) (state.getBP() + nextWord()));
            case 7:
                return getAddr(state.getDS(), (short) (state.getBX() + nextWord()));
            default:
                throw new RuntimeException("Unknown memIdx: " + memId);
        }
    }
 
}
