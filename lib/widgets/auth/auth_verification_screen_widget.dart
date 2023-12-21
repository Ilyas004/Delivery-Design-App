import 'package:delivery_project/theme/app_style.dart';
import 'package:delivery_project/widgets/general_widgets/authorization_text.dart';
import 'package:flutter/material.dart';

class AuthVerificationScreenWidget extends StatefulWidget {
  final phoneNumber;
  const AuthVerificationScreenWidget({Key? key, required this.phoneNumber}): super(key: key);

  @override
  State<AuthVerificationScreenWidget> createState() => _AuthVerificationScreenWidgetState();
}

class _AuthVerificationScreenWidgetState extends State<AuthVerificationScreenWidget> {
  late final String phoneNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumber = widget.phoneNumber as String;
  }

  void _onCreateOrderTab() {
    Navigator.of(context).pushReplacementNamed('/create_order');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 190,),
            const AuthorizationText(),
            const SizedBox(height: 17,),
            Text(
              'Введите код, отправленный на номер \n${formatPhoneNumber(phoneNumber)}',
              style: AppStyle.titleGreyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 54,),
            const TextField(
              cursorWidth: 1.5,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),
              decoration: InputDecoration(
                hintText: 'Код из СМС',
                hintStyle: AppStyle.smallGreyText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1 ,color: Color(0xFFBABABA))
                ),
              ),
            ),
            const SizedBox(height: 5,),
            InkWell(
              onTap: () {},
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Получить код повторно',
                  style: TextStyle(
                    color: Color(0xFF5263FF),
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            const SizedBox(height: 17,),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onCreateOrderTab,
                style: AppStyle.buttonStyle,
                child: const Text('Продолжить'),
              )
            )
          ],
        ),
      ),
    );
  }
}


String formatPhoneNumber(String phoneNumber) {
  if (phoneNumber.length != 12) {
    return phoneNumber; // Возвращаем исходную строку, если длина не соответствует ожидаемой
  }

  String countryCode = phoneNumber.substring(0, 2);
  String regionCode = phoneNumber.substring(2, 5);
  String firstPart = phoneNumber.substring(5, 8);
  String secondPart = phoneNumber.substring(8, 10);
  String thirdPart = phoneNumber.substring(10);

  return '$countryCode ($regionCode) $firstPart-$secondPart-$thirdPart';
}