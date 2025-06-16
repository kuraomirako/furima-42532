document.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price');
  const taxDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value);

      if (!isNaN(price) && price >= 300 && price <= 9999999) {
        const tax = Math.floor(price * 0.1);
        const profit = price - tax;

        taxDisplay.textContent = tax.toLocaleString();
        profitDisplay.textContent = profit.toLocaleString();
      } else {
        taxDisplay.textContent = '-';
        profitDisplay.textContent = '-';
      }
    });
  }
});