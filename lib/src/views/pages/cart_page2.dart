import 'package:flutter/material.dart';
import 'package:sales_products/src/models/cart2.dart';
import '../components/cart_item.dart';
import 'package:provider/provider.dart';

class CartPage2 extends StatelessWidget {
  const CartPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart2 cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Chip(
                    backgroundColor: Colors.blue,
                    label: Text(
                      'R\$${cart.totalAmount}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, i) => CartItemWidget(cartItem: items[i]),
          ))
        ],
      ),
    );
  }
}
