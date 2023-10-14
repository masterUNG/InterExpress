import 'package:flutter/material.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/widgets/widget_text.dart';

class ShowMap extends StatefulWidget {
  const ShowMap({super.key});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  @override
  void initState() {
    super.initState();
    AppService().processFindPosition();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetText(data: 'This is ShowMap');
  }
}
