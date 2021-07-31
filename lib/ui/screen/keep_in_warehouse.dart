import 'package:bpa_express_app/ui/screen/pod_scaned_detail.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class KeepInWarehouse extends StatefulWidget {
  KeepInWarehouse({Key? key}) : super(key: key);

  @override
  _KeepInWarehouseState createState() => _KeepInWarehouseState();
}

class _KeepInWarehouseState extends State<KeepInWarehouse> {
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
          title: Text('Keep in warehouse', style: TextStyle(color: Colors.white, fontSize: 18),),
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
                    TextButton(
                      onPressed: (){},
                      child: Container(
                        padding: EdgeInsets.only(left:10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 9,
                              child: Row(
                                children: [
                                  Text('Reason of keeping', style: TextStyle(color: Colors.black54, fontSize: 12),),
                                  Text('*', style: TextStyle(color: Colors.redAccent),),
                                  Padding(padding: EdgeInsets.only(left: 5)),
                                  Text('Please click to select keep', style: TextStyle(color: Colors.black54, fontSize: 14),),

                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(Icons.navigate_next_outlined, color: Colors.black54,),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    
                    GestureDetector(
                      child: Container(
                        color: Colors.black12,
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total 0', style: TextStyle(color: Colors.black54, fontSize: 16),),
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