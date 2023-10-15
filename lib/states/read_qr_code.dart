import 'package:flutter/material.dart';
import 'package:ielproject/utility/app_snackbar.dart';
import 'package:ielproject/widgets/widget_text.dart';
import 'package:scan/scan.dart';

class ReadQrCode extends StatefulWidget {
  const ReadQrCode({super.key});

  @override
  State<ReadQrCode> createState() => _ReadQrCodeState();
}

class _ReadQrCodeState extends State<ReadQrCode> {
  ScanController scanController = ScanController();

  @override
  void dispose() {
    super.dispose();
    scanController.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return SizedBox(
          width: boxConstraints.maxWidth,
          height: boxConstraints.maxHeight,
          child: ScanView(
            controller: scanController,
            onCapture: (data) {
              AppSnackBar(title: 'QR code', message: data.toString());
            },
          ),
        );
      }),
    );
  }
}
