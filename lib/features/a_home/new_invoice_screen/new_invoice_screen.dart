import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:saqrelfirgany/core/components/app_bar/back_app_bar.dart';
import 'package:saqrelfirgany/core/widgets/custom_elevated_button.dart';

import '../../../core/theme/theme_helper.dart';
import '../../../core/utils/size_utils.dart';
import '../../../l10n/app_localizations.dart';

class NewInvoiceScreen extends StatefulWidget {
  NewInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<NewInvoiceScreen> createState() => _NewInvoiceScreenState();
}

class _NewInvoiceScreenState extends State<NewInvoiceScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isCameraActive = true;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final l10n = AppLocalizations.of(context);
    log('build New Invoice');

    return Scaffold(
      appBar: BackAppBar(title: l10n.newInvoice),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                width: 116.h,
                height: 40.v,
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                text: 'Flash',
                leftIcon: FutureBuilder(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    return Icon(
                      snapshot.data ?? false ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                    );
                  },
                ),
              ),
              SizedBox(width: 8.h),
              CustomElevatedButton(
                width: 116.h,
                height: 40.v,
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                },
                text: 'Camera',
                leftIcon: FutureBuilder(
                  future: controller?.getCameraInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Icon(
                        Icons.flip_camera_ios,
                        color: Colors.white,
                      );
                    } else {
                      return const Text('loading');
                    }
                  },
                ),
              ),
              SizedBox(width: 8.h),
              CustomElevatedButton(
                width: 116.h,
                height: 40.v,
                onPressed: () async {
                  log('isCameraActive::$isCameraActive');
                  if (isCameraActive == true) {
                    log('isCameraActive::pauseCamera');
                    await controller?.pauseCamera();
                    isCameraActive = false;
                  } else {
                    log('isCameraActive::resumeCamera');
                    await controller?.resumeCamera();
                    isCameraActive = true;
                  }
                  setState(() {});
                },
                text: isCameraActive == true ? 'Pause' : 'Resume',
                leftIcon: Icon(
                  isCameraActive == true ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildQrView(context),
          SizedBox(height: 16.h),
          result != null
              ? Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Barcode Type: ${describeEnum(result!.format)}¬',
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Data: ${result!.code}',
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                )
              : Text(
                  'Scan a code',
                  style: theme.textTheme.titleLarge,
                ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea =
        (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 150.0 : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return SizedBox(
      height: 200.v,
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutWidth: 300,
          cutOutHeight: 300,
          // cutOutSize: scanArea,
        ),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
