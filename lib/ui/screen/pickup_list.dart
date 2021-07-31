import 'package:bpa_express_app/ui/component/header.dart';
import 'package:bpa_express_app/ui/screen/pickup_list_detail.dart';
import 'package:flutter/material.dart';

class PickupList extends StatefulWidget {
  PickupList({Key? key}) : super(key: key);

  @override
  _PickupListState createState() => _PickupListState();
}

class _PickupListState extends State<PickupList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child:AppBar(
          backgroundColor: Color(0xFFFEA422),
          leading: TextButton(
            onPressed: (){Navigator.of(context).pop();},
            child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
          ),
          title: Row(
            children: [
              Text('Pickup List', style: TextStyle(color: Colors.white, fontSize: 15),),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  child: Icon(Icons.expand_more_outlined, color: Colors.white, size: 18,), 
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){},
              child: Icon(Icons.bluetooth, color: Colors.white,size: 22,),
            ),
            TextButton(
              onPressed: (){},
              child: Icon(Icons.map_outlined, color: Colors.white,size: 22,),
            ),
            
          ],
        )
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontSize: 13),
                    hintText: "Enter the last 4 order number/tracking number/send",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon( Icons.flip_outlined, color: Colors.grey, size: 30,), // icon is 48px widget.
                    ),
                  ),
                )
              ),
              Padding(padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('A total of 1 piece', style: TextStyle(fontSize: 13),),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text('Booking time', style: TextStyle(fontSize: 13, color: Color(0xFFFEA422)),),
                          Text('(descending)', style: TextStyle(fontSize: 13, color: Color(0xFFFEA422)),),
                          Icon(Icons.arrow_right,color: Color(0xFFFEA422), size: 30, )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Card (
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PickupListDetail()));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon ( Icons.check_circle, color: Colors.grey, size: 18 ),
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  Text("Booking number: T200012343", style: TextStyle(fontSize:13, color: Colors.black54), )
                                ],
                              ),
                            ),
                            Text("19-10 15:12", style: TextStyle(fontSize:13, color: Colors.grey), ),
                          ],
                        ),
                      ),
                    ),
                    Padding( padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Text("Waybill NO: 855855004049070", style: TextStyle(fontSize:13), ),
                    ),
                    
                    Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Text("Test A", style: TextStyle(fontSize:13), ),
                    ),
                    Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Text("Appointment time: ", style: TextStyle(fontSize:13), ),
                    ),
                    Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Text("Test A", style: TextStyle(fontSize:13), ),
                    ),
                    Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Text("Don't forget to change for individule orders!", style: TextStyle(fontSize:13, color: Color(0xFFFEA422)), ),
                    ),
                    Padding( padding: EdgeInsets.only(left:10, right: 10),
                      child: Divider(thickness: 1,),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextButton(
                            onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.settings_phone_outlined, color:Color(0xFFFEA422) ,),
                                Padding(padding: EdgeInsets.only(left: 20),
                                  child: Text('+855 0987643', style: TextStyle(color:Color(0xFFFEA422)),),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(height: 45 , child: VerticalDivider(color: Colors.black12,thickness: 1,)),
                        Expanded(
                          flex: 5,
                          child: TextButton(
                            onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.near_me_outlined, color:Color(0xFFFEA422) ,),
                                Padding(padding: EdgeInsets.only(left: 20),
                                  child: Text('3 KM', style: TextStyle(color:Color(0xFFFEA422)),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}