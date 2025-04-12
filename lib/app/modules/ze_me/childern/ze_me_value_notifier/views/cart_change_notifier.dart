import 'package:flutter/material.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;
}

class Product {
  final String id;
  final String title;
  final double price;

  Product({required this.id, required this.title, required this.price});
}

class StoreManager extends ChangeNotifier {
// List of products
  final List<Product> _products = [];
  // Shopping cart
  final List<CartItem> _cartItems = [];
  // Public Getters
  List<CartItem> get cartItems => _cartItems;
  double get cartTotal => _cartItems.fold(0, (sum, item) =>
  sum + item.totalPrice);

  // Add products from cart
  void addToCart(Product product) {
    // Check if the product already exists in the cart
    final existingItemIndex = _cartItems.indexWhere((item) => item.product.id == product.id);

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
    final itemIndex = _cartItems.indexWhere((item) =>
    item.product.id == productId);
    if (itemIndex != -1) {
      final item = _cartItems[itemIndex];
      _cartItems.removeAt(itemIndex);
      notifyListeners();
    }
  }
}