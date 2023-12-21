import 'package:delivery_project/widgets/auth/auth_screen_widget.dart';
import 'package:delivery_project/widgets/auth/auth_verification_screen_widget.dart';
import 'package:delivery_project/widgets/create_order/create_order_screen_widget.dart';
import 'package:delivery_project/widgets/my_adt/my_adt_screen_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/auth': (context) => const AuthScreenWidget(),
        '/auth/verification': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          return AuthVerificationScreenWidget(phoneNumber: arguments,);
        },
        '/create_order': (context) => const CreateOrderScreenWidget(),
        '/my_adt': (context) => const MyAdtScreenWidget(),
      },

      initialRoute: '/auth',
    );
  }
}