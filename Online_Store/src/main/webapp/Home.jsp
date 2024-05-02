<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
body {
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        width:100%;
        height: 100vh;
        background-color: #f0f0f0;
    }
    .container {
        padding: 10px;
        border: 1px solid #ccc;
        width:1500px;
        height:600px;
    }
    .frame1, .frame2, .frame3 {
        margin-bottom: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .frame1 {
        border-bottom: 1px solid #ccc;
    }
    .frame2, .frame3 {
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        padding: 20px 0;
    }
    .frame3 {
        padding-top: 20px;
        height:350px;
    }
    .profileContainer, .headingContainer, .cartContainer {
        text-align: center;
    }
    .profileContainer{
        padding-right:400px;
    }
    .headingContainer{
        padding-right:100px;
        padding-left:100px;
        font-size:60px;
    }
    .cartContainer{
        padding-left:400px;
    }
    #profileImg,#cartImg{
        width:80px;
        height:100px;
        border-radius:20px;
    }
    .categoryContainer {
        padding-right: 370px;
    }

    .priceContainer {
         padding-right: 100px;
        padding-left: 100px;
    }
    .sortContainer {
         padding-left: 430px;
    }
    .category, .Price, .Sort, .Products, .Product, .Add {
        text-align: center;
    }
    table {
        width: 100%;
    }
    table th, table td {
        border: 1px solid #ccc;
        padding: 8px;
    }
    .Product{
        display:flex;
    }
    .descOfWeb {
        display: block;
    }
    .Products {
        display: none;
    }
</style>
<body>
    <div class="container">
        <div class="frame1">
            <div class="profileContainer">
                <button id="profileButton"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKhZ8-CWkdWfRVWfYPaBAxcyHIqAnG3N7-5vNvVT0hDq39I3ua9gPJmgai9WcJPhU8dr4&usqp=CAU" id="profileImg" /></button>
            </div>
            <div class="headingContainer">
                <label id="heading">Groceries</label>
            </div>
            <div class="cartContainer">
                <button id="cartButton"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2ECvUVo40V25AiQMpdOCLxWbE-u85Pz01XRYcNpekOA&s" id="cartImg" /></button>
            </div>
        </div>
        <div class="frame2">
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
                <button id="Sort" onclick="showProducts()">Sort</button>
            </div>
        </div>
        <div class="frame3">        
            <div class="descOfWeb">
                <p id="webDesc">Welcome to our premium groceries website, where quality meets convenience. Browse through a curated selection of fresh produce, pantry staples, and gourmet treats. With user-friendly navigation and secure checkout, shopping for your essentials has never been easier. Enjoy swift delivery to your doorstep and elevate your culinary experience with every order. Join our community of discerning shoppers today and discover the ease and elegance of online grocery shopping.</p>
            </div>
            <div class="Products" id="prod_div">
                <div class="Product">
                    <image src="" id="prod_image"/>
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
                        <button id="AddButton" >+</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
	window.onload = function(){
		populateCategory();
	}
	
	function populateCategory(){
		String categoryValue = document.getElementById('category').value;
		
		xhr = XMLHttpRequest();
	}

    function showProducts() {
        var descOfWeb = document.querySelector('.descOfWeb');
        var products = document.querySelector('.Products');

        descOfWeb.style.display = 'none';
        products.style.display = 'block';
    }
</script>
</html>
