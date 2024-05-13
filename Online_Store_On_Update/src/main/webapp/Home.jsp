<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import ="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Store On update</title>
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
            </div>
            
        </div>
    </div>
</div>

<script>

$(document).ready(function(){
	
	var notDeliverableProducts = [];
	var pincode;
	var prod_price = 0;
	
	var totalAmount = 0;
	var shippingChargesTotal = 0;
	var shippingChargesGst = 0;
	var shippingChargesTotalGST = 0;
	var shippingCharges = 0;
	var ProductGST = 0;
	var shippingChargesGSTArray = [];
	var product_price = [];
	var i = 0;
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
	            dropdown.append('<option value="' + category.prod_category_id + '">' + category.prod_category_name + '</option>');
	        });
	    }

	    $("#category","#Price").change(function(){
	        toggleSortButton();
	    });

	    $("#Sort").click(function(){
	        console.log("Sorting products...");
	        var selectedCategoryValue = $("#category").val(); 
	        var selectedPriceValue = $("#Price").val(); 
			console.log(selectedCategoryValue);
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
	    console.log(products.length);
	    products.forEach(function(product) {
	        console.log("hidisplayProducts2 " + product.prod_name);
	        $.get("ProductData.html", function(template) {
	            $.ajax({
	                url: "HsnCodeServlet",
	                type: "POST",
	                data: {
	                    hsn_code: product.prod_hsn_code
	                },
	                dataType: "json",
	                success: function(response) {
	                	var gstPercent = response;
	                    var newprodPrice = product.prod_price / (1 + gstPercent / 100);
	                    var gst = product.prod_price - newprodPrice;
	                    
	                    var productHTML = template
	                        .replace("{{prod_image}}", product.prod_image)
	                        .replace("{{prod_name}}", product.prod_name)
	                        .replace("{{prod_id}}", product.prod_id)
	                        .replace("{{prod_discount}}", product.prod_discount)
	                        .replace("{{prod_price}}", newprodPrice.toFixed(2).toString())
	                        .replace("{{prod_hsn_code}}", product.prod_hsn_code)
	                        .replace("{{prod_gst}}", gst.toFixed(2).toString())
	                        .replace("{{total_price}}",product.prod_price);                   
	                    
	                    prodDiv.append(productHTML);
	                },
	                error: function(response) {
	                    console.error("Error occurred while fetching GST for product:", response);
	                }
	            });
	        });
	    });
	}

    
    $("#frame3").on("click", ".AddToCart", (event) => {
     
      	var product = $(event.target).closest(".Product");
      	var productId = product.find("#ProdID").text();
        var productName = product.find("#ProdName").text();
        var productImage = product.find("#ProdImage").attr("src");
        var productPrice = product.find("#ProdPrice").text();
        var productHsnCode = product.find("#ProdHsnCode").text();
        var productGst = product.find("#ProdGst").text();
        var productDiscount= product.find("#ProdDiscount").text();
        var productTotPrice = product.find("#ProdTotPrice").text();
        var cart = JSON.parse(localStorage.getItem('cart')) || [];
        console.log("discount "+productDiscount);
        
        cart.push({
        	 id:productId,
             name: productName,
             image: productImage,
             price: productPrice,
             hsnCode:productHsnCode,
             gst:productGst,
             totPrice:productTotPrice,
             quantity:quantity,
             discount:productDiscount,
             pincode:pincode
       });
       localStorage.setItem('cart', JSON.stringify(cart));
       alert('Product added to cart!');        
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
                        .replace("{{id}}", item.id)
                        .replace("{{name}}", item.name)
                        .replace("{{price}}", item.price)
                        .replace("{{hsnCode}}", item.hsnCode)
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
    
    function checkDeliverability(pincode){
    	var cart = JSON.parse(localStorage.getItem('cart')) || [];
        var itemIds = cart.map(function(item) {
            return item.id;
        });
		console.log(itemIds);
        $.ajax({
            url: 'UnSeriveceableRegionServlet',
            type: 'POST',
            dataType: 'json',
            data:{ 
                pincode: pincode,
                itemIds: itemIds
            },                
            success: function(response) {
                console.log("Unserviceable regions:", response);
                
                Object.entries(response).forEach(([productId, isDeliverable]) => {
                    if (isDeliverable) {
                        $("#" + productId).prop('disabled', true);
                        notDeliverableProducts.push(productId);
                    }
                });
                if (notDeliverableProducts.length > 0) {
                    alert("Products with IDs " + notDeliverableProducts.join(", ") + " are not deliverable to this location.");
					
                    $(".CartItem").each(function() {
                        var itemId = $(this).attr('.CartItemId');
                        if (notDeliverableProducts.includes(itemId)) {
                            $(this).css('opacity', '0.5');
                        }
                    });
                    $("#placeOrderButton").prop('disabled', true);
                } else {
                    $("#placeOrderButton").prop('disabled', false);
                }
                
                
            },
            error: function(xhr, status, error) {
                console.error("Error occurred while verifying pin code:", error);
            }
        });
        notDeliverableProducts = [];
    }

    $("#cartButton").click(function() {
        displayCart(); 
		
        pincode = prompt("Enter the pincode of location:");
        if (pincode != null) {
        	checkDeliverability(pincode);
        }
    });

    
    function clearCartItem(productName) {
        var cart = JSON.parse(localStorage.getItem('cart')) || [];
        var updatedCart = cart.filter(function(item) {
            return item.name !== productName;
        });
        localStorage.setItem('cart', JSON.stringify(updatedCart));
        displayCart();
        checkDeliverability(pincode);
    }

    $(document).on("click", "#clearCartButton", function() {
        var productName = $(this).closest(".CartItem").find(".CartItemName").text();
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
            var productName = $(this).closest(".CartItem").find(".CartItemName").text();
            updateCartItemQuantity(productName, quantity);
        }
    });

    $("#frame3").on("click", "#add", function() {
        var quantityElement = $(this).siblings(".quantity");
        
        quantity++;
        quantityElement.text(quantity);
        var productName = $(this).closest(".CartItem").find(".CartItemName").text();
        updateCartItemQuantity(productName, quantity);
    })
    
    
    var t;
    var prod_price_with_discount;
    var prod_price_with_discount_gst;
    var totalPrice = 0;
    function placeOrderPage() {
    	var cart = JSON.parse(localStorage.getItem('cart'));
    	var cartDiv = $("#frame3");
    	cartDiv.empty();
    	if (cart && cart.length > 0) {
        	
        	var orderDetailsHTML = '';
        	cart.forEach(function(item) {
            	var productName = item.name;
            	var productPrice = parseFloat(item.price);
            	var productId = item.id;
            	var productQuantity = parseInt(item.quantity);
           		var productHsnCode = item.hsnCode;
           		var productGst = parseFloat(item.gst);
           		var productDiscount = parseFloat(item.discount);
           		var productTotalprice= parseInt(item.totPrice);         	
           		console.log("discount 1 "+productDiscount);
           		prod_price_with_discount = productPrice - (productPrice*(productDiscount/100));
           		
           		prod_price_with_discount_gst = (productPrice * productGst)/prod_price_with_discount;
           		
           		product_Total_Price_with_discount_gst = (prod_price_with_discount + prod_price_with_discount_gst)* productQuantity;
           		
           		prod_price = prod_price + product_Total_Price_with_discount_gst;
           		
            	console.log("prod_price with quantity 1 "+prod_price);
            	
            	
        	});
        	$.ajax({
        		url:"OrderWiseShippingChargesServlet",
        		type:"POST",
        		data:{
        			productPrice: parseInt(prod_price)
        		},
        		dataType:"json",
        		success: function(response){
        			shippingChargesTotal = response;
        			console.log("shipping charges for "+prod_price+" is : "+ shippingChargesTotal);
        			totalAmount = prod_price + shippingChargesTotal;
        			console.log("TotalAmount with shipping charges "+totalAmount);
        			
        			i = 0;
        			cart.forEach(function(item) {
        				console.log("Hi1");
        				var productName = item.name;
                    	var productPrice = parseFloat(item.price);
                    	var productId = item.id;
                    	var productQuantity = parseInt(item.quantity);
                   		var productHsnCode = item.hsnCode;
                   		var productGst = parseFloat(item.gst);
                   		var productDiscount = parseFloat(item.discount);
                   		var productTotalprice= parseInt(item.totPrice);
                   		console.log("discount 2 "+productDiscount);
                   		prod_price_with_discount = productPrice - (productPrice*(productDiscount/100));
                   		
                   		prod_price_with_discount_gst = (productPrice * productGst)/prod_price_with_discount;
                   		
                   		product_Total_Price_with_discount_gst = (prod_price_with_discount + prod_price_with_discount_gst)* productQuantity;
                   		
                   		prod_price = prod_price + product_Total_Price_with_discount_gst;
                   		
                    	console.log("prod_price with quantity 1 "+prod_price);
                         	
                    	shippingCharges = (product_Total_Price_with_discount_gst / prod_price) * shippingChargesTotal;
                    	shippingChargesTotalGst = shippingChargesTotal;
                    	console.log("pincode "+pincode);
                    	$.ajax({                    		
        	                url: "HsnCodeServlet",
        	                type: "POST",
        	                data: {
        	                    hsn_code: productHsnCode
        	                },
        	                dataType: "json",
        	                success: function(response) {
        	                	console.log("pincode "+pincode);
        	                	ProductGST = response;
        	                	shippingChargesGst = shippingCharges * (ProductGST /100);
        	                	console.log("shippingCharges gst "+shippingChargesGst);
        	                	shippingChargesTotalGst = shippingChargesTotalGst + shippingChargesGst;
        	                	console.log("shippingCharges total gst "+shippingChargesTotalGst);
        	                	console.log("Hi2");
        	                	orderDetailsHTML += '<tr style="padding:10px;"><td style="padding:10px;">' + productId + '</td><td style="padding:10px;">' + productName + '</td><td style="padding:10px;">' + productPrice + '</td><td style="padding:10px;">' + productGst + '</td><td style="padding:10px;">' + productTotalprice + '</td><td style="padding:10px;">' + productHsnCode + '</td><td style="padding:10px;">' + productQuantity +'</td><td style="padding:10px;">' + productDiscount + '</td><td style="padding:10px;">' + product_Total_Price_with_discount_gst.toFixed(2) + '</td><td style="padding:10px;">' + shippingCharges.toFixed(2) + '</td><td style="padding:10px;">' + shippingChargesGst.toFixed(2) + '</td></tr>';
        	                	$.get("OrderDetailsData.html", function(template) {
        	                		console.log("pincode "+pincode);
        	                    	var orderDetailsHTMLFinal = template
        	                    	.replace("{{shippingCharges}}",shippingChargesTotalGst)
        	                    	.replace("{{pincode}}",pincode)
        	                        .replace("{{order_details}}", orderDetailsHTML)
        	                        .replace("{{total_amount}}", totalAmount);
        	                    	cartDiv.append(orderDetailsHTMLFinal);
        	                    	t=parseInt(totalAmount);
        	                    	t=t*100;
        	                    	
        	                    	setTimeout(function() {
        	                            // Check for discount eligibility and apply discount if necessary
        	                            if (totalAmount > 500) {
        	                                applyDiscount(totalAmount, 30); // Apply 30% discount for totalAmount > 500
        	                            }
        	                            
        	                            if (totalAmount > 1000) {
        	                                applyDiscount(totalAmount, 40); // Apply 40% discount for totalAmount > 1000
        	                            }
        	                            
        	                            if (totalAmount > 1500) {
        	                                applyDiscount(totalAmount, 50); // Apply 50% discount for totalAmount > 1500
        	                            }
        	                            
        	                            if (totalAmount > 2000) {
        	                                applyDiscount(totalAmount, 60); // Apply 60% discount for totalAmount > 2000
        	                            }
        	                        }, 5000); 
        	                	});
        	                	
        	                },
        	                error: function(response) {
        	                    console.error("Error occurred while fetching GST for product:", response);
        	                }
        	            });
                	});
        		},
        		error:function(xhr, status, error){
        			console.error("Error occured"+ error);
        		}
        	});
        	
           	} else {
        	cartDiv.append('<p>Your cart is empty.</p>');
    	}
	}
    
    function applyDiscount(totalAmount, discountPercentage) {
        if (confirm("A discount coupon of " + discountPercentage + "% is available. Do you want to apply it?")) {
            
            $.ajax({
                url: "DiscountCouponServlet",
                type: "POST",
                data: {
                    discountPercentage: discountPercentage
                },
                success: function(response) {
                    // Handle success response
                    alert("Discount coupon applied successfully!");
                },
                error: function(xhr, status, error) {
                    console.error("Error occurred while applying discount coupon:", error);
                    alert("Error occurred while applying discount coupon. Please try again later.");
                }
            });
        } else {
            // Do nothing or handle cancellation
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