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
        <div class="categoryContainer">
            <label id="categoryLabel">Category</label>
            <select id="category" name="Categories">
                <option value="0">Select</option>
            </select>
        </div>
        <div class="priceContainer">
            <label id="PriceLabel">Price</label>
            <select id="Price">
                <option value="0">Select</option>
                <option value="0-500">0-500</option>
                <option value="500-1500">500-1500</option>
                <option value="1500-3000">1500-3000</option>
                <option value="3000-above">3000-above</option>
            </select>
        </div>
        <div class="sortContainer">
            <button id="Sort" >Sort</button>
        </div>
    </div>
    <div class="frame3">
        <div class="descOfWeb">
            <p id="webDesc">Welcome to our premium groceries website, where quality meets convenience. Browse through a
                curated selection of fresh produce, pantry staples, and gourmet treats. With user-friendly navigation and
                secure checkout, shopping for your essentials has never been easier. Enjoy swift delivery to your
                doorstep and elevate your culinary experience with every order. Join our community of discerning shoppers
                today and discover the ease and elegance of online grocery shopping.</p>
            <button id="AllProds" >Explore all our products</button>
        </div>
        <div class="Products" id="prod_div">
           
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
                </div>
            </div>
            
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
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
            var prodDiv = $("#prod_div");
            prodDiv.empty(); 
            console.log("hi");
            products.forEach(function(product) {
            	console.log("hi");
                var productHTML = '<div class="Product">' +
                                    '<img src="' + product.prodImage + '" id="prod_image"/>' +
                                    '<label id="ProdName">' + product.prodName + '</label>' +
                                    '<div class="Desc">' +
                                        '<table>' +
                                            '<thead>' +
                                                '<tr>' +
                                                    '<th>Prod ID: ' + product.prodId + '</th>' +
                                                '</tr>' +
                                                '<tr>' +
                                                    '<th>Prod Price: ' + product.prodPrice + '</th>' +
                                                '</tr>' +
                                            '</thead>' +
                                        '</table>' +
                                    '</div>' +
                                    '<div class="Add">' +
                                        '<button id="AddButton">+</button>' +
                                    '</div>' +
                                '</div>';
                prodDiv.append(productHTML);
            });
        }
    });
</script>

</body>
</html>