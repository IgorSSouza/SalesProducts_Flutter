import 'package:flutter/material.dart';
import '../../models/cart.dart';
import '../../models/supplier_product1_model.dart';
import 'SupplierProduct1.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Produto')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: Image.network(
                product.imagem,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
            Text(
              product.nome,
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              product.descricao,
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
              'Material: ${product.material}',
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
              'Departamento: ${product.departamento}',
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
              'Preço: R\$ ${product.preco}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
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
                          builder: (context) => const SupplierProduct1()));
                },
                child: const Text('Adicionar ao Carrinho'))
          ],
        ),
      ),
    );
  }
}
