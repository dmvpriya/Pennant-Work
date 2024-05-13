package Model;
public class UnServiceableRegion {
    private String prodId;
    private int pinCodeUnavailabilityService;

    public UnServiceableRegion(String productId, int pinCodeUnavailabilityService) {
        this.prodId = productId;
        this.pinCodeUnavailabilityService = pinCodeUnavailabilityService;
    }

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    public int getPinCodeUnavailabilityService() {
        return pinCodeUnavailabilityService;
    }

    public void setPinCodeUnavailabilityService(int pinCodeUnavailabilityService) {
        this.pinCodeUnavailabilityService = pinCodeUnavailabilityService;
    }

}
