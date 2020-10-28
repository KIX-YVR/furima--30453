function price (){
  const calculation = document.getElementById('item-price')
    calculation.addEventListener("input", () => {
      const calculationDoing = calculation.value * 0.1;
      const calculationProfit = calculation.value - calculationDoing;
      const calculationResult = document.getElementById("add-tax-price");
      const calculationProfitAll = document.getElementById("profit");
      calculationResult.innerHTML = calculationDoing;
      calculationProfitAll.innerHTML = calculationProfit
    });

}
window.addEventListener('input', price);