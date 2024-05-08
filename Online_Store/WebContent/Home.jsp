<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import ="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Store</title>
    <link rel="stylesheet" type="text/css" href="HomeCss.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<body>

<div class="container">
    <div class="frame1">
        <div class="profileContainer">
            <button id="profileButton"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKhZ8-CWkdWfRVWfYPaBAxcyHIqAnG3N7-5vNvVT0hDq39I3ua9gPJmgai9WcJPhU8dr4&usqp=CAU"
                                             id="profileImg"/></button>
        </div>
        <div class="headingContainer">
            <label id="heading">Groceries</label>
        </div>
        <div class="cartContainer">
            <button id="cartButton"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2ECvUVo40V25AiQMpdOCLxWbE-u85Pz01XRYcNpekOA&s"
                                          id="cartImg"/></button>
        </div>
    </div>
    <div class="frame2">
        <div class="HomeContainer">
            <button id="Home">Home</button>    
        </div>
        <div class="categoryPriceSortContainer">
            <label id="categoryLabel">Category</label>
            <select id="category" name="Categories">
                <option value="0">Select</option>
            </select>
        
            <label id="PriceLabel">Price</label>
            <select id="Price" name="priceRange">
                <option value="0">Select</option>
                <option value="0-500">0-500</option>
                <option value="500-1500">500-1500</option>
                <option value="1500-3000">1500-3000</option>
                <option value="3000-above">3000-above</option>
            </select>
        
            <button id="Sort" >Sort</button>
        </div>
    </div>
    <div class="frame3" id="frame3" style="padding-top: 100px;overflow:auto;height: 330px;background-image: url('https://c8.alamy.com/comp/WCAYDC/fruits-seamless-background-food-cartoon-vector-illustration-WCAYDC.jpg');background-size: cover;background-repeat: no-repeat;align-items:center;justify-content:center;text-align:center;">
        <div class="descOfWeb" id="descContainer">
            <p id="webDesc">Welcome to our premium groceries website, where quality meets convenience. Browse through a
                curated selection of fresh produce, pantry staples, and gourmet treats. With user-friendly navigation and
                secure checkout, shopping for your essentials has never been easier. Enjoy swift delivery to your
                doorstep and elevate your culinary experience with every order. Join our community of discerning shoppers
                today and discover the ease and elegance of online grocery shopping.</p>
            <button id="AllProds" >Explore all our products</button>
        </div>
       <%--  <div class="Products" id="prod_div">
           
           <div class="Product">
                <img src="" id="prod_image"/>
                <label id="ProdName"></label>
                <div class="Desc">
                    <table>
                        <thead>
                            <tr>
                                <th>Prod ID</th>
                            </tr>
                            <tr>
                                <th>Prod Price</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <div class="Add">
                    <button id="AddButton">+</button>
                </div> --%>
            </div>
            
        </div>
    </div>
</div>

<script>

$(document).ready(function(){
	
	var pinCode;
	var product_price = [];
	 function toggleSortButton() {
	        var categoryValue = $("#category").val();
	        var priceRangeValue = $("#Price").val();
	        if (categoryValue !== "0" && priceRangeValue !== "0") {
	            $("#Sort").prop("disabled", false);
	        } else {
	            $("#Sort").prop("disabled", true);
	        }
	    }
		
	 $("#Home").click(function(){
		 window.location.href="Home.jsp";
	 })
	 
	    $.ajax({
	        url: "CategoryServlet",
	        type: "POST",
	        dataType: "json",
	        success: function(response){
	            console.log("categories received:", response);
	            populateDropdown(response);
	        },
	        error: function(xhr, status, error){
	            console.log("Error fetching cart categories:", error);
	        }
	    });

	    function populateDropdown(categories) {
	        var dropdown = $("#category"); 
	         
	        categories.forEach(function(category) {
	            dropdown.append('<option value="' + category.prod_category_id + '">' + category.prod_category_id + '</option>');
	        });
	    }

	    $("#category","#Price").change(function(){
	        toggleSortButton();
	    });

	    $("#Sort").click(function(){
	        console.log("Sorting products...");
	        var selectedCategoryValue = $("#category").val(); 
	        var selectedPriceValue = $("#Price").val(); 

	        $.ajax({
	            url: "ProductCategoryListServlet",
	            type: "POST",
	            data: { Categories: selectedCategoryValue, priceRange: selectedPriceValue}, 
	            dataType: "json",
	            success: function(response){
	                displayProducts(response);
	            },
	            error: function(xhr, status, error){
	                console.log("Error fetching products:", error);
	            }
	        });
	    });

    $("#AllProds").click(function(){
        console.log("Fetching products...");
        $.ajax({
            url: "ProductServlet", 
            type: "GET",
            dataType: "json",
            success: function(response){
                console.log("Products received:", response);
                console.log("hi");
                
                displayProducts(response);
            },
            error: function(xhr, status, error){
                console.log("Error fetching products:", error);
            }
        });
    });

    function displayProducts(products) {
        var prodDiv = $("#frame3");
        prodDiv.empty(); 
        console.log("hi-displayProducts1");

        products.forEach(function(product) {
            console.log("hidisplayProducts2 "+product.prod_name);
            $.get("ProductData.html", function(template) {
                var productHTML = template
                    .replace("{{prod_image}}", product.prod_image)
                    .replace("{{prod_name}}", product.prod_name)
                    .replace("{{prod_id}}", product.prod_id)
                    .replace("{{prod_price}}", product.prod_price)
                    .replace("{{prod_gst}}", product.prod_gst);
                prodDiv.append(productHTML);
            });
        });
    }
	
    function addToCart(prodPrice) {
        $.ajax({
            type: "GET",
            url: "OrderWiseShippingChargesServlet",
            data: { prodPrice: prodPrice },
            success: function(response) {
                
            },
            error: function(xhr, status, error) {
                
            }
        });
    }
    
    $("#frame3").on("click", ".AddToCart", (event) => {
       pinCode = prompt("Please enter your pin code:");
        if (pinCode != null) {
            $.ajax({
                url: 'SerivecableRegionServlet',
                type: 'POST',
                data: { pincode: pinCode },
                success: function(response) {
                    if (response === true) {
                        console.log("pincode is valid");
                        var product = $(event.target).closest(".Product");
                        var productName = product.find("#ProdName").text();
                        var productImage = product.find("#prodImage").attr("src");
                        var productPrice = product.find("#ProdPrice").text();
                        var productGST = product.find("#ProdGST").text();
                        var cart = JSON.parse(localStorage.getItem('cart')) || [];
                        cart.push({
                            name: productName,
                            image: productImage,
                            price: productPrice,
                            gst:productGST,
                            pincode:pinCode,
                            quantity:quantity
                        });
                        localStorage.setItem('cart', JSON.stringify(cart));
                        alert('Product added to cart!');
                    } else {
                        alert('This service is not available for this location!');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error occurred while verifying pin code:", error);
                }
            });
        }
    });

    
    function displayCart() {
        var cart = JSON.parse(localStorage.getItem('cart'));
        var cartDiv = $("#frame3");
        cartDiv.empty();

        if (cart && cart.length > 0) {
            cart.forEach(function(item) {
                $.get("cartItemData.html", function(template) {
                    var cartItemHTML = template
                        .replace("{{image}}", item.image)
                        .replace("{{name}}", item.name)
                        .replace("{{price}}", item.price)
                        .replace("{{gst}}", item.gst)
                        .replace("{{pincode}}", item.pincode)
                        .replace("{{quantity}}", item.quantity);
                    cartDiv.append(cartItemHTML);
                });
            });
            cartDiv.append('<button id="placeOrderButton">Place Order</button>');
        } else {
            cartDiv.append('<p>Your cart is empty.</p>');
        }
    }

    $("#cartButton").click(function() {
        displayCart();
    });
    
    function clearCartItem(productName) {
        var cart = JSON.parse(localStorage.getItem('cart')) || [];
        var updatedCart = cart.filter(function(item) {
            return item.name !== productName;
        });
        localStorage.setItem('cart', JSON.stringify(updatedCart));
        displayCart();
    }

    $(document).on("click", "#clearCartButton", function() {
        var productName = $(this).closest(".CartItem").find(".CartItemName").text().split(':')[1].trim();
        clearCartItem(productName);
    });
  
    
    function updateCartItemQuantity(productName, quantity) {
        var cart = JSON.parse(localStorage.getItem('cart')) || [];
        cart.forEach(function(item) {
            if (item.name === productName) {
                item.quantity = quantity;
            }
        });
        localStorage.setItem('cart', JSON.stringify(cart));
    }
    
    var quantity = 1;
   $("#frame3").on("click", "#remove", function() {
        var quantityElement = $(this).siblings(".quantity");
        
        if (quantity > 1) {
            quantity--;
            quantityElement.text(quantity);
            var productName = $(this).closest(".CartItem").find(".CartItemName").text().split(':')[1].trim();
            updateCartItemQuantity(productName, quantity);
        }
    });

    $("#frame3").on("click", "#add", function() {
        var quantityElement = $(this).siblings(".quantity");
        
        quantity++;
        quantityElement.text(quantity);
        var productName = $(this).closest(".CartItem").find(".CartItemName").text().split(':')[1].trim();
        updateCartItemQuantity(productName, quantity);
    })
    
    
    var t;
    function placeOrderPage() {
    	var cart = JSON.parse(localStorage.getItem('cart'));
    	var cartDiv = $("#frame3");
    	cartDiv.empty();

    	if (cart && cart.length > 0) {
        	var totalAmount = 0;
        	var i = 0;
        	var orderDetailsHTML = '';
        	cart.forEach(function(item) {
            	var productName = item.name;
            	var productPrice = parseInt(item.price);
            	var productQuantity = item.quantity;
           		var productGST = parseFloat(item.gst);
           		var pincode = parseInt(item.pincode); 
            	var shippingCharges = [100,200,200,200,100];
            	var prod_price = (productPrice + productGST) * productQuantity;
            	var totalPrice =  prod_price + shippingCharges[i];
            	totalAmount += totalPrice;
            	orderDetailsHTML += '<tr style="padding:10px;"><td style="padding:10px;">' + productName + '</td><td style="padding:10px;">' + productPrice + '</td><td style="padding:10px;">' + productQuantity + '</td><td style="padding:10px;">' + productGST + '</td><td style="padding:10px;">' + pincode + '</td><td style="padding:10px;">' + shippingCharges[i] + '</td></tr>';        
            	i++;
        	});
           
        	$.get("OrderDetailsData.html", function(template) {
            	var orderDetailsHTMLFinal = template
                .replace("{{order_details}}", orderDetailsHTML)
                .replace("{{total_amount}}", totalAmount);
            	cartDiv.append(orderDetailsHTMLFinal);
            	t=parseInt(totalAmount);
            	t=t*100;
        });
       
   		} else {
        	cartDiv.append('<p>Your cart is empty.</p>');
    	}
	}

    $("#frame3").on("click","#checkoutButton",function(){
        var options = {
            "key": "rzp_test_WNcd5pCY6iUGCI", // Enter the Key ID generated from the Dashboard
            "amount": t,
            "currency": "INR",
            "description": "Acme Corp",
            "image": "https://s3.amazonaws.com/rzp-mobile/images/rzp.jpg",
            "prefill": {
                "email": "gaurav.kumar@example.com",
                "contact": +919900000000,
            },
            config: {
                display: {
                    blocks: {
                        utib: { //name for Axis block
                            name: "Pay using Axis Bank",
                            instruments: [
                                {
                                    method: "card",
                                    issuers: ["UTIB"]
                                },
                                {
                                    method: "netbanking",
                                    banks: ["UTIB"]
                                },
                            ]
                        },
                        other: { //  name for other block
                            name: "Other Payment modes",
                            instruments: [
                                {
                                    method: "card",
                                    issuers: ["ICIC"]
                                },
                                {
                                    method: 'netbanking',
                                }
                            ]
                        }
                    },
                    hide: [
                        {
                            method: "upi"
                        }
                    ],
                    sequence: ["block.utib", "block.other"],
                    preferences: {
                        show_default_blocks: false // Should Checkout show its default blocks?
                    }
                }
            },
            "handler": function (response) {
                var cartDiv = $("#frame3");
                cartDiv.empty();
                var Success = '<div id="payment_success" style="margin: auto;width:300px;height:400px;display:flex;align-items:center;justify-content:center;"><button id="RedirectToHome"><image src="https://cashfreelogo.cashfree.com/website/landings/instant-settlements/payment-done.png" style="width:200px;height:200px;padding:20px;"></button></div>'
                cartDiv.append(Success);
            },
            "modal": {
                "ondismiss": function () {
                    if (confirm("Are you sure, you want to close the form?")) {
                        txt = "You pressed OK!";
                        console.log("Checkout form closed by the user");
                    } else {
                        txt = "You pressed Cancel!";
                        console.log("Complete the Payment")
                    }
                }
            }
        };
        var rzp1 = new Razorpay(options);
        rzp1.open();
        e.preventDefault();
    });
    
    $("#frame3").on("click", "#RedirectToHome", function() {
    	window.location.href="Home.jsp";        
    });

	
    $("#frame3").on("click", "#placeOrderButton", function() {
    	placeOrderPage();
        
    });
    
});
</script>

</body>
</html>