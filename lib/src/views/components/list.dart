import 'package:flutter/material.dart';
import '../../models/supplier_product1_model.dart';
import '../pages/product_details_page.dart';
// import '../pages/product_details_page.dart';

class MyList extends StatelessWidget {
  final Product product;
  const MyList({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading:
                Hero(tag: product.id, child: Image.network(product.imagem)),
            title: Text(product.nome),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Categoria: ${product.categoria}"),
                Text("Preço: R\$ ${product.preco}")
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetails(product: product)));
            },
          ),
          const Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
