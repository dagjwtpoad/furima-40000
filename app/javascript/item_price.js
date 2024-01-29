const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    const salesProfit = document.getElementById("profit")
    const profit_result = Math.floor(inputValue * 0.1)
    salesProfit.innerHTML = Math.floor(inputValue - profit_result);
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);