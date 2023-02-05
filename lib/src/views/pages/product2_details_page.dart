import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sales_products/src/models/cart2.dart';
import 'package:sales_products/src/models/supplier_product2_model.dart';
import 'package:sales_products/src/views/pages/SupplierProduct2.dart';
import 'package:provider/provider.dart';

class ProductDetails2 extends StatelessWidget {
  final Product2 product;
  const ProductDetails2({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart2>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Produto')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2)),
              items: product.gallery.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: 400,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: Image.network(
                          i,
                          width: 300,
                        ));
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 22.0,
            ),
            Text(
              product.name.toString(),
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              product.description.toString(),
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Material: ${product.details!.material}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              'Adjetivo: ${product.details!.adjective}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              'Preço: R\$ ${product.price}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              product.hasDiscount == true
                  ? 'Desconto: R\$ -${product.discountValue}'
                  : "",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    elevation: 10,
                    backgroundColor: Colors.green),
                onPressed: () {
                  cart.addItem(product);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SupplierProduct2()));
                },
                child: const Text('Adicionar ao Carrinho'))
          ],
        ),
      ),
    );
  }
}
