import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sales_products/src/models/cart2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart.dart';
import '../components/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../components/loading.dart';

class CartPageFinal extends StatelessWidget {
  const CartPageFinal({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart2 cart2 = Provider.of(context);
    final items2 = cart2.items.values.toList();

    final Cart cart = Provider.of(context);
    final items1 = cart.items.values.toList();

    final cartFunction = Provider.of<Cart>(context, listen: false);
    final cart2Function = Provider.of<Cart2>(context, listen: false);

    final items = [...items1, ...items2];

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
                  const SizedBox(width: 10),
                  Chip(
                    backgroundColor: Colors.blue,
                    label: Text(
                      'R\$${cart.totalAmount + cart2.totalAmount}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.blue)),
                    onPressed: () async {
                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        String? token = sharedPreferences.getString('token');
                      try {
                        showDialog(context: context, builder: (context){
                            return const Center(child: MyLoading(),);
                          },);
                        for (var i in items) {
                          var url = Uri.parse('https://salesproductapi.onrender.com/vendas/');
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          int? user = sharedPreferences.getInt('user');
                          var response = await http.post(url, 
                              headers: {
                                "Content-Type":
                                    "application/json; charset=utf-8",
                                "Authorization" : token!,
                              },
                              body: jsonEncode(
                                {
                                  "idProduct": int.parse(i.productId),
                                  "name": i.name,
                                  "quantity": i.quantity,
                                  "price": i.price,
                                  "idSupplier": i.supplierId,
                                  "idUser": user
                                },
                              ));
                        }
                        cartFunction.clear();
                        cart2Function.clear();
                        Navigator.of(context).pop();
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: 'Sucesso!',
                            text: 'Compra Realizada!',
                            confirmBtnText: 'Ok');
                      } catch (e) {
                        Navigator.of(context).pop();
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Erro!',
                            text: 'Algo de Errado Aconteceu!',
                            confirmBtnText: 'Ok');
                      }
                    },
                    child: const Text('Comprar'),
                  )
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
