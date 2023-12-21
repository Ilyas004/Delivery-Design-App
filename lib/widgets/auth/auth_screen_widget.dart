import 'dart:ffi';

import 'package:delivery_project/theme/app_style.dart';
import 'package:delivery_project/widgets/general_widgets/authorization_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreenWidget extends StatefulWidget {

  const AuthScreenWidget({super.key});

  @override
  State<AuthScreenWidget> createState() => _AuthScreenWidgetState();
}

class _AuthScreenWidgetState extends State<AuthScreenWidget> {
  final numberPhoneController = TextEditingController();

  void _onClickPhoneField() {
    if (numberPhoneController.text.isEmpty) {
      numberPhoneController.text = '+7';
    }
  }

  static const border = OutlineInputBorder(
    borderSide: BorderSide(width: 1 ,color: Color(0xFFBABABA))
  );

  static const textStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );

  void _onVerificationTab() {
    if (numberPhoneController.text.length == 12) {
      Navigator
          .of(context)
          .pushNamed('/auth/verification', arguments: numberPhoneController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 190,),
            const AuthorizationText(),
            const SizedBox(height: 17,),
            const Text(
              'Введите номер телефона для авторизации',
              style: AppStyle.titleGreyText
            ),
            const SizedBox(height: 75,),
            TextField(

              onTap: _onClickPhoneField,
              maxLength: 12,
              controller: numberPhoneController,
              cursorWidth: 1.5,
              style: textStyle,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                counterText: '',
                hintText: 'Номер телефона',
                hintStyle: AppStyle.smallGreyText,
                border: border
              ),
            ),
            const SizedBox(height: 20,),
            const TextField(
              cursorWidth: 1.5,
              style: textStyle,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Введите имя',
                hintStyle: AppStyle.smallGreyText,
                border: border
              ),
            ),
            const SizedBox(height: 38,),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                style: AppStyle.buttonStyle,
                onPressed: _onVerificationTab,
                child: const Text('Продолжить',)
              ),
            )
          ],
        ),
      ),
    );
  }
}
