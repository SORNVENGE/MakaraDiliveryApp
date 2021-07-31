import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SendScan extends StatefulWidget {
  SendScan({Key? key}) : super(key: key);

  @override
  _SendScanState createState() => _SendScanState();
}

class _SendScanState extends State<SendScan> {
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
          title: Text('Send', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'bold'),),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Row(
                              children: [
                                Expanded(flex: 2, child: Container(width: 70,child: Text('Next Station*', style: TextStyle(color: Color(0xFFFEA422), fontSize: 14, fontFamily: 'bold'),))),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    width: 150,
                                    height: 50,
                                    child: TextField (  
                                      decoration: InputDecoration( 
                                        border: InputBorder.none, 
                                        hintText: '00008878',
                                        hintStyle: TextStyle(fontFamily: 'base')
                                      ),  
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                          Expanded(flex: 2, child: Text('ឃ្លាំងកណ្តាល', style: TextStyle(color: Colors.black54),)),
                        ],
                      ),
                    ),
                    
                    Divider(thickness: 0.8,color: Color(0xFFFEA422),),
                    Container(
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