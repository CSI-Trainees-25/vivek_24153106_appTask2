import 'package:flutter/foundation.dart';
import 'package:coffeeshop/menu_item.dart';

class CartItem {
  CartItem({required this.item, this.qty = 1, this.size = 'M'})
    : unitPrice = double.tryParse(item.price) ?? 0.0;

  final MenuItem item;
  final double unitPrice;
  int qty;
  String size;

  double get lineTotal => unitPrice * qty;
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  bool get isEmpty => _items.isEmpty;

  double get total => _items.fold(0.0, (sum, ci) => sum + ci.lineTotal);

  void add(MenuItem item, {int qty = 1, String size = 'M'}) {
    // Merge with an existing entry of the same item and size
    final index = _items.indexWhere(
      (ci) => ci.item.name == item.name && ci.size == size,
    );
    if (index != -1) {
      _items[index].qty += qty;
    } else {
      _items.add(CartItem(item: item, qty: qty, size: size));
    }
    notifyListeners();
  }

  void removeAt(int index) {
    if (index < 0 || index >= _items.length) return;
    _items.removeAt(index);
    notifyListeners();
  }

  void increment(int index) {
    if (index < 0 || index >= _items.length) return;
    _items[index].qty += 1;
    notifyListeners();
  }

  void decrement(int index) {
    if (index < 0 || index >= _items.length) return;
    if (_items[index].qty > 1) {
      _items[index].qty -= 1;
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

// Global cart instance for simplicity (no external deps like Provider)
final cart = Cart();
