import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanBarcode extends StatefulWidget {
  ScanBarcode({Key? key}) : super(key: key);

  @override
  _ScanBarcodeState createState() => _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanBarcode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  late QRViewController controller;

 void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child:AppBar(
          backgroundColor: Color(0xFFFEA422),
          leading: TextButton( onPressed: (){ Navigator.of(context).pop(); },
            child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
          ),
          title: Text('Scan', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'bold'),),
          actions: [
            TextButton(
              onPressed: (){},
              child: Icon(Icons.offline_bolt, color: Colors.white,size: 25,),
            ),
          ],
        )
      ),
      body: Container(
        child: Container(
          height: MediaQuery.of(context).size.height-100,
          color: Colors.blueGrey,
          child: QRView(
            // cameraFacing: CameraFacing.back,
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
        ),
      ),
    );
  }
}