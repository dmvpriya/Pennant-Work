package Model;

public class Product {

	private String prod_id;
	private String prod_name;
	private int prod_price;
	private String prod_hsn_code;
	private int prod_discount;
	private String prod_image;
	private int prod_category_id;

	public Product(String prod_id, String prod_name, int prod_price, String prod_hsn_code, String prod_image,
			int prod_category_id,int prod_discount) {
		this.prod_id = prod_id;
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.prod_hsn_code = prod_hsn_code;
		this.prod_image = prod_image;
		this.prod_category_id = prod_category_id;
		this.prod_discount = prod_discount;
	}

	public String getProd_id() {
		return prod_id;
	}

	public String getProd_name() {
		return prod_name;
	}

	public int getProd_price() {
		return prod_price;
	}
	
	public int getProd_discount() {
		return prod_discount;
	}

	public String prod_hsn_code() {
		return prod_hsn_code;
	}

	public String getProd_image() {
		return prod_image;
	}

	public int getProd_category_id() {
		return prod_category_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	
	public void setProd_discount(int prod_discount) {
		this.prod_discount = prod_discount;
	}

	public void setProd_gst(String prod_hsn_code) {
		this.prod_hsn_code = prod_hsn_code;
	}

	public void setProd_image(String prod_image) {
		this.prod_image = prod_image;
	}

	public void setProd_category_id(int prod_category_id) {
		this.prod_category_id = prod_category_id;
	}
}
