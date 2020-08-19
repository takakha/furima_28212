function calc(){

  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  const itemPrice =  document.getElementById("item-price")

   itemPrice.addEventListener('input', function(){
    const inputs = itemPrice.value
    addTaxPrice.innerHTML = `${Math.floor(inputs * 0.1)}`
    profit.innerHTML = `${Math.floor(inputs * 0.9)}`
   })
  }
window.addEventListener('load', calc);