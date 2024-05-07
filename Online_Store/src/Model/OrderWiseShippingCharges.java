package Model;

public class OrderWiseShippingCharges {
	private int orvl_id;
	private double orvl_from;
	private double orvl_to;
	private double orvl_shippingamount;

	// Constructors
	public OrderWiseShippingCharges() {
	}

	public OrderWiseShippingCharges(int orvl_id, double orvl_from, double orvl_to, double orvl_shippingamount) {
		this.orvl_id = orvl_id;
		this.orvl_from = orvl_from;
		this.orvl_to = orvl_to;
		this.orvl_shippingamount = orvl_shippingamount;
	}

	// Getters and setters
	public int getOrvl_id() {
		return orvl_id;
	}

	public void setOrvl_id(int orvl_id) {
		this.orvl_id = orvl_id;
	}

	public double getOrvl_from() {
		return orvl_from;
	}

	public void setOrvl_from(double orvl_from) {
		this.orvl_from = orvl_from;
	}

	public double getOrvl_to() {
		return orvl_to;
	}

	public void setOrvl_to(double orvl_to) {
		this.orvl_to = orvl_to;
	}

	public double getOrvl_shippingamount() {
		return orvl_shippingamount;
	}

	public void setOrvl_shippingamount(double orvl_shippingamount) {
		this.orvl_shippingamount = orvl_shippingamount;
	}

	// toString method
	// @Override
	// public String toString() {
	// return "OrderWiseShippingCharges{" + "orvl_id=" + orvl_id + ", orvl_from=" + orvl_from + ", orvl_to=" + orvl_to
	// + ", orvl_shippingamount=" + orvl_shippingamount + '}';
	// }
}
