
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
// import 'package:signature/signature.dart';
enum OVERLAY_POSITION { TOP, BOTTOM }
class ProblemDispatch extends StatefulWidget {
  ProblemDispatch({Key? key}) : super(key: key);

  @override
  _ProblemDispatchState createState() => _ProblemDispatchState();
}

class _ProblemDispatchState extends State<ProblemDispatch> {
  var exceptionTypes = [
    {'type': 'Broke'},
    {'type': 'Can not accept'},
    {'type': 'Wet'},
    {'type': 'Mai Da'},
  ];
  bool isSignature = false, showLocatSelection = false;
  String type = '';

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
        child: Container()
        // AppBar(
        //   backgroundColor: Color(0xFFFEA422),
        //   leading: TextButton( onPressed: (){ Navigator.of(context).pop(); },
        //     child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
        //   ),
        //   title: Text('POD', style: TextStyle(color: Colors.white, fontSize: 18),),
        // )
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
                                Expanded(flex: 2, child: Container(width: 70,child: Text('Waybill number*', style: TextStyle(color: Color(0xFFFEA422), fontSize: 14,),))),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    height: 50,
                                    child: TextField (  
                                      decoration: InputDecoration( 
                                        border: InputBorder.none, 
                                        hintText: '00008878'  
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
                            Expanded(flex: 2, child: Container(width: 70,child: Text('Exception type*', style: TextStyle(color: Color(0xFF6E6E6C), fontSize: 14,),))),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(
                              flex: 6,
                              child: GestureDetector(
                                onTap: (){
                                  _handleShowLocatSelection(exceptionTypes);
                                },
                                child: Text(type != '' ? type : 'Please click to select exception type', style: TextStyle(color: Colors.black54),),
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
                            Expanded(flex: 8, child: Container(width: 70,child: Text('Need to send sign again*', style: TextStyle(color: Color(0xFF6E6E6C), fontSize: 14,),))),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                child: Icon(Icons.check_circle, color:  Color(0xFFFEA422)),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFDFDF), width: 0.8))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Row(
                              children: [
                                Expanded(flex: 2, child: Container(width: 70,child: Text('Exception Description', style: TextStyle(color: Color(0xFF6E6E6C), fontSize: 14,),))),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    height: 50,
                                    child: TextField (  
                                      decoration: InputDecoration( 
                                        border: InputBorder.none, 
                                        // hintText: '00008878'  
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
                            Expanded(flex: 2, child: Container(width: 70,child: Text('Picture', style: TextStyle(color: Color(0xFF6E6E6C), fontSize: 14,),))),
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
                    ):Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: (){_showPicker(context);},
                        child: Container(
                          width: 100,height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFBBBBBB), width: 0.5)
                          ),
                          child: Icon(Icons.add_a_photo_outlined, color: Color(0xFFC5C5C4),size: 30,),
                        ),
                      ),
                    ),
                        
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
                child: Text('Add', style: TextStyle(color: Color(0xFFE9E8E8), fontWeight: FontWeight.w500, fontSize: 20),),
              ),
            )
          ],
        ),
      ),
    );
  }


  _handleShowLocatSelection(exceptionTypes) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child:Container(
            height: MediaQuery.of(context).size.height/3,
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              physics: ScrollPhysics(),
              itemCount: exceptionTypes.length,
              itemBuilder: (BuildContext context, int index) {
                var data = exceptionTypes[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFB4B3B3), width: 0.5))
                  ),
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        type = data['type'];
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(data['type'], style: TextStyle(color: Colors.black54),),
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