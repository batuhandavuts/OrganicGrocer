import 'package:flutter/material.dart';
import 'package:grocery_app/loginscreens/login/login_view.dart';
import 'package:grocery_app/mobel/cart_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatModels(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grocery App',
        home: LoginView(),
      ),
    );
  }
}
