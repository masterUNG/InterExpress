import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielproject/states/add_new_data.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_dialog.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_text.dart';

class ListData extends StatefulWidget {
  const ListData({super.key});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  void initState() {
    super.initState();
    AppService().processReadAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(builder: (AppController appController) {
        print(
            '#15oct ขนาดของ dataModels --> ${appController.dataModels.length}');

        return appController.dataModels.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: appController.dataModels.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    AppDialog().normalDialog(
                        title: appController.dataModels[index].employeeNo,
                        contentWidget: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            displayValue(
                                head: 'EmpIdCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmpIdEmail',
                                value: appController
                                    .dataModels[index].employeeEmail),
                            displayValue(
                                head: 'EmpIdMobileNo',
                                value: appController
                                    .dataModels[index].employeeMobileNo),
                            displayValue(
                                head: 'EmpIdTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                            displayValue(
                                head: 'EmpIdCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmpIdEmail',
                                value: appController
                                    .dataModels[index].employeeEmail),
                            displayValue(
                                head: 'EmpIdMobileNo',
                                value: appController
                                    .dataModels[index].employeeMobileNo),
                            displayValue(
                                head: 'EmpIdTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                            displayValue(
                                head: 'EmpIdCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmpIdEmail',
                                value: appController
                                    .dataModels[index].employeeEmail),
                            displayValue(
                                head: 'EmpIdMobileNo',
                                value: appController
                                    .dataModels[index].employeeMobileNo),
                            displayValue(
                                head: 'EmpIdTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                            displayValue(
                                head: 'EmpIdCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmpIdEmail',
                                value: appController
                                    .dataModels[index].employeeEmail),
                            displayValue(
                                head: 'EmpIdMobileNo',
                                value: appController
                                    .dataModels[index].employeeMobileNo),
                            displayValue(
                                head: 'EmpIdTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                            displayValue(
                                head: 'EmpIdCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmpIdEmail',
                                value: appController
                                    .dataModels[index].employeeEmail),
                            displayValue(
                                head: 'EmpIdMobileNo',
                                value: appController
                                    .dataModels[index].employeeMobileNo),
                            displayValue(
                                head: 'EmpIdTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                            displayValue(
                                head: 'EmpIdCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmpIdEmail',
                                value: appController
                                    .dataModels[index].employeeEmail),
                            displayValue(
                                head: 'EmpIdMobileNo',
                                value: appController
                                    .dataModels[index].employeeMobileNo),
                            displayValue(
                                head: 'EmpIdTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                            displayValue(
                                head: 'EmpIdCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmpIdEmail',
                                value: appController
                                    .dataModels[index].employeeEmail),
                            displayValue(
                                head: 'EmpIdMobileNo',
                                value: appController
                                    .dataModels[index].employeeMobileNo),
                            displayValue(
                                head: 'EmpIdTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                            displayValue(
                                head: 'EmpIdCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmpIdEmail',
                                value: appController
                                    .dataModels[index].employeeEmail),
                            displayValue(
                                head: 'EmpIdMobileNo',
                                value: appController
                                    .dataModels[index].employeeMobileNo),
                            displayValue(
                                head: 'EmpIdTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                            displayValue(
                                head: 'EmpIdCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmpIdEmail',
                                value: appController
                                    .dataModels[index].employeeEmail),
                            displayValue(
                                head: 'EmpIdMobileNo',
                                value: appController
                                    .dataModels[index].employeeMobileNo),
                            displayValue(
                                head: 'EmpIdTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                          ],
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                    child: Card(
                      color:
                          index % 2 == 0 ? Colors.white : Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            displayValue(
                                head: 'EmployeeNo',
                                value:
                                    appController.dataModels[index].employeeNo),
                            displayValue(
                                head: 'EmployeeIDCard',
                                value: appController
                                    .dataModels[index].employeeIDCard),
                            displayValue(
                                head: 'EmployeeTitleName',
                                value: appController
                                    .dataModels[index].employeeTitleName),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      }),
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

  WidgetText displayValue({required String head, required String value}) {
    return WidgetText(data: '$head = $value');
  }
}
