import 'package:flutter/material.dart';
import '../../models/supplier_product2_model.dart';
import '../pages/product2_details_page.dart';
// import '../pages/product_details_page.dart';

class MyList2 extends StatelessWidget {
  final Product2 product;
  const MyList2({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
                tag: product.id.toString(),
                child: Image.network(product.gallery[0])),
            title: Text(product.name.toString()),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Adjetivo: ${product.details!.adjective}"),
                Text("Material: ${product.details!.material}"),
                Text("Preço: R\$ ${product.price}")
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetails2(product: product)));
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
