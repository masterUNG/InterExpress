// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';

import 'package:ielproject/models/data_model.dart';
import 'package:ielproject/utility/app_constant.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/utility/app_snackbar.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_form.dart';
import 'package:ielproject/widgets/widget_text.dart';

class EditData extends StatefulWidget {
  const EditData({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final DataModel dataModel;

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  String? empIdCard, empNo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool change = false;

  @override
  void initState() {
    super.initState();

    empIdCard = widget.dataModel.employeeIDCard;
    empNo = widget.dataModel.employeeNo;

    nameController.text = widget.dataModel.employeeTitleName;
    emailController.text = widget.dataModel.employeeEmail;
    phoneController.text = widget.dataModel.employeeMobileNo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Edit Data'),
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
                    changeFunc: (p0) {
                      change = true;
                    },
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
                    changeFunc: (p0) {
                      change = true;
                    },
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
                    changeFunc: (p0) {
                      change = true;
                    },
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
                    label: 'Edit Data',
                    pressFunc: () {
                      if (change) {
                        //Have Change

                        Map<String, dynamic> map = {};
                        map['Id'] = widget.dataModel.id;
                        map['EmployeeIDCard'] = empIdCard;
                        map['EmployeeNo'] = empNo;
                        map['EmployeeTitleName'] = nameController.text;
                        map['EmployeeEmail'] = emailController.text;
                        map['EmployeeMobileNo'] = phoneController.text;

                        print('###14oct map at edit_data --> $map');

                        AppService().processUpdateData(map: map);
                      } else {
                        AppSnackBar(
                                title: 'ไม่มีการเปลี่ยนแปลง',
                                message: 'ต้องแก้ไขอะไร ? บ้าง')
                            .errorSnackBar();
                      }

                      // AppService().insertNewData(map: map);
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
