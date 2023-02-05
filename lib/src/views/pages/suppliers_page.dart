import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_products/src/views/pages/SupplierProduct2.dart';

import '../../models/cart.dart';
import '../../models/cart2.dart';
import '../components/badge.dart';
import 'SupplierProduct1.dart';
import 'cart_page_final.dart';

class Suppliers extends StatelessWidget {
  const Suppliers({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart2 cart2 = Provider.of(context);
    final items2 = cart2.items.values.toList();

    final Cart cart = Provider.of(context);
    final items1 = cart.items.values.toList();

    final items = [...items1, ...items2];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fornecedores'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          InkWell(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Fornecedor 1',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SupplierProduct1()));
            },
          ),
          InkWell(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Fornecedor 2',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SupplierProduct2()));
            },
          ),
        ],
      ),
      floatingActionButton: Consumer<Cart2>(
        builder: (ctx, cart, child) => BadgeCount(
          value: items.length.toString(),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CartPageFinal()));
            },
            child: const Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
