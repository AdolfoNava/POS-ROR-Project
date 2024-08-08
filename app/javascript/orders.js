// let count = <%=order.items.count%>
function addToOrder(option) {
  let elements = $(`#option-${option}`).children("p");
  console.log($(elements[0]).text());
  console.log($(elements[1]).text());

  let div = $('<div>').addClass('row mb-2');
  let quantityDiv = $('<div>').addClass('col-md-2')
  let quantityInput = $('<input>')
    .attr('type', 'number')
    .attr('name', `order[items_attributes][${count}][quantity]`)
    .attr('id', `order_items_attributes_${count}_quantity`)
    .attr('value', 1)
    .addClass("numeric integer required form-control");

  let priceDiv = $('<div>').addClass("col-md-2");
  let priceInput = $('<input>')
    .attr('type', 'number')
    .attr('name', `order[items_attributes][${count}][price]`)
    .attr('id', `order_items_attributes_${count}_price`)
    .attr('value', $(elements[1]).text()).addClass('form-control text-end');

  let optioninput = $('<input>')
    .attr('type', 'hidden')
    .attr('name', `order[items_attributes][${count}][option_id]`)
    .attr('id', `order_items_attributes_${count}_option_id`)
    .attr('value', option);
  let nameDiv = $('<div>').addClass('col-md-8')
  let nameInput = $('<input>')
    .attr('type', 'text')
    .attr('name', `order[items_attributes][${count}][name]`)
    .attr('id', `order_items_attributes_${count}_name`)
    .attr('value', $(elements[0]).text())
    .addClass("string required form-control");

  let colorPicker = $('<input>');

  let colorConfirmer = $('<input>');
  quantityDiv.append(quantityInput);
  div.append(quantityDiv);
  
  nameDiv.append(nameInput);
  div.append(nameDiv);
  div.append(optioninput);
  priceDiv.append(priceInput)
  div.append(priceDiv);

  $("#items-selected").append(div);

  count++;
}
