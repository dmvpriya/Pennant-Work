package Model;

public class HsnCode {
    private String hsn_code;
    private int gst;
    
    public HsnCode(String hsn_code, int gst) {
        // Constructor
        this.hsn_code = hsn_code;
        this.gst = gst;
    }
    
    // Getter method for hsn_code
    public String getHsn_code() {
        return hsn_code;
    }
    
    // Setter method for hsn_code
    public void setHsn_code(String hsn_code) {
        this.hsn_code = hsn_code;
    }
    
    // Getter method for gst
    public int getGst() {
        return gst;
    }
    
    // Setter method for gst
    public void setGst(int gst) {
        this.gst = gst;
    }
}
