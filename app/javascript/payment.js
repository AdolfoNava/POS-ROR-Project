document.addEventListener('DOMContentLoaded', function () {
  window.updateChange = function () {
    var paymentCard = document.getElementById('order_payment_method_card');
    var paymentPhone = document.getElementById('order_payment_method_phone');
    var paymentCheck = document.getElementById('order_payment_method_check');

    var changeInput = document.getElementById('change');
    var customerPays = document.getElementById('paying');

    var totalPrice = parseFloat(document.getElementById('order_price').value);
    if (paymentCard.checked ||paymentPhone.checked || paymentCheck.checked) {
      changeInput.value = "0.00";
      customerPays.value = totalPrice.toFixed(2);
      } 
      };
  window.calculateChange = function () {
    var totalPrice = parseFloat(document.getElementById('order_price').value);
    var customerPays = parseFloat(document.getElementById('paying').value);
    var changeInput = document.getElementById('change');
    if (!isNaN(totalPrice) && !isNaN(customerPays)) {
      var change = customerPays - totalPrice;
      changeInput.value = change.toFixed(2);
    } else {
      changeInput.value = "0.00";
    }
  };
});
