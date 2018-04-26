var getCart = function() {
    var cart = localStorage.getItem("CART");
    return cart ? JSON.parse(cart) : {};
};

var getLength = function(cart) {
    var count = 0;
    for (var prop of cart) {
        count++;
    }
    return count;
};