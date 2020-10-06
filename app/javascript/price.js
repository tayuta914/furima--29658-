function price(){
  const price_input = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price_input.addEventListener('keyup', () => {
    let price = price_input.value;
    
    let fee = price * 0.1;
   
    let gains = price - fee;
  
    add_tax.innerHTML = fee
    profit.innerHTML = gains
})
}

window.addEventListener('load', price);
