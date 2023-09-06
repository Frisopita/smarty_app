import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smarty_app/bluetooth/bluetooth.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smarty_app/variables.dart';
import 'package:smarty_app/Providers/qrtext_provider.dart';
import 'package:provider/provider.dart';

class QrboardPage extends StatefulWidget {
  const QrboardPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrboardPageState();
}

class _QrboardPageState extends State<QrboardPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String qrText = "";
  final TextEditingController _textEditingController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Establecer el TextEditingController en el QrTextProvider
    Provider.of<QrTextProvider>(context, listen: false).textEditingController =
        _textEditingController1;
  }

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

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        final code = scanData.code;
        if (code == null) return;
        qrText = code;
        // Actualiza el valor en el QrTextProvider
        context.read<QrTextProvider>().updateText(code);
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
    _textEditingController1.dispose();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png',
          fit: BoxFit.cover,
          height: 100,
          width: 130,
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Scan QR Code',
                textAlign: TextAlign.center,
                style: titleLabel,
              ),
            ),
            SizedBox(
              child: _buildQrView(context),
            ), // QR view gets more space
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'or Enter Id number',
                textAlign: TextAlign.center,
                style: titleLabel,
              ),
            ),
            Padding(
              // Add some padding to bound the TextField
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (text) {
                  qrText = text;
                  // Actualiza el valor en el QrTextProvider
                  context.read<QrTextProvider>().updateText(text);
                },
                controller: Provider.of<QrTextProvider>(context)
                    .textEditingController, // Usar el TextEditingController del QrTextProvider,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: result != null ? '${result!.code}' : 'Enter id',
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                final textProvider = context.read<QrTextProvider>();
                if (textProvider.text == null || textProvider.text!.isEmpty) {
                  return;
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FindDevicesScreen(qrText: qrText),
                  ),
                );
              },
              child: const Text("Connect"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return SizedBox(
      width: 310, // Establece el ancho deseado
      height: 310, // Establece la altura deseada
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }
}