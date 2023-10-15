// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:ielproject/utility/app_controller.dart';

class WidgetMap extends StatefulWidget {
  const WidgetMap({
    Key? key,
    required this.map,
  }) : super(key: key);

  final Map<MarkerId, Marker> map;

  @override
  State<WidgetMap> createState() => _WidgetMapState();
}

class _WidgetMapState extends State<WidgetMap> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: LatLng(appController.positions.last.latitude,
              appController.positions.last.longitude),
          zoom: 16),
          markers: Set<Marker>.of(widget.map.values),
    );
  }
}
