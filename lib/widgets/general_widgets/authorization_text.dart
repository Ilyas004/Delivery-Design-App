import 'package:flutter/material.dart';

class AuthorizationText extends StatelessWidget {
  static const _authorization = 'Авторизация';
  const AuthorizationText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      _authorization,
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600
      ),
    );
  }
}
