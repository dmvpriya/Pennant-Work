package Demo;

public class Product {

	private int prod_id;
	private String prod_name;
	private int prod_price;
	private int prod_gst;
	private String prod_image;
	private int prod_category_id;

	public Product(int prod_id, String prod_name, int prod_price, int prod_gst, String prod_image,
			int prod_category_id) {
		this.prod_id = prod_id;
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.prod_gst = prod_gst;
		this.prod_image = prod_image;
		this.prod_category_id = prod_category_id;
	}

	public int getProd_id() {
		return prod_id;
	}

	public String getProd_name() {
		return prod_name;
	}

	public int getProd_price() {
		return prod_price;
	}

	public int getProd_gst() {
		return prod_gst;
	}

	public String getProd_image() {
		return prod_image;
	}

	public int getProd_category_id() {
		return prod_category_id;
	}

	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public void setProd_gst(int prod_gst) {
		this.prod_gst = prod_gst;
	}

	public void setProd_image(String prod_image) {
		this.prod_image = prod_image;
	}

	public void setProd_category_id(int prod_category_id) {
		this.prod_category_id = prod_category_id;
	}
}
