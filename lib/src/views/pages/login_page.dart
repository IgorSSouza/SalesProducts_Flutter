import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:sales_products/src/views/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/loading.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Venda de Produtos'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                  child: const FlutterLogo(
                    size: 40,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'Email',
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Digite seu E-mail';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'Password',
                    ),
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Digite sua Senha';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    height: 80,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Entrar'),
                      onPressed: () {
                        
                        if (_formKey.currentState!.validate()) {
                          showDialog(context: context, builder: (context){
                            return const Center(child: MyLoading(),);
                          },);
                          login();
                          
                        }
                      },
                    )),
              ],
            ),
          ),
        ));
  }

  login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://salesproductapi.onrender.com/tokens/');
    var response = await http.post(
      url,
      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );
    
    if (response.statusCode == 200) {
      
      String token = json.decode(response.body)['token'];
      int user = json.decode(response.body)['user']['id'];
      await sharedPreferences.setString('token', 'Token $token');
      await sharedPreferences.setInt('user', user);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } else {
      Navigator.of(context).pop();
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Erro!',
          text: 'Email ou Senha Inválidos!',
          confirmBtnText: 'Ok');
    }
  }
}
