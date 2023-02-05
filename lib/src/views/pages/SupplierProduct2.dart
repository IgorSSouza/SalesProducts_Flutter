import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_products/src/models/cart2.dart';
import 'package:sales_products/src/views/pages/cart_page2.dart';
import 'package:sales_products/src/views/pages/home_page.dart';
import '../../models/supplier_product2_model.dart';
import '../../controllers/supplier_products2_controller.dart';
import '../components/badge.dart';
import '../components/list2.dart';
import '../components/loading.dart';
import '../components/search.dart';

class SupplierProduct2 extends StatefulWidget {
  const SupplierProduct2({super.key});

  @override
  State<SupplierProduct2> createState() => _SupplierProduct2State();
}

class _SupplierProduct2State extends State<SupplierProduct2> {
  final List<Product2> _products = <Product2>[];
  List<Product2> _productsDisplay = <Product2>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts().then((value) {
      setState(() {
        _isLoading = false;
        _products.addAll(value);
        _productsDisplay = _products;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (!_isLoading) {
              return index == 0
                  ? MySearch(
                      hintText: 'Ex: Nome Produto ou Adjetivo',
                      onChanged: (searchText) {
                        searchText = searchText.toLowerCase();
                        setState(() {
                          _productsDisplay = _products.where((u) {
                            var nameLowerCase = u.name.toString().toLowerCase();
                            var adjectiveLowerCase =
                                u.details!.adjective.toString().toLowerCase();
                            return nameLowerCase.contains(searchText) ||
                                adjectiveLowerCase.contains(searchText);
                          }).toList();
                        });
                      },
                    )
                  : MyList2(product: _productsDisplay[index - 1]);
            } else {
              return const MyLoading();
            }
          },
          itemCount: _productsDisplay.length + 1,
        ),
      ),
      floatingActionButton: Consumer<Cart2>(
        builder: (ctx, cart, child) => BadgeCount(
          value: cart.itemsCount.toString(),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage2()));
            },
            child: const Icon(Icons.shopping_cart),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
