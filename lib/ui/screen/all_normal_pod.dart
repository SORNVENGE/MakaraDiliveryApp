import 'package:bpa_express_app/ui/screen/dispatch_order_detail.dart';
import 'package:bpa_express_app/ui/screen/scan_barcode_screen.dart';
import 'package:flutter/material.dart';

class NormalPODList extends StatefulWidget {
  NormalPODList({Key? key}) : super(key: key);

  @override
  _NormalPODListState createState() => _NormalPODListState();
}

class _NormalPODListState extends State<NormalPODList> {

  List<dynamic> menuList=[ 'Normal Piece','Problem'];
  int status = 0;
  bool statusSelectAll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child:AppBar(
          backgroundColor: Color(0xFFFEA422),
          leading: TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
          ),
          title: TextButton(
            onPressed: (){},
            child: Row(
              children: [
                Text('All Delivery ', style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'bold'),),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    child: Icon(Icons.expand_more_outlined, color: Colors.white, size: 18,), 
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){},
              child: Icon(Icons.map_outlined, color: Colors.white,size: 22,),
            ),
            TextButton(
              onPressed: (){},
              child: Icon(Icons.add, color: Colors.white,size: 22,),
            ),
            
          ],
        )
      ),
      body: Container(
        color: Color(0xEEF8F5F5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 14, fontFamily: 'base'),
                  hintText: "Enter the tracking number / 4 digits",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: TextButton(
                      onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanBarcode()));},
                      child: Icon( Icons.flip_outlined, color: Colors.grey, size: 30,)
                    ), // icon is 48px widget.
                  ),
                ),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: menuList.asMap().map((index, value) {
                          return MapEntry(index,
                           Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide( color: index == status ? Color(0xFFFEA422) :Colors.white, width: 1 )
                                )
                              ),
                              child: TextButton(
                                onPressed: (){setState(() {status = index;});},
                                child: Container(
                                  child: Text(value, style: TextStyle(color: status == index ? Color(0xFFFEA422) : Colors.black54, fontFamily: 'bold'),),
                                ),
                              ),
                            ), 
                          ));
                        }).values.toList() 
                      ),
                    ), 
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){},
                    child: Text('Reverse by dispatch scan time', style: TextStyle(color: Color(0xFFFEA422), fontFamily: 'base'),)
                  ),
                  Icon(Icons.arrow_right_outlined, color: Color(0xFFFEA422),size: 30,)
                ],
              ),
            ),

            Expanded(
              flex: 9,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(0),
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DispatchOrderDetail()));
                    },
                    child: Card (
                      color: Colors.grey[100],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: (){
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PickupListDetail()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon ( Icons.check_circle, color: Colors.grey, size: 18 ),
                                    Container( padding: EdgeInsets.only(left: 10), width: 200,
                                      child: Text("85585500404907085", style: TextStyle(fontSize:13, color: Colors.black54, fontFamily: 'base'), )
                                    ),
                                  ],
                                ),
                                Text('19-10 15:40',style: TextStyle(fontSize:13, color: Colors.black54, fontFamily: 'base'))
                              ],
                            )
                          ),
                          Padding( padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: Text("VP0123435252525254343", style: TextStyle(fontSize:13, fontFamily: 'base'), ),
                          ),
                          
                          Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text("TEST B", style: TextStyle(fontSize:13, fontFamily: 'base'), ),
                          ),
                          Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Row(
                              children: [
                                Text("099877355", style: TextStyle(fontSize:13, color: Color(0xFFFEA422), fontFamily: 'base'), ),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Icon(Icons.call, color: Color(0xFFFEA422), size: 18,)
                              ],
                            ),
                          ),
                          Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text("Street 23b hadjk", style: TextStyle(fontSize:13, fontFamily: 'base'), ),
                          ),
                          Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text("Delivered 1 time", style: TextStyle(fontSize:13, color: Color(0xFFF03D10,), fontFamily: 'base'), ),
                          ),
                          Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Row(
                              children: [
                                Icon(Icons.near_me_outlined, color: Color(0xFFFEA422), size: 18,),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Text("333.1km", style: TextStyle(fontSize:13, color: Color(0xFFFEA422), fontFamily: 'base'), )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
               },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.check_circle, color: statusSelectAll ? Color(0xFFFEA422) : Colors.grey, size: 22),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: (){},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select all', style: TextStyle(fontFamily: 'base', fontSize: 15, color: Color(0xFF292929)),),
                            Padding(padding: EdgeInsets.only(top: 3)),
                            Text('Selected article is 0.', style: TextStyle(fontFamily: 'base', color: Color(0xFFFEA422)))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}