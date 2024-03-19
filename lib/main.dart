import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kamoo/pages/cart_page.dart';
import 'package:kamoo/pages/checkout_page.dart';
import 'package:kamoo/pages/checkout_success_page.dart';
import 'package:kamoo/pages/detail_chat_page.dart';
import 'package:kamoo/pages/edit_profile_page.dart';
import 'package:kamoo/pages/home/main_page.dart';
import 'package:kamoo/pages/product_page.dart';
import 'package:kamoo/pages/sign_in_page.dart';
import 'package:kamoo/pages/sign_up_page.dart';
import 'package:kamoo/pages/splash_page.dart';
import 'package:kamoo/providers/auth_provider.dart';
import 'package:kamoo/providers/product_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SingInPage(),
          '/sign-up': (context) => SingUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/product': (context) => ProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
