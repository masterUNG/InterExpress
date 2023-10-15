// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ielproject/states/update_data.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_dialog.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_map.dart';
import 'package:ielproject/widgets/widget_process.dart';

class ShowMap extends StatefulWidget {
  const ShowMap({super.key});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  AppController appController = Get.put(AppController());

  Map<MarkerId, Marker> map = {};

  // ignore: prefer_typing_uninitialized_variables
  var pickUpIcon;

  LatLng latLng1 = const LatLng(12.575194143938125, 99.95883305288028);

  @override
  void initState() {
    super.initState();

    if (GetPlatform.isAndroid) {
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(48, 48)),
              'images/pickup128.png')
          .then((value) {
        pickUpIcon = value;
      });
    }

    if (GetPlatform.isIOS) {
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(48, 48)), 'images/pickup.png')
          .then((value) {
        pickUpIcon = value;
      });
    }

    AppService().processFindPosition().then((value) {
      print('position ====> ${appController.positions.last}');

      MarkerId markerId = const MarkerId('me');
      Marker marker = Marker(
        markerId: markerId,
        position: LatLng(appController.positions.last.latitude,
            appController.positions.last.longitude),
        // icon: BitmapDescriptor.defaultMarkerWithHue(60),
        icon: pickUpIcon,
        infoWindow: InfoWindow(
          title: 'คุณอยู่ที่นี่',
          snippet: appController.positions.last.toString(),
          onTap: () {
            AppDialog().normalDialog(
                title: 'Update Database',
                actionWidget: WidgetButton(
                  label: 'Update Data',
                  pressFunc: () {
                    Get.back();
                    Get.to(const UpdateData());
                  },
                ));
          },
        ),
      );
      map[markerId] = marker;

      MarkerId friendMarkerId = const MarkerId('friend');
      Marker friendMarker = Marker(
        markerId: friendMarkerId,
        position: latLng1,
        infoWindow: InfoWindow(
          title: 'สถานีเติ่มน้ำมัน',
          snippet: 'สำหรับพนักงานออฟฟิส',
          onTap: () {
            AppDialog().normalDialog(
                title: 'สถานีเติ่มน้ำมัน',
                actionWidget: WidgetButton(
                  label: 'หาเส้นทางไปที่นี่',
                  pressFunc: () {
                    Get.back();
                    String url =
                        'https://www.google.com/maps/search/?api=1&query=${latLng1.latitude},${latLng1.longitude}';
                    AppService().processOpenUrl(url: url);
                  },
                ));
          },
        ),
      );

      map[friendMarkerId] = friendMarker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return appController.positions.isEmpty
          ? const WidgetProcess()
          : WidgetMap(
              map: map,
            );
    });
  }
}
