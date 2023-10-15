// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/utility/app_snackbar.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_icon_button.dart';
import 'package:ielproject/widgets/widget_image_asset.dart';
import 'package:ielproject/widgets/widget_text.dart';

import 'package:dio/dio.dart' as dio;

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  AppController appController = Get.put(AppController());

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (appController.files.isNotEmpty) {
      appController.files.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Update Data'),
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return SizedBox(
          width: boxConstraints.maxWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              displayImage(boxConstraints),
              WidgetText(data: 'DateTime : $dateTime'),
              WidgetText(data: 'Position : ${appController.positions.last}'),
              WidgetButton(
                label: 'Update Data',
                pressFunc: () {
                  if (appController.files.isEmpty) {
                    AppSnackBar(
                            title: 'ยังไม่มีรูป', message: 'Please Take Photo')
                        .errorSnackBar();
                  } else {
                    processUploadImage();
                  }
                },
              )
            ],
          ),
        );
      }),
    );
  }

  Future<void> processUploadImage() async {
    String url = 'https://dev-api-ismart.interexpress.co.th/Test/uploads';
    String nameImage = 'image${Random().nextInt(1000)}.png';

    Map<String, dynamic> map = {};
    map['files'] = await dio.MultipartFile.fromFile(
        appController.files.last.path,
        filename: nameImage);

    dio.FormData formData = dio.FormData.fromMap(map);

    dio.Dio _dio = dio.Dio();
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Authorization'] =
        'Bearer ${appController.tokenModels.last.accessToken}';

    await _dio.post(url, data: formData).then((value) {
      print('### Upload $nameImage Success value from Server ---> $value' );
    }).catchError((onError) {
      print('### onError --> $onError');
    });
  }

  SizedBox displayImage(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.75,
      height: boxConstraints.maxWidth * 0.75,
      child: Stack(
        children: [
          Obx(() {
            return appController.files.isEmpty
                ? const WidgetImageAsset(
                    path: 'images/image.png',
                  )
                : SizedBox(
                    width: boxConstraints.maxWidth * 0.75,
                    height: boxConstraints.maxWidth * 0.75,
                    child: Image.file(
                      appController.files.last,
                      fit: BoxFit.cover,
                    ),
                  );
          }),
          Positioned(
            bottom: 0,
            right: 0,
            child: WidgetIconButton(
              iconData: Icons.add_a_photo,
              pressFunc: () {
                AppService().processTakePhoto();
              },
            ),
          )
        ],
      ),
    );
  }
}
