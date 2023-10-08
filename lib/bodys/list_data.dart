import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielproject/states/add_new_data.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_text.dart';

class ListData extends StatelessWidget {
  const ListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const WidgetText(data: 'This is ListData'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddNewData());
        },
        child: const Icon(Icons.add),
      ),
      // floatingActionButton: WidgetButton(
      //   label: 'Add New Data',
      //   pressFunc: () {},
      // ),
    );
  }
}
