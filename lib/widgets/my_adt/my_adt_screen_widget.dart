import 'dart:typed_data';

import 'package:delivery_project/assets/images.dart';
import 'package:delivery_project/theme/app_style.dart';
import 'package:flutter/material.dart';

class MyAdtScreenWidget extends StatefulWidget {
  const MyAdtScreenWidget({super.key});

  @override
  State<MyAdtScreenWidget> createState() => _MyAdtScreenWidgetState();
}

class _MyAdtScreenWidgetState extends State<MyAdtScreenWidget> {
  static const textCountryStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Мои объявления'),
        centerTitle: true,
        backgroundColor: AppStyle.backgroundColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _header(),
                      SizedBox(height: 20,),
                      _placeToSend(),
                      SizedBox(height: 20,),
                      const Text(
                        'Описание:orem ipsum dolor sit amet, consectetuer'
                        ' adipiscing elit. Aenean commodo ligula eget dolor...',
                        style: AppStyle.smallGreyText,
                      ),
                      const SizedBox(height: 20,),
                      _editButton()
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 66),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _postAdtButton(),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _postAdtButton() {
    return SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () {},
          style: AppStyle.buttonStyle,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AppImages.plusImage),
              SizedBox(width: 8,),
              Text(
                'Разместить объявление',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              )
            ],
          ),
        )
    );
  }

  SizedBox _editButton() {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Color(0xFFE5EAFF)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(29))
          ),
          elevation: MaterialStatePropertyAll(0)
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Изменить',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3A59A8)
                )
            ),
            SizedBox(width: 8,),
            Image(image: AppImages.penImage)
          ],
        )
      ),
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(text: 'Груз', style: AppStyle.smallGreyText),
              TextSpan(
                text: '\n600 ₽',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                )
              ),
            ]
          )
        ),
        ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Color(0xFFF1F1F1)),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppStyle.greyColor
              )
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
            )

          ),
          child: Text('Повезу')
        )
      ],
    );
  }

  Row _placeToSend() {
    return Row(
      children: [
        Image(image: AppImages.wayImage),
        const SizedBox(width: 16,),
        Column(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'Россия, Москва', style: textCountryStyle),
                  TextSpan(text: '\n12:00, 6 декабря', style: AppStyle.smallGreyText),
                ]
              )
            ),
            const SizedBox(height: 44,),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'Россия, Москва', style: textCountryStyle),
                  TextSpan(text: '\n12:00, 6 декабря', style: AppStyle.smallGreyText),
                ]
              )
            ),
          ],
        ),
      ],
    ); 
  }
}
