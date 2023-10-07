import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:ielproject/utility/app_constant.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/utility/app_snackbar.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_form.dart';
import 'package:ielproject/widgets/widget_icon_button.dart';
import 'package:ielproject/widgets/widget_image_asset.dart';
import 'package:ielproject/widgets/widget_text.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  AppController appController = Get.put(AppController());

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          decoration: AppConstant().linearBox(),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        displayLogoAppname(),
                        const SizedBox(
                          height: 16,
                        ),
                        WidgetForm(
                          hint: 'User :',
                          suffixWidget: const Icon(Icons.person),
                          textEditingController: userController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        passwordWidget(),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 250,
                          child: WidgetButton(
                            label: 'Login',
                            pressFunc: () {
                              if ((userController.text.isEmpty) ||
                                  (passwordController.text.isEmpty)) {
                                //Have Space
                                AppSnackBar(
                                        title: 'Have Space ?',
                                        message: 'Please Fill Every Blank')
                                    .errorSnackBar();
                              } else {
                                //No Space
                                AppService().checkAuthen(
                                    user: userController.text, password: passwordController.text);
                              }
                            },
                            gfButtonShape: GFButtonShape.pills,
                            gfButtonType: GFButtonType.solid,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Obx passwordWidget() {
    return Obx(() {
      return WidgetForm(
        textEditingController: passwordController,
        hint: 'Password :',
        obscure: appController.redEye.value,
        suffixWidget: WidgetIconButton(
          iconData: appController.redEye.value
              ? Icons.remove_red_eye
              : Icons.remove_red_eye_outlined,
          pressFunc: () {
            appController.redEye.value = !appController.redEye.value;
          },
        ),
      );
    });
  }

  Row displayLogoAppname() {
    return Row(
      children: [
        WidgetImageAsset(
          size: 64,
        ),
        SizedBox(
          width: 16,
        ),
        WidgetText(
          data: AppConstant.appName,
          textStyle: AppConstant().h1Style(size: 32),
        )
      ],
    );
  }
}
