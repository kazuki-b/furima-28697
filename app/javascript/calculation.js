function calculation(){
  const priceInput = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
    priceInput.addEventListener('keyup', () => {
      const value = priceInput.value;
      let fee = value * 0.1
      let gains = value - fee
      add_tax.textContent = fee;
      profit.textContent = gains;
    });
  }
window.addEventListener('load', calculation);