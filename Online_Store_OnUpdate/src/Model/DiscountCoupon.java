package Model;

public class DiscountCoupon {
    private int dcpn_id;
    private String dcpn_code;
    private int dcpn_disValue;
    private int dcpn_noc;
    
    // Constructor
    public DiscountCoupon(int dcpn_id, String dcpn_code, int dcpn_disValue, int dcpn_noc) {
        this.dcpn_id = dcpn_id;
        this.dcpn_code = dcpn_code;
        this.dcpn_disValue = dcpn_disValue;
        this.dcpn_noc = dcpn_noc;
    }
    
    // Getter and Setter methods
    public int getDcpn_id() {
        return dcpn_id;
    }

    public void setDcpn_id(int dcpn_id) {
        this.dcpn_id = dcpn_id;
    }

    public String getDcpn_code() {
        return dcpn_code;
    }

    public void setDcpn_code(String dcpn_code) {
        this.dcpn_code = dcpn_code;
    }

    public int getDcpn_disValue() {
        return dcpn_disValue;
    }

    public void setDcpn_disValue(int dcpn_disValue) {
        this.dcpn_disValue = dcpn_disValue;
    }

    public int getDcpn_noc() {
        return dcpn_noc;
    }

    public void setDcpn_noc(int dcpn_noc) {
        this.dcpn_noc = dcpn_noc;
    }
}
