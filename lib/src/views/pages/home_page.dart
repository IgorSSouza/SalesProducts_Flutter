import 'package:flutter/material.dart';
import 'package:sales_products/src/views/pages/login_page.dart';
import 'package:sales_products/src/views/pages/suppliers_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    super.initState();
    authentication().then((isValid) => {
          if (isValid)
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Suppliers()))
            }
          else
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Login()))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  Future<bool> authentication() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
