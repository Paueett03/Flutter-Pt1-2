import 'package:flutter/foundation.dart';
import 'product.dart';

class CartItem {
  final String id;
  final Product product;
  int quantity;
  
  CartItem({
    required this.id,
    required this.product,
    this.quantity = 1,
  });
  
  double get total => product.price * quantity;
}

class Cart with ChangeNotifier {
  static final Cart _instance = Cart._internal();
  
  factory Cart() {
    return _instance;
  }
  
  Cart._internal();
  
  Map<String, CartItem> _items = {};
  
  Map<String, CartItem> get items {
    return {..._items};
  }
  
  int get itemCount {
    return _items.length;
  }
  
  int get totalItems {
    int total = 0;
    _items.forEach((key, item) {
      total += item.quantity;
    });
    return total;
  }
  
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      // Incrementar cantidad
      _items.update(
        product.id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          product: existingCartItem.product,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // Añadir nuevo producto
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: DateTime.now().toString(),
          product: product,
        ),
      );
    }
    notifyListeners();
  }
  
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
  
  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          product: existingCartItem.product,
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
  
  void clear() {
    _items = {};
    notifyListeners();
  }
}