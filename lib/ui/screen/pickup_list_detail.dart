import 'package:flutter/material.dart';

class PickupListDetail extends StatefulWidget {
  PickupListDetail({Key? key}) : super(key: key);

  @override
  _PickupListDetailState createState() => _PickupListDetailState();
}

class _PickupListDetailState extends State<PickupListDetail> {
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
          title: Text('Order Detail', style: TextStyle(color: Colors.white, fontSize: 15),),
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
        // padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    Card (
                      color: Colors.grey[100],
                      child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 15, top: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(flex: 8,child: Text("Booking NO.: 85585500404907043234", style: TextStyle(fontSize:13), )),
                                Container(height: 30 , child: VerticalDivider(color:  Color(0xFFFEA422),thickness: 1.5,)),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    child: Center(child: Text('Print', style: TextStyle(color: Color(0xFFFEA422)),)),
                                  )
                                ),
                              ],
                            ),
                            Divider(thickness: 0.8,),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0, bottom: 5),
                              child: Text('Booking time: 19-1015:30'),
                            ),
                            Divider(thickness: 0.8,),
                             Row(
                              children: [
                                Expanded(flex: 8,child: Text("Appointment time: ", style: TextStyle(fontSize:13), )),
                                Container(height: 30 , child: VerticalDivider(thickness: 1.5,color: Color(0xFFFEA422))),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    child: Center(child: Text('Delay pi...', style: TextStyle(color: Color(0xFFFEA422)),)),
                                  )
                                ),

                              ],
                            ),
                            Divider(thickness: 0.8,),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("Don't forget to change individule order!",  style: TextStyle(color: Color(0xFFFEA422))),
                            ),
                            Divider(thickness: 0.8,),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("Waybill NO:.:855678765567",  style: TextStyle()),
                            ),
                            Divider(thickness: 0.8,),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("Type: Normal Order",  style: TextStyle()),
                            ),
                            Divider(thickness: 0.8,),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Weight:",  style: TextStyle()),
                                  Text("1.00",  style: TextStyle(color: Color(0xFFFEA422))),
                                  Text("Kg",  style: TextStyle()),
                                ],
                              ),
                            ),
                            Divider(thickness: 0.8,),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("Estimated total price:  \$ 1.00",  style: TextStyle(fontWeight: FontWeight.w700)),
                            ),
                            Divider(thickness: 0.8,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Charge Details:",),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50, top: 8),
                                    child: Text('Basic cost:  1.00', style: TextStyle(color: Colors.grey),),
                                  )
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Card (
                        color: Colors.grey[100],
                        child: Container(
                          padding: EdgeInsets.only(left: 10, bottom: 15, top: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Sender: Test A" ),
                              Divider(thickness: 0.8,),
                              Padding(
                                padding: const EdgeInsets.only(top:5.0, bottom: 5),
                                child: Row(
                                  children: [
                                    Text("Sender's phone number: "),
                                    Text("  +855 1234565667", style: TextStyle(color: Color(0xFFFEA422)),),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(Icons.phone_enabled_outlined, color: Color(0xFFFEA422), size: 18,),
                                    )
                                  ],
                                ),
                              ),
                              Text("Sender's Sub-District: Boeung kansaend, banlong, Ratanakiri", ),
                              Padding(
                                padding: const EdgeInsets.only(top:5, bottom: 8),
                                child: Text("Detail Address: Test A", ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:5, bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.near_me_outlined, color: Color(0xFFFEA422), size: 25,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("332.9kM", style: TextStyle(color: Color(0xFFFEA422), fontWeight: FontWeight.w500),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Card (
                        color: Colors.grey[100],
                        child: Container(
                          padding: EdgeInsets.only(left: 10, bottom: 15, top: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Receipt: Test B", ),
                              Divider(thickness: 0.8,),
                              Padding(
                                padding: const EdgeInsets.only(top:5.0, bottom: 5),
                                child: Row(
                                  children: [
                                    Text("Phone: "),
                                    Text("  +855 1234565667", style: TextStyle(color: Color(0xFFFEA422)),),
                                  ],
                                ),
                              ),
                              Text("Sender's Sub-District: Boeung kansaend, banlong, Ratanakiri", ),
                              Padding(
                                padding: const EdgeInsets.only(top:5, bottom: 8),
                                child: Text("Detail Address: Test B", ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: GestureDetector(
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                // color: Color(0xADFEA222),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFFEA422),
                                    // style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Color(0x48FEA222),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text('Pickup faild...', style: TextStyle(color: Color(0xFFF5940C), fontWeight: FontWeight.w500),),
                              ),
                            ), 
                          ),

                          Expanded(
                            flex: 4,
                            child: GestureDetector(
                              child: Container(
                                height: 40,
                                margin: EdgeInsets.only(left: 10),
                                alignment: Alignment.center,
                                // color: Color(0xADFEA222),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFFEA422),
                                    // style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Color(0x48FEA222),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text('Re-assign', style: TextStyle(color: Color(0xFFF5940C), fontWeight: FontWeight.w500),),
                              ),
                            ), 
                          ),
                          Expanded(flex: 2, child: Container(),)
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          // color: Color(0xADFEA222),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFFEA422),
                              // style: BorderStyle.solid,
                              width: 1.0,
                            ),
                            color: Color(0xFFFEA422),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('Pick up', style: TextStyle(color: Color(0xFFF3F2F1), fontWeight: FontWeight.w500),),
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