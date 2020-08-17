function calc(){

  var addTaxPrice = document.getElementById("add-tax-price")
  var profit = document.getElementById("profit")
  var itemPrice =  document.getElementById("item-price")

   itemPrice.addEventListener('input', function(){
    var inputs = itemPrice.value
    addTaxPrice.innerHTML = `${Math.floor(inputs * 0.1)}`
    profit.innerHTML = `${Math.floor(inputs * 0.9)}`
   })
  }
window.addEventListener('load', calc);