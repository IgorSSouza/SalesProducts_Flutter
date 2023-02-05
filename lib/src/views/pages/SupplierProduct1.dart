import 'package:flutter/material.dart';
import 'package:sales_products/src/views/pages/home_page.dart';
import '../../models/cart.dart';
import '../components/badge.dart';
import '../pages/cart_page.dart';
import 'package:provider/provider.dart';
import '../../models/supplier_product1_model.dart';
import '../../controllers/supplier_products1_controller.dart';
import '../components/list.dart';
import '../components/loading.dart';
import '../components/search.dart';

class SupplierProduct1 extends StatefulWidget {
  const SupplierProduct1({super.key});

  @override
  State<SupplierProduct1> createState() => _SupplierProduct1State();
}

class _SupplierProduct1State extends State<SupplierProduct1> {
  final List<Product> _products = <Product>[];
  List<Product> _productsDisplay = <Product>[];

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
                      hintText: 'Ex: Nome Produto ou Categoria',
                      onChanged: (searchText) {
                        searchText = searchText.toLowerCase();
                        setState(() {
                          _productsDisplay = _products.where((u) {
                            var nameLowerCase = u.nome.toLowerCase();
                            var categoryLowerCase = u.categoria.toLowerCase();
                            return nameLowerCase.contains(searchText) ||
                                categoryLowerCase.contains(searchText);
                          }).toList();
                        });
                      },
                    )
                  : MyList(product: _productsDisplay[index - 1]);
            } else {
              return const MyLoading();
            }
          },
          itemCount: _productsDisplay.length + 1,
        ),
      ),
      floatingActionButton: Consumer<Cart>(
        builder: (ctx, cart, child) => BadgeCount(
          value: cart.itemsCount.toString(),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            child: const Icon(Icons.shopping_cart),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
