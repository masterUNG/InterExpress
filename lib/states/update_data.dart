import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/widgets/widget_text.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {

  AppController appController = Get.put(AppController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Update Data'),
      ),
      body: WidgetText(data: 'Your Location :'),
    );
  }
}
