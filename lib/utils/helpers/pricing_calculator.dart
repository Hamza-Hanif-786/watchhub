class WatchHubPricingCalculator {

  /// -- Calculate Price based on tax and shipping
  static double calculateTotalPrice(double subTotal, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = subTotal + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Calculate shipping cost 
  static String calculateShippingCost(double subTotal, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Calculate tax
  static String calculateTax(double subTotal, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // lookup the tax rate based on the location from a tax rate database or API
    return 0.10;     // Example tax rate of 10%
  }

  static double getShippingCost(String location) {
    // lookup the shipping cost based on the location from a shipping cost database or API
    return 5.00;       // Example shipping cost of $5
  }

  /// -- Sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price).fold(0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}