import 'package:delivery_project/assets/images.dart';
import 'package:delivery_project/theme/app_style.dart';
import 'package:delivery_project/utils/date_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateOrderScreenWidget extends StatefulWidget {
  const CreateOrderScreenWidget({super.key});

  @override
  State<CreateOrderScreenWidget> createState() => _CreateOrderScreenWidgetState();
}

class _CreateOrderScreenWidgetState extends State<CreateOrderScreenWidget> {

  static final inputFormatters = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(8),
    DateInputFormatter()
  ];

  static const _textStyleInputText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500
  );

  void _onAdtTab() {
    Navigator.of(context).pushNamed('/my_adt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Новое объявление',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 40,),
            const Text('Название объявления', style: AppStyle.titleBlackText,),
            const SizedBox(height: 5,),
            TextField(
              decoration: getInputDecoration('Введите название'),
              style: _textStyleInputText,
            ),
            const SizedBox(height: 20,),
            const Text('Описание', style: AppStyle.titleBlackText,),
            const SizedBox(height: 5,),
            TextField(
              decoration: getInputDecoration('Введите описание'),
              maxLines: 3,
              style: _textStyleInputText,
            ),
            const SizedBox(height: 20,),
            const Text('Откуда', style: AppStyle.titleBlackText,),
            const SizedBox(height: 5,),
            TextField(
              decoration: getInputDecoration('Страна, Город, Аэропорт'),
              style: _textStyleInputText,
            ),
            const SizedBox(height: 20,),
            const Text('Куда', style: AppStyle.titleBlackText,),
            const SizedBox(height: 5,),
            TextField(
              decoration: getInputDecoration('Страна, Город, Аэропорт'),
              style: _textStyleInputText,
            ),
            const SizedBox(height: 20,),
            const Text('Дата отъезада', style: AppStyle.titleBlackText,),
            const SizedBox(height: 5,),
            SizedBox(
              child: TextField(
                  style: _textStyleInputText,
                  decoration: getDateInputDecoration(),
                keyboardType: TextInputType.datetime,
                inputFormatters: inputFormatters
              ),
            ),
            const SizedBox(height: 20,),
            const Text('Дата приезда', style: AppStyle.titleBlackText,),
            const SizedBox(height: 5,),
            TextField(
              style: _textStyleInputText,
              decoration: getDateInputDecoration(),
              keyboardType: TextInputType.datetime,
              inputFormatters: inputFormatters,
            ),
            const SizedBox(height: 24,),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: AppStyle.buttonStyle,
                onPressed: _onAdtTab,
                child: const Text('Разместить объявление')
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      actions: [
        TextButton(
          onPressed: () {},
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.only(right: 16)),
            foregroundColor: MaterialStatePropertyAll(Color(0xFF5162FF)),
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            elevation: MaterialStatePropertyAll(0),
            splashFactory: NoSplash.splashFactory,
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ),
          child: const Text('Сохранить и выйти'),
        )
      ],
      backgroundColor: AppStyle.backgroundColor,
      elevation: 0,
      foregroundColor: Colors.black,
    );
  }
}

InputDecoration getDateInputDecoration() {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    prefixIcon: const Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Image(image: AppImages.calendarImage,),
    ),
    prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 30),
    suffixIcon: const Image(image: AppImages.bottomImage),
    suffixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 30),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8)
    ),
    hintText: '6/11/2023г',
    hintStyle: AppStyle.smallGreyText,
  );
}

InputDecoration getInputDecoration(String hintText) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8)
    ),
    hintText: hintText,
    hintStyle: AppStyle.smallGreyText
  );
}
