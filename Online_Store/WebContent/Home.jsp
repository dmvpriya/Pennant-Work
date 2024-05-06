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
        console.log();
        products.forEach(function(product) {
            console.log("hidisplayProducts2 "+product.prod_name);
            var productHTML = '<div class="Product" style="width:80%;height:50%;margin-top:10px;margin-bottom:10px;margin-left:150px;display: flex;flex-direction: row;align-items: center;justify-content: center;text-align: center;padding: 10px;border: 1px solid #ccc;border-radius: 5px;background-color: #a6c7a7;overflow:auto">' +
                                '<img src="' + product.prod_image + '" id="prodImage" style="width: 80px; height: 100px; margin-right: 20px;"/>' +
                                '<label id="ProdName" style="margin-bottom: 10px;">' + product.prod_name + '</label>' +
                                '<div class="Desc" style="width: 100%;">' +
                                    '<table>' +
                                        '<thead>' +
                                            '<tr>' +
                                                '<th style="width:200px;height:10px;padding-left:40px">Prod ID: ' + product.prod_id + '</th>' +
                                            '</tr>' +
                                            '<tr>' +
                                                '<th style="width:200px;height:10px;padding-left:40px" id="ProdPrice">' + product.prod_price + '</th>' +
                                            '</tr>' +
                                        '</thead>' +
                                    '</table>' +
                                '</div>' +
                                '<div class="Add">' +
                                    '<button class="AddToCart" style="font-size: 16px;width:100px;heigth:20ps;">Add to Cart</button>' +
                                '</div>' +
                            '</div>';
            prodDiv.append(productHTML);
        });
    }
    
    $("#frame3").on("click", ".AddToCart", function() {
        var product = $(this).closest(".Product");
        var productName = product.find("#ProdName").text();
        var productImage = product.find("#prodImage").attr("src");
        var productPrice = product.find("#ProdPrice").text(); 
        var cart = JSON.parse(localStorage.getItem('cart')) || [];
        console.log("hi-addtocartClick")
        cart.push({
            name: productName,
            image: productImage,
            price: productPrice
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
            	console.log("displayCart : "+item.name);
                var cartItemHTML = '<div class="CartItem" style="background-color:#a6c7a7; padding:10px;width:200px;height:200px;margin-left:590px;margin-right:600px;">' +
                							
                                        '<img src="' + item.image + '" class="CartItemImg" style="width:100px;height:100px;">' +
                                        
                                        '<div class="CartItemInfo" style="background-color:white;height:100px;">' +
                                        		'<label class="CartItemName" style="padding:10px;">Product :' + item.name + '</label>' +
            									'<label class="CartItemPrice" >Price :' + item.price + '</label>' +
            									'<div class="totalAmount" style="background-color:#a6c7a7;">'+
                                            	
                                                '</div>'+
                                        '</div>' +
                                        
                                    '</div>';
                cartDiv.append(cartItemHTML);
                
                
            });
            cartDiv.append('<button id="placeOrderButton" >Place Order</button>');
        } else {
            cartDiv.append('<p>Your cart is empty.</p>');
        }
    }

    $("#cartButton").click(function() {
        displayCart();
    });
    
   
});
</script>

</body>
</html>