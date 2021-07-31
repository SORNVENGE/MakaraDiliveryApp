
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
// import 'package:signature/signature.dart';
enum OVERLAY_POSITION { TOP, BOTTOM }
class PodScanedDetail extends StatefulWidget {
  PodScanedDetail({Key? key}) : super(key: key);

  @override
  _PodScanedDetailState createState() => _PodScanedDetailState();
}

class _PodScanedDetailState extends State<PodScanedDetail> {
  var locations = [
    {'locat': 'Beong Keng Korng'},
    {'locat': 'Toul Tom Poung'},
    {'locat': 'Toul Kork'},
    {'locat': 'Beong Tom Pom'},
    {'locat': 'Mai Da'},
    {'locat': 'Street 2004'},
  ];
  bool isSignature = false, showLocatSelection = false;
  String location = '';

  @override
  void initState() { 
    super.initState();
    // controller = SignatureController();
    
  }

  @override
  void dispose() { 
    // controller.dispose();
    super.dispose();
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;

  String imageUrl = '';
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
        )
      ),
      body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: Container(
              // padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [           
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFFEA422), width: 0.8))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Row(
                              children: [
                                Expanded(flex: 2, child: Container(width: 70,child: Text('Waybill number*', style: TextStyle(color: Color(0xFFFEA422), fontSize: 14,fontFamily: 'bold'),))),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    height: 50,
                                    child: TextField (  
                                      decoration: InputDecoration( 
                                        border: InputBorder.none, 
                                        hintText: '00008878',
                                        hintStyle: TextStyle(fontFamily: 'base') 
                                      ),  
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFBBBBBB), width: 0.8))
                      ),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(flex: 2, child: Container(width: 70,child: Text('Consignee type*', style: TextStyle(color: Color(0xFF6E6E6C), fontSize: 14,fontFamily: 'bold'),))),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(
                              flex: 6,
                              child: GestureDetector(
                                onTap: (){
                                  _handleShowLocatSelection(locations);
                                },
                                child: Text(location != '' ? location : 'Please choose a location', style: TextStyle(color: Colors.black54, fontFamily: 'base'),),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.chevron_right, color: Colors.black54, size: 25,)
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border(
                        bottom: BorderSide(color: Color(0xFFBBBBBB), width: 0.8))
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(flex: 2, child: Container(width: 70,child: Text('Signer*', style: TextStyle(color: Color(0xFF6E6E6C), fontSize: 14,fontFamily: 'bold'),))),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(
                              flex: 7,
                              child: GestureDetector(
                                onTap: (){_showPicker(context);},
                                child: Text('Photo sign', style: TextStyle(color: Colors.black54),),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
    
                    imageUrl!=''? Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFBBBBBB), width: 0.8))
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(flex: 2, child: Container(width: 70,child: Text('Picture', style: TextStyle(color: Color(0xFF6E6E6C), fontSize: 14,fontFamily: 'base'),))),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(
                              flex: 7,
                              child: Container(
                                width: 150,height: 80,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Image.file( File(imageUrl) ),
                                    Positioned(
                                      bottom: 60, left: 70,
                                      child: GestureDetector(
                                        onTap: (){setState(() {
                                          imageUrl = '';
                                        });},
                                        child: Icon(Icons.cancel, color: Colors.red,),
                                      )
                                    )
                                  ],
                                  
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ):Container(),
                        
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              child: Text('E-Signature', style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'base'),),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              child: Text('Please sign here', style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'base'),),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 150,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 0.6)
                        ),
                        // color: Colors.blueAccent,
                        child: isSignature ? 
                          SfSignaturePad()
                        : GestureDetector(
                          onTap: (){ 
                            setState(() {
                              isSignature = true;
                            });
                          },
                          child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Noun_Project_Signature_icon_619326_cc.svg/1200px-Noun_Project_Signature_icon_619326_cc.svg.png',
                                width: 40, height: 40,
                              ),
                              SizedBox(height: 5),
                              Text('Add Signature', style: TextStyle(color: Colors.black54, fontFamily: 'base'),)
                            ],
                          ),
                      ),
                        ),
                      ),

                    )
                  ],
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                color: Color(0xFFFEA422),
                child: Text('Add', style: TextStyle(color: Color(0xFFE9E8E8), fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'bold'),),
              ),
            )
          ],
        ),
      ),
    );
  }


  _handleShowLocatSelection(locations) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child:Container(
            height: MediaQuery.of(context).size.height/3,
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              physics: ScrollPhysics(),
              itemCount: locations.length,
              itemBuilder: (BuildContext context, int index) {
                var data = locations[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFB4B3B3), width: 0.5))
                  ),
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        location = data['locat'];
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(data['locat'], style: TextStyle(color: Colors.black54),),
                  ),
                );
              }
              
            )
          ),
        );
      }
    );
  }
  _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Photo Library', style: TextStyle(fontFamily: 'IntroHeadB', )),
                  onTap: () {
                    _getFromGallery();
                  }
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera', style: TextStyle(fontFamily: 'IntroHeadB', )),
                  onTap: () {
                    _getFromCamera();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }


   Future _getFromGallery() async {
    final picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);
    Navigator.pop(context);
    print({'___', image!.path});

    setState(() { imageUrl = image.path; });
  }

  Future _getFromCamera() async {
    final picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.camera);
      Navigator.pop(context);
      setState(() { imageUrl = image!.path; });
  }


}