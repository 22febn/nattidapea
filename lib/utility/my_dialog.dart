// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nattidapea/utility/my_constant.dart';
import 'package:nattidapea/widgets/show_image.dart';
import 'package:nattidapea/widgets/show_text.dart';
import 'package:nattidapea/widgets/show_text_button.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  Future<void> normalDialog({
    String? label2,
    Function()? pressFunc2,
    required String title,
    required String subTitle,
    String? label,
    Function()? pressFunc,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: ShowText(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(text: subTitle),
        ),
        actions: [
          pressFunc == null
              ? ShowTextButton(
                  label: 'OK',
                  pressFunc: () {
                    Navigator.pop(context);
                  })
              : ShowTextButton(label: label!, pressFunc: pressFunc),
          pressFunc2 == null
              ? const SizedBox()
              : ShowTextButton(label: label2!, pressFunc: pressFunc2),
        ],
      ),
    );
  }
}
