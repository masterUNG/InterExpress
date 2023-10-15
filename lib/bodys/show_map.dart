import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/widgets/widget_process.dart';
import 'package:ielproject/widgets/widget_text.dart';

class ShowMap extends StatefulWidget {
  const ShowMap({super.key});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().processFindPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return appController.positions.isEmpty
          ? const WidgetProcess()
          : WidgetText(data: appController.positions.last.toString());
    });
  }
}
