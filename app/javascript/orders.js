function addToOrder(option) {
  event.preventDefault();
  let elements = $(`#option-${option}`).children("p");
  console.log($(elements[0]).text());
  console.log($(elements[1]).text());

  let div = $('<div>').addClass('row mb-2 item justify-content-around');
  let quantityDiv = $('<div>').addClass('col-2')
  let quantityInput = $('<input>')
    .attr('type', 'number')
    .attr('name', `order[items_attributes][${count}][quantity]`)
    .attr('id', `order_items_attributes_${count}_quantity`)
    .attr('value', 1)
    .addClass("numeric integer required form-control").attr('oninput', 'calculateTotal()');

  let priceDiv = $('<div>').addClass("col-2");
  let priceInput = $('<input>')
    .attr('type', 'number')
    .attr('name', `order[items_attributes][${count}][price]`)
    .attr('id', `order_items_attributes_${count}_price`)
    .attr('value', $(elements[1]).text())
    .attr('oninput', 'calculateTotal()')
    .attr('step', "0.01")
    .addClass('form-control text-end');

  let optioninput = $('<input>')
    .attr('type', 'hidden')
    .attr('name', `order[items_attributes][${count}][option_id]`)
    .attr('id', `order_items_attributes_${count}_option_id`)
    .attr('value', option);
  let nameDiv = $('<div>').addClass('col-7')
  let nameInput = $('<input>')
    .attr('type', 'text')
    .attr('name', `order[items_attributes][${count}][name]`)
    .attr('id', `order_items_attributes_${count}_name`)
    .attr('value', $(elements[0]).text())
    .addClass("string required form-control");

  let colorPicker = $('<input>')
    .attr('type', 'color')
    .attr('onchange', `colorInsert(${count})`)
    .attr('id', `color_choice_${count}`)
    .attr('value', '#ff0000')
    .addClass('form-control form-control-color');

  quantityDiv.append(quantityInput);
  div.append(quantityDiv);

  nameDiv.append(nameInput);
  div.append(nameDiv);
  div.append(optioninput);
  priceDiv.append(priceInput)
  div.append(priceDiv);
  div.append(colorPicker);

  $("#items-selected").append(div);

  count++;
  calculateTotal();
}

function colorInsert(c) {
  var call = $(`#color_choice_${c}`).val();
  var val = ntc.name(`${call}`);
  var currentName = $(`#order_items_attributes_${c}_name`).val();
  $(`#order_items_attributes_${c}_name`).val(`${currentName}(${val[1]})`);
}

function calculateTotal() {
  const items = document.querySelectorAll('.item');
  let grandTotal = 0;
  let grandQuantity = 0;
  items.forEach((item, index) => {
    const quantity = item.querySelector(`#order_items_attributes_${index}_quantity`).value;
    const price = item.querySelector(`#order_items_attributes_${index}_price`).value;
    const total = quantity * price;
    grandQuantity += parseInt(quantity);
    grandTotal += total;
  });

  document.getElementById('order_price').value = grandTotal.toFixed(2);
  document.getElementById('order_items_count').value = grandQuantity;
}
