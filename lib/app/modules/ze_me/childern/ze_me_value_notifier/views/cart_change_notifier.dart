import 'package:flutter/material.dart';

class CartItem {

  CartItem({required this.product, this.quantity = 1});
  final Product product;
  int quantity;

  double get totalPrice => product.price * quantity;
}

class Product {

  Product({required this.id, required this.title, required this.price});
  final String id;
  final String title;
  final double price;
}

class StoreManager extends ChangeNotifier {
// List of products
  final List<Product> _products = <Product>[];
  // Shopping cart
  final List<CartItem> _cartItems = <CartItem>[];
  // Public Getters
  List<CartItem> get cartItems => _cartItems;
  double get cartTotal => _cartItems.fold(0, (double sum, CartItem item) =>
  sum + item.totalPrice);

  // Add products from cart
  void addToCart(Product product) {
    // Check if the product already exists in the cart
    final int existingItemIndex = _cartItems.indexWhere((CartItem item) => item.product.id == product.id);

    if (existingItemIndex != -1) {
      // Increment quantity if the product is already in the cart
      _cartItems[existingItemIndex].quantity++;
    } else {
      // Add a new CartItem if the product is not in the cart
      _cartItems.add(CartItem(product: product));
    }
    notifyListeners();
  }

  // Remove product from cart
  void removeFromCart(String productId) {
    // validations
    final int itemIndex = _cartItems.indexWhere((CartItem item) =>
    item.product.id == productId);
    if (itemIndex != -1) {
      final CartItem item = _cartItems[itemIndex];
      _cartItems.removeAt(itemIndex);
      notifyListeners();
    }
  }
}