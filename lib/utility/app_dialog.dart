import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_image_asset.dart';
import 'package:ielproject/widgets/widget_text.dart';

class AppDialog {
  void normalDialog({
    required String title,
    String? pathImage,
    Widget? contentWidget,
    Widget? actionWidget,
    Widget? secondActionWidget,
  }) {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        icon: WidgetImageAsset(
          path: pathImage,
          size: 150,
        ),
        title: WidgetText(data: title),
        content: contentWidget,
        actions: [
          actionWidget ?? const SizedBox(),
          secondActionWidget ?? (actionWidget == null
              ? WidgetButton(
                  gfButtonType: GFButtonType.transparent,
                  label: 'OK',
                  pressFunc: () {
                    Get.back();
                  },
                )
              : WidgetButton(
                  gfButtonType: GFButtonType.outline,
                  label: 'Cancel',
                  pressFunc: () {
                    Get.back();
                  },
                )),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
