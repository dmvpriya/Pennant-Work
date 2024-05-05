package Model;

public class Category {
	private int prod_category_id;
	private String prod_category_name;
	
	public Category(int prod_category_id,String prod_category_name) {
		this.prod_category_id = prod_category_id;
		this.prod_category_name= prod_category_name;
	}
	
	public int getProd_id() {
		return prod_category_id;
	}
	public String getProd_category_id() {
		return prod_category_name;
	}
	public void setProd_id(int prod_id) {
		this.prod_category_id = prod_category_id;
	}
	public void setProd_category_id(String prod_category_name) {
		this.prod_category_name = prod_category_name;
	}
	
}
