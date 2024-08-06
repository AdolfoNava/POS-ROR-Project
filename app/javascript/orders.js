// let count = <%=order.items.count%>
function addToOrder(option) {
  let elements = $(`#option-${option}`).children("p");
  console.log($(elements[0]).text());
  console.log($(elements[1]).text());

  let div = $('<div>');
  let quantityinput = $('<input>')
    .attr('type', 'number')
    .attr('name', `order[items_attributes][${count}][quantity]`)
    .attr('id', `order_items_attributes_${count}_quantity`)
    .attr('value', 1)
    .addClass("numeric integer required");

  let priceinput = $('<input>')
    .attr('type', 'number')
    .attr('name', `order[items_attributes][${count}][price]`)
    .attr('id', `order_items_attributes_${count}_price`)
    .attr('value', $(elements[1]).text());

  let optioninput = $('<input>')
    .attr('type', 'hidden')
    .attr('name', `order[items_attributes][${count}][option_id]`)
    .attr('id', `order_items_attributes_${count}_option_id`)
    .attr('value', option);

  let nameinput = $('<input>')
    .attr('type', 'text')
    .attr('name', `order[items_attributes][${count}][name]`)
    .attr('id', `order_items_attributes_${count}_name`)
    .attr('value', $(elements[0]).text())
    .addClass("string required");

  div.append(quantityinput);
  div.append(nameinput);
  div.append(optioninput);
  div.append(priceinput);
  $("#items-selected").append(div);
  console.log(count);
  count++;
}
