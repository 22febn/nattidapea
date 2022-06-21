// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:nattidapea/utility/my_constant.dart';
import 'package:nattidapea/utility/my_dialog.dart';
import 'package:nattidapea/widgets/show_button.dart';
import 'package:nattidapea/widgets/show_form.dart';
import 'package:nattidapea/widgets/show_image.dart';
import 'package:nattidapea/widgets/show_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusScopeNode());
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                newlogo(boxConstraints),
                newTitle(),
                formUser(boxConstraints),
                formPassword(boxConstraints),
                buttonLogin(boxConstraints)
              ],
            ),
          ),
        );
      }),
    );
  }

  Container buttonLogin(BoxConstraints boxConstraints) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      width: boxConstraints.maxWidth * 0.6,
      child: ShowButton(
        label: 'Login',
        pressFunc: () {
          print('user = $user, password = $password');
          if (((user?.isEmpty ?? true) || (password?.isEmpty ?? true))) {
            print('Have Space');
            MyDialog(context: context).normalDialog(
                title: 'Have Space ?', subTitle: 'Please Fill Every Blank');
          } else {
            print('No Space');
          }
        },
      ),
    );
  }

  Container formPassword(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 40,
      width: boxConstraints.maxWidth * 0.6,
      child: ShowForm(
        redEyeFunc: () {
          setState(() {
            redEye = !redEye;
          });
        },
        obSecu: redEye,
        hint: 'Password',
        iconData: Icons.sunny,
        changeFung: (String string) {
          password = string.trim();
        },
      ),
    );
  }

  Container formUser(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        hint: 'User :',
        iconData: Icons.favorite,
        changeFung: (String string) {
          user = string.trim();
        },
      ),
    );
  }

  ShowText newTitle() {
    return ShowText(
      text: 'Login:',
      textStyle: MyConstant().h1Style(),
    );
  }

  SizedBox newlogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.25,
      child: ShowImage(),
    );
  }
}
