// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
$(document).ready(function () {
    const storage = window.sessionStorage;

    if (storage.getItem("token")) {
        $('#logout').show();
        $('#login').hide();
        $('#cart').show();
    } else {
        $('#logout').hide();
        $('#login').show();
        $('#cart').hide();
    }

    $('#logout').click(function () {
        const storage = window.sessionStorage;

        storage.removeItem('token');
        window.location.replace("/");
    });

    showCartItems();
});

function login() {
    const uri = 'https://localhost:7066/api/Authentication/login';
    const storage = window.sessionStorage;

    const loginModel = {
        username: document.getElementById('username').value,
        password: document.getElementById('password').value
    };

    fetch(uri, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'access-control-allow-origin': '*'
        },
        body: JSON.stringify(loginModel)
    })
        .then(response => {
            if (response.status == 200) {
                return response.json();
            } else {
                alert("Invalid credentials");
                return;
            }
        }).then(data => {
            storage.setItem("token", data.token);
            window.location.replace("/");
        });
}

function search() {
    const uri = 'https://localhost:7066/api/ProductInventory/Search';
    const searchString = document.getElementById('title').value;

    console.log(uri + '/' + searchString);

    fetch(uri + '/' + searchString, {
        method: 'Get',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'access-control-allow-origin': '*'
        }
    })
        .then(response => response.json())
        .then(searchResult => showResult(searchResult));
}

function showResult(products) {
    $('#result').empty().hide();
    $('#matched').text(products.length + ' results found');

    $('#result').append('<tr><th>Title</th><th>Description</th><th>Price</th><th width="10%"></th></tr>')

    products.forEach(product =>
        $('#result').append('<tr><td>' + product.title + '</td><td>' + product.description + '</td><td>$' + product.price + '</td><td><a href="#" onClick="addToCart(' + product.id + ')">Add to cart</a></td></tr>')
    );

    $('#result').show();
}

function addToCart(productId) {
    const storage = window.sessionStorage;
    const uri = 'https://localhost:7066/api/CartItem';

    if (!storage.getItem("token")) {
        alert('Please login to add item into cart.');
        window.location.replace("/Login");
    }

    const cartItemModel = {
        productId: productId,
        orderedQuantity: 1
    };

    fetch(uri, {
        method: 'Post',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'access-control-allow-origin': '*',
            'Authorization': 'Bearer ' + storage.getItem("token")
        },
        body: JSON.stringify(cartItemModel)
    })
        .then(response => {
            if (response.status == 204) {
                window.location.replace("/Cart");
            } else {
                alert("Please sign in and try again.");
                window.location.replace("/Login");
            }
        });
}

function register() {
    const uri = 'https://localhost:7066/api/Authentication/register';

    const registerModel = {
        username: document.getElementById('username').value,
        email: document.getElementById('email').value,
        password: document.getElementById('password').value
    };

    fetch(uri, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'access-control-allow-origin': '*'
        },
        body: JSON.stringify(registerModel)
    })
        .then(response => {
            if (response.status == 200) {
                alert("Your account has successfully been registered. Please login again to access your account.");

                window.location.replace("/Login");
            } else {
                alert("The registration is not successful. Please try again.");
                return;
            }
        });
}

function showCartItems() {
    const storage = window.sessionStorage;
    const uri = 'https://localhost:7066/api/CartItem/UserCart';

    fetch(uri, {
        method: 'Get',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'access-control-allow-origin': '*',
            'Authorization': 'Bearer ' + storage.getItem("token")
        }
    })
        .then(response => response.json())
        .then(cartData => loadCart(cartData));
}

function loadCart(cartItems) {
    $('#cartItems').empty();

    $('#cartItems').append('<tr><th>Title</th><th>Description</th><th>Unit Price</th><th>Quantity</th><th>Sub Total</th></tr>')

    cartItems.forEach(cartItem =>
        $('#cartItems').append('<tr><td>' + cartItem.productName + '</td><td>' + cartItem.productDescription + '</td><td>$' + cartItem.productPrice + '</td><td><input type="Text" onchange="updateQuantity(' + cartItem.id + ', this)" value="' + cartItem.orderedQuantity + '"></input></td><td class="subTotal" data-value="' + cartItem.subTotal + '">$' + cartItem.subTotal + '</td></tr>')
    );

    var grandTotal = 0;
    $('.subTotal').each(function () {
        var rowTotal = parseFloat($(this).attr('data-value'));
        grandTotal = rowTotal + grandTotal;
        $("#total").text("$ " + grandTotal.toFixed(2));
    });
}

function updateQuantity(cartItemId, inputQty) {
    const storage = window.sessionStorage;
    const uri = 'https://localhost:7066/api/CartItem';
    const qty = $(inputQty).val();

    if (!qty) {
        alert('Quantity cannot be empty');
        return;
    }

    if (qty < 0) {
        alert('Quantiy must be 0 or above');
        return;
    }

    const cartItemModel = {
        orderedQuantity: qty
    };

    console.log(uri + '/' + cartItemId);

    fetch(uri + '/' + cartItemId, {
        method: 'Put',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'access-control-allow-origin': '*',
            'Authorization': 'Bearer ' + storage.getItem("token")
        },
        body: JSON.stringify(cartItemModel)
    })
        .then(response => {
            if (response.status == 204) {
                showCartItems();
            }
        });
}