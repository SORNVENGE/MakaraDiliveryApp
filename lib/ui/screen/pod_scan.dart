import 'package:bpa_express_app/ui/screen/pod_scaned_detail.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class PodScan extends StatefulWidget {
  PodScan({Key? key}) : super(key: key);

  @override
  _PodScanState createState() => _PodScanState();
}

class _PodScanState extends State<PodScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  late QRViewController controller;
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
          title: Text('POD', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'bold'),),
          actions: [
            TextButton(
              onPressed: (){},
              child: Icon(Icons.offline_bolt, color: Colors.white,size: 25,),
            ),
            TextButton(
              onPressed: (){},
              child: Icon(Icons.border_color_outlined, color: Colors.white,size: 22,),
            ),
            TextButton(
              onPressed: (){},
              child: Icon(Icons.list_alt_outlined, color: Colors.white,size: 22,),
            ),
            
          ],
        )
      ),
       body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blueGrey,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              )
            ),
            Expanded(
              flex: 7,
              child: Container(
                // padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    GestureDetector(
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => PodScanedDetail()));},
                      child: Container(
                        color: Colors.black12,
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total 0', style: TextStyle(color: Colors.black54, fontSize: 16, fontFamily: 'bold'),),
                            Column(
                              children: [
                                GestureDetector(child: Icon(Icons.expand_more_outlined, color: Color(0xFFFEA422),)),
                                GestureDetector(child: Icon(Icons.expand_less_outlined, color: Color(0xFFFEA422),)),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),

      ),
    );
  }

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
}