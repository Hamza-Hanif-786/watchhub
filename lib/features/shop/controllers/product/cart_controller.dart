import "package:get/get.dart";
import "package:watchhub/features/shop/controllers/product/variation_controller.dart";
import "package:watchhub/features/shop/models/cart_item_model.dart";
import "package:watchhub/features/shop/models/product_model.dart";
import "package:watchhub/utils/constants/enums.dart";
import "package:watchhub/utils/local_storage/storage_utility.dart";
import "package:watchhub/utils/popups/loaders.dart";

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  // Add items in the cart
  void addToCart(ProductModel product) {

    // Quantity Check
    if(productQuantityInCart.value < 1) {
      WHLoaders.customToast(message: 'Select Quantity');
      return;
    }

    // Variation Selected?
    if(product.productType == ProductType.variable.toString() && variationController.selectedVariation.value.id.isEmpty) {
      WHLoaders.customToast(message: 'Select Variation');
      return;  
    }

    // Out of Stock Status
    if(product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        WHLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Selected Variation is Out of Stock.');
        return;
      }
    } else {
      if (product.stock < 1) {
        WHLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Selected Product is Out of Stock.');
        return;
      }
    }

    // Convert ProductModel to CartItemModel with the given quantity
    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    // Check if already in the cart
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId);
    
    if(index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    WHLoaders.customToast(message: 'Your Product has been added to Cart');
  }


  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }


  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      updateCart();
    } 
  }


  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: "Remove Product",
      middleText: "Are you sure you want to remove this product?",
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        WHLoaders.customToast(message: 'Product has been removed from Cart');
        Get.back();
      },
      onCancel: () => Get.back()
    );
  }


  // Initializes already added Item's Count in cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart = 0.obs;
      }
    }
  }


  // Function to convert a ProductModel to CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation 
        ? variation.salePrice > 0.0 
            ? variation.salePrice 
            : variation.price 
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price, 
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null
    );
  }


  // Update Cart Values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for(var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    WatchHubLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings = WatchHubLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String ,dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId, 
      orElse: () => CartItemModel.empty()
    );

    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}