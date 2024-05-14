package Model;

public class OrderProducts {
    private String order_id;
    private String product_id;
    private int order_quantity;
    private int order_price;
    private int dcpn_id;
    
    // Constructor
    public OrderProducts(String order_id, String product_id, int order_quantity, int order_price, int dcpn_id) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.order_quantity = order_quantity;
        this.order_price = order_price;
        this.dcpn_id = dcpn_id;
    }
    
    // Getter and Setter methods
    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public int getOrder_quantity() {
        return order_quantity;
    }

    public void setOrder_quantity(int order_quantity) {
        this.order_quantity = order_quantity;
    }

    public int getOrder_price() {
        return order_price;
    }

    public void setOrder_price(int order_price) {
        this.order_price = order_price;
    }

    public int getDcpn_id() {
        return dcpn_id;
    }

    public void setDcpn_id(int dcpn_id) {
        this.dcpn_id = dcpn_id;
    }
}

