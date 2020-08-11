function calc() {
var addTaxPrice = document.getElementById("add-tax-price")
var profit = document.getElementById("profit")
var itemPrice =  document.getElementById("item-price")
 addTaxPrice = itemPrice * 0.1
 profit = itemPrice - addTaxPrice 
}
window.addEventListener("click", calc);
