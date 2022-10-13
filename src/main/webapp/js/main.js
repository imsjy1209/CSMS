//Open Cart
$(document).on('click','#cart-icon',function(){ 
	$(".cart").addClass("active");
	})

// Close Cart
$(document).on('click','#close-cart',function(){ 
	$(".cart").removeClass("active");
	})


// $(document).on('change','.cart-quantity',function(){
// 	quantityChanged();
// })


$(".shop-content").on('click','.add-cart',function(){
	var title = $(this).siblings("h2").text();
	var course_id = $(this).siblings(".course-id").text();
	var price = $(this).siblings(".price").text();
	var productImg = $(this).siblings(".product-img").attr("src");
	
	addProductToCart(title,course_id, price, productImg);
    updatetotal();
})



$(document).on('click','.btn-buy',function(){
//	buyButtonClicked();

    alert('Your Order is placed')
    console.log();
//    console.log($(this));
    
    var father = $(this).siblings('.cart-content').children();
//    console.log(father);
//    console.log(father.length);
//    
//    console.log(father.eq(0));
//    console.log(father.eq(0).find('.detail-box'))
//    console.log(father.eq(0).find('.detail-box').find('span').text())
    
    for(var i=0;i<father.length;i++){
	var courseId = father.eq(i).find('.detail-box').find('span').text();
	 console.log(courseId);
	 
	 
	 
	 var cartContent = document.getElementsByClassName('cart-content')[0]
	 cartContent.removeChild(cartContent.firstChild);
	
}
    
//    var cartContent = document.getElementsByClassName('cart-content')[0]
//    while (cartContent.hasChildNodes()) {
//        cartContent.removeChild(cartContent.firstChild);
//    }
    updatetotal();

})

//Buy Button
//function buyButtonClicked() {
//    alert('Your Order is placed')
//    console.log();
//    console.log($(this));
////    var cartContent = document.getElementsByClassName('cart-content')[0]
////    while (cartContent.hasChildNodes()) {
////        cartContent.removeChild(cartContent.firstChild);
////    }
////    updatetotal();
//}



//Quantity Changes
// function quantityChanged() {
//     var input = event.target
//     if (isNaN(input.value) || input.value <= 0) {
//         input.value = 1
//     }
//     updatetotal();
// }




function addProductToCart(title,course_id, price, productImg) {

	for (var i = 0; i < $(".cart-product-title").length; i++) {
	    if ($(".cart-product-title")[i].innerText == title) {
	        alert('You have already add this Product to cart');
	        return;
	    }
	}
   var cartBoxContent ="<div class='cart-box'><img src=" + productImg + " class='cart-img'>" +
"<div class='detail-box'><span hidden='hidden'>" + course_id + "</span><div class='cart-product-title'>" + title + "</div>" +
    "<div class='cart-price'>" + price + "</div>" +
    "</div><i class='bx bxs-trash-alt cart-remove'></i></div>";
//     <input type='number' value='1' class='cart-quantity'>
$(".cart-content").append(cartBoxContent);

//Remove Items From Cart
$(".cart-remove").click(function(){
	$(this).closest(".cart-box").remove();
	 updatetotal();
})
}

//Update Total
function updatetotal() {
    var cartContent = document.getElementsByClassName('cart-content')[0];
    var cartBoxes = cartContent.getElementsByClassName('cart-box');
    var total = 0;
    for (var i = 0; i < cartBoxes.length; i++) {
        var cartBox = cartBoxes[i];
        var priceElement = cartBox.getElementsByClassName('cart-price')[0];
//        var quantityElement = cartBox.getElementsByClassName('cart-quantity')[0];
        var price = parseFloat(priceElement.innerText.replace("$", ""));
//         var quantity = quantityElement.value;
//         total = total + (price * quantity);
           total = total + price;
    }
    //If price Contain some Cents Value
    total = Math.round(total * 100) / 100
    document.getElementsByClassName('total-price')[0].innerText = "$" + total;

}