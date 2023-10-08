import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:ielproject/utility/app_constant.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_form.dart';
import 'package:ielproject/widgets/widget_text.dart';

class AddNewData extends StatefulWidget {
  const AddNewData({super.key});

  @override
  State<AddNewData> createState() => _AddNewDataState();
}

class _AddNewDataState extends State<AddNewData> {
  String? empIdCard, empNo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    empIdCard = 'id-${Random().nextInt(1000000)}';
    empNo = 'no-${Random().nextInt(1000000)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Add New Data'),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const WidgetText(data: 'EmployeeIDCard :'),
                      WidgetText(
                        data: empIdCard ?? '',
                        textStyle: AppConstant().h2Style(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const WidgetText(data: 'EmployeeNo :'),
                      WidgetText(
                        data: empNo ?? '',
                        textStyle: AppConstant().h2Style(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 16),
                  child: WidgetForm(
                    textEditingController: nameController,
                    labelWidget: const WidgetText(data: 'Name :'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 16),
                  child: WidgetForm(
                    textEditingController: emailController,
                    labelWidget: const WidgetText(data: 'Email :'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 16),
                  child: WidgetForm(
                    textEditingController: phoneController,
                    labelWidget: const WidgetText(data: 'Phone Number :'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 16),
                  child: WidgetButton(
                    label: 'Add New Data',
                    pressFunc: () {
                      Map<String, dynamic> map = {};
                      map['EmployeeIDCard'] = empIdCard;
                      map['EmployeeNo'] = empNo;
                      map['EmployeeTitleName'] = nameController.text;
                      map['EmployeeEmail'] = emailController.text;
                      map['EmployeeMobileNo'] = phoneController.text;

                      AppService().insertNewData(map: map);
                    },
                    gfButtonShape: GFButtonShape.pills,
                    gfButtonType: GFButtonType.outline2x,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
