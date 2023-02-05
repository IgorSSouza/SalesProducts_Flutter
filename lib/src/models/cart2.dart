import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sales_products/src/models/supplier_product2_model.dart';
import '../models/cart_item.dart';

class Cart2 with ChangeNotifier {
  Map<String, CartItem> _items2 = {};

  Map<String, CartItem> get items {
    return {..._items2};
  }

  int get itemsCount {
    return _items2.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items2.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(Product2 product) {
    if (_items2.containsKey(product.id)) {
      _items2.update(
        product.id!,
        (existingItem) => CartItem(
          id: existingItem.id,
          productId: existingItem.productId,
          name: existingItem.name,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
          supplierId: 2,
        ),
      );
    } else {
      _items2.putIfAbsent(
        product.id!,
        () => CartItem(
            id: Random().nextDouble().toString(),
            productId: product.id!,
            name: product.name!,
            quantity: 1,
            price: product.hasDiscount == true
                ? double.parse(product.price!) -
                    double.parse(product.discountValue)
                : double.parse(product.price!),
            supplierId: 2),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items2.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items2 = {};
    notifyListeners();
  }
}
