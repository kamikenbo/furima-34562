window.addEventListener('load', () => {

const priceInput = document.getElementById("price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
addTaxDom.innerHTML = Math.floor(priceInput.value / 10 ) 

const addProfitDom = document.getElementById("profit");
addProfitDom.innerHTML = Math.floor(priceInput.value * 0.9 )

});



});