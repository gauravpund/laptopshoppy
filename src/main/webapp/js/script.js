
// First request:- to server to create order

const paymentStart=()=>{
   console.log("Payment started")
   let amount=$("#payment_field").val();
   console.log("amount",amount);
   if(amount=='' || amount==null)
   {
    // alert("Amount is required");
    swal("Failed !!", "Amount is required !!", "error");
    return;
   }
   //code ....
   // We will use ajax to send request to server to create order

   $.ajax(
    {
		type:'POST',
        url:'YourServlet',
        data:JSON.stringify({amount:amount,info:'order_request'}),
        contentType: "application/json",
        dataType:'json',
        success:function(response)
        {
            //invoked where success
            console.log("Success ....")
             console.log("Server Response: ",response);
             console.log("amount=",response.amount);
             console.log("Amount paid=",response.order)
             if(response.status=='created')
             {
                // open payment Form
                let options=
                {
                    key:'rzp_test_Ua38sUYvjJibMu',
                    amount:response.amount,
                    currency:'INR',
                    name:'laptopshoppy PVT.LTD',
                    description:'Donation',
                    image:'https://cdn.shopify.com/static/shopify-favicon.png',
                    order_id:response.id,
                    handler:function(response)
                    {
                        console.log(response.razorpay_payment_id)
                        console.log(response.razorpay_order_id)
                        console.log(response.razorpay_signature)
                        console.log("Payment successful!!")

                        updatePaymentOnServer(response.razorpay_payment_id,response.razorpay_order_id,"paid")
                        // alert("Congrats !! Payment successful !!")
                        swal("Good job!", "Congrates !! Payment successful !!", "success");
                    },
                    prefill: 
                    {
                    name: "",
                    email: "",
                    contact: ""
                    },
                    notes: 
                    {
                        address: "Gaurav & Mayuresh Software"
                        
                    },
                    theme: 
                        {
                            "color": "#3399cc"
                        },
                };
                let rzp=new Razorpay(options);

                rzp.on('payment.failed', function (response)
                {
                    console.log(response.error.code);
                    console.log(response.error.description);
                    console.log(response.error.source);
                    console.log(response.error.step);
                    console.log(response.error.reason);
                    console.log(response.error.metadata.order_id);
                    console.log(response.error.metadata.payment_id);
                    // alert("Oops payment failed")
                    swal("Failed !!", "Oops payment failed !!", "error");

                });

                rzp.open()


            }
        },
        error:function(error)
        {
            //invoked when error
            console.log(error);
            alert("Something went wrong")
        }
    }
   )
};

updatePaymentOnServer(payment_id,order_id,statuss)
{
    $.ajax({
        type:'POST',
        url:'YourServlet',
        data:JSON.stringify({
            payment_id:payment_id,
            order_id:order_id,
            status:statuss,
        }),
        contentType: "application/json",
        dataType:'json',
        success:function(response)
        {
            swal("Good job!", "Congrates !! Payment successful !!", "success");
        },
        error:function(error)
        {
            swal("Failed !!", "Your payment is successful, but we did not get on server,we will contact you as soon as possible !!", "error");
        }
    })
}


// function paymentStart()
// {
//     console.log("Payment started");
//     alert("Payment started");
// }

// function add_to_cart(pid, pname, price)
// {
//     let cart = localStorage.getItem("cart");
    
//     if (cart == null)
//     {
//         //no cart yet  
//         let products = [];
//         let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
//         products.push(product);
//         localStorage.setItem("cart", JSON.stringify(products));
// 		//console.log("Product is added for the first time")
//         showToast("Item is added to cart")
//     } 
//     else
//     {
//         //cart is already present
//         let pcart = JSON.parse(cart);

//         let oldProduct = pcart.find((item) => item.productId == pid)
//         console.log(oldProduct)
//         if (oldProduct)
//         {
//             //we have to increase the quantity
//             oldProduct.productQuantity = oldProduct.productQuantity + 1
//             pcart.map((item) => {

//                 if (item.productId === oldProduct.productId)
//                 {
//                     item.productQuantity = oldProduct.productQuantity;
//                 }
//         })
        
//         localStorage.setItem("cart", JSON.stringify(pcart));
//         console.log("Product quantity is increased")
//         showToast(oldProduct.productName + " quantity is increased , Quantity = " + oldProduct.productQuantity)

//         } 
//         else
//         {
//             //we have add the product
//             let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
//             pcart.push(product)
//             localStorage.setItem("cart", JSON.stringify(pcart));
//             console.log("Product is added")
//             showToast("Product is added to cart")
//         }
//     }
//     updateCart();
// }

// //update cart:

// function updateCart()
// {
//     let cartString = localStorage.getItem("cart");
//     let cart = JSON.parse(cartString);
//     if (cart == null || cart.length == 0)
//     {
//         console.log("Cart is empty !!")
//         $(".cart-items").html("( 0 )");
//         $(".cart-body").html("<h3>Cart does not have any items </h3>");
//         $(".checkout-btn").attr('disabled', true)
//     } 
//     else
//     {


//         //there is some in cart to show
//         console.log(cart)
//         $(".cart-items").html(`( ${cart.length} )`);
//         let table = `
//             <table class='table'>
//             <thead class='thread-light'>
//                 <tr>
//                 <th>Item Name </th>
//                 <th>Price </th>
//                 <th>Quantity </th>
//                 <th>Total Price </th>
//                 <th>Action</th>
                
        
//                 </tr>
        
//             </thead>

        


//             `;

//         let totalPrice = 0;
//         cart.map((item) => {


//             table += `
//                     <tr>
//                         <td> ${item.productName} </td>
//                         <td> ${item.productPrice} </td>
//                         <td> ${item.productQuantity} </td>
//                         <td> ${item.productQuantity * item.productPrice} </td>
//                         <td> <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button> </td>    
//                      </tr>
//                  `

//             totalPrice += item.productPrice * item.productQuantity;

//         })




//         table = table + `
//             <tr><td colspan='5' class='text-right font-weight-bold m-5'> Total Price : ${totalPrice} </td></tr>
//          </table>`
//         $(".cart-body").html(table);
//         $(".checkout-btn").attr('disabled', false)
//         console.log("removed")

//     }

// }


// //delete item 
// function deleteItemFromCart(pid)
// {
//     let cart = JSON.parse(localStorage.getItem('cart'));

//     let newcart = cart.filter((item) => item.productId != pid)

//     localStorage.setItem('cart', JSON.stringify(newcart))

//     updateCart();

//     showToast("Item is removed from cart ")

// }


// $(document).ready(function () {

//     updateCart()
// })



// function goToCheckout() {

//     window.location = "checkout.jsp"

// }







