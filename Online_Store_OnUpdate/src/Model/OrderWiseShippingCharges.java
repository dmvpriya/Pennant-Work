package Model;

public class OrderWiseShippingCharges {

	private int orvl_shippingamount;

	// Constructors
	public OrderWiseShippingCharges() {
	}

	public OrderWiseShippingCharges(int orvl_shippingamount) {

		this.orvl_shippingamount = orvl_shippingamount;
	}

	// Getters and setters

	public int getOrvl_shippingamount() {
		return orvl_shippingamount;
	}

	public void setOrvl_shippingamount(int orvl_shippingamount) {
		this.orvl_shippingamount = orvl_shippingamount;
	}

	// toString method
	// @Override
	// public String toString() {
	// return "OrderWiseShippingCharges{" + "orvl_id=" + orvl_id + ", orvl_from=" + orvl_from + ", orvl_to=" + orvl_to
	// + ", orvl_shippingamount=" + orvl_shippingamount + '}';
	// }
}
