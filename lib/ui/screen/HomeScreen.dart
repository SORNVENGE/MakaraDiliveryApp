import 'package:bpa_express_app/ui/component/header.dart';
import 'package:bpa_express_app/ui/screen/BookingScreen.dart';
import 'package:bpa_express_app/ui/screen/all_normal_pod.dart';
import 'package:bpa_express_app/ui/screen/arrived_scan.dart';
import 'package:bpa_express_app/ui/screen/dispatch_scan.dart';
import 'package:bpa_express_app/ui/screen/keep_in_warehouse.dart';
import 'package:bpa_express_app/ui/screen/pickup_list.dart';
import 'package:bpa_express_app/ui/screen/pickup_scan.dart';
import 'package:bpa_express_app/ui/screen/pod_scan.dart';
import 'package:bpa_express_app/ui/screen/send_scan.dart';
import 'package:bpa_express_app/ui/screen/spacial_sign.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> listItem = [
    {"title": "Booking", 'icon': Icons.file_upload_outlined, "color": 0xD382D0E7},
    {"title": "Waybill Print", 'icon': Icons.print_outlined, "color": 0xD33FBCE2},
    {"title": "PickUp", 'icon': Icons.save_alt_outlined, "color": 0xD353CA7B},
    {"title": "Send", 'icon': Icons.near_me_outlined, "color": 0xC458A4D6},
    {"title": "Arrived", 'icon': Icons.pin_drop_outlined, "color": 0xDCF58D3E},
    {"title": "Dispatch", 'icon': Icons.manage_accounts_outlined, "color": 0xD37C2647},
    {"title": "POD", 'icon': Icons.pending_actions_outlined, "color": 0xD7DB6E1B},
    {"title": "Specail Sign", 'icon': Icons.credit_score_outlined, "color": 0xDCB13D28},
    {"title": "Warehouse", 'icon': Icons.storefront_outlined, "color": 0xE3A785DD},
    // {"title": "Keep in warehouse", 'icon': Icons.storefront_outlined, "color": 0xE3A785DD},
  ];

  List<Map<String, dynamic>> listInfo = [
    {"title": "Tracking", 'icon': Icons.my_location_outlined},
    {"title": "Site Query", 'icon': Icons.store_outlined},
    {"title": "Statistic", 'icon': Icons.assessment_outlined},
    {"title": "Calculate", 'icon': Icons.calculate_outlined},
  ];

  
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    _handlePressEachButton( data, index ){
      if(index==0)Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookingScreen()));
      if(index==2)Navigator.of(context).push(MaterialPageRoute(builder: (context) => PickupScan()));
      if(index==3)Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendScan()));
      if(index==4)Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArrivedScan()));
      if(index==5)Navigator.of(context).push(MaterialPageRoute(builder: (context) => DispatchScan()));
      if(index==6)Navigator.of(context).push(MaterialPageRoute(builder: (context) => PodScan()));
      if(index==7)Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpecialSign()));
      if(index==8)Navigator.of(context).push(MaterialPageRoute(builder: (context) => KeepInWarehouse()));
      
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: HeaderApp(
          title: "Home",
        )
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 90,
                      color: Color(0xFFFFDEA2),
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fact_check_outlined,color: Color(0xCE757474)),
                            SizedBox(width: 5),
                            Text('Delivery List',style: TextStyle(fontSize: 16, color: Color(0xCE757474), fontFamily: 'bold'),
                            ),
                          ],
                        ),
                        onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => NormalPODList()));},
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 90,
                      color: Color(0xFFFFDEA2),
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.inventory_outlined, color: Color(0xCE757474)),
                            SizedBox( width: 5),
                            Text('Pickup List',style: TextStyle( fontSize: 16, color: Color(0xCE757474), fontFamily: 'bold')),
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PickupList()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      childAspectRatio: 0.7,
                      children: List.generate(listItem.length, (index) {
                        var data = listItem[index];
                        return TextButton(
                          onPressed: () {  _handlePressEachButton(data,index); },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(int.parse(data['color'].toString())),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                padding: EdgeInsets.all(15),
                                child: Icon(listItem[index]['icon'],color: Colors.white70, size: 35,),
                              ),
                              SizedBox(height: 10,),
                              // SizedBox(height: 5),
                              Text(data['title'].toString(),textAlign: TextAlign.center,style: TextStyle(color: Colors.black54, fontSize: 13, fontFamily: 'base'),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              )),
            ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   child: Text("Information"),
            // ),
            // Container(
            //   padding: EdgeInsets.only(left: 5,right: 5),
            //   height: 80,
            //     child: ListView.builder(
            //       physics: NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: listInfo.length,
            //       itemBuilder: (BuildContext context, index) {
            //         var data = listInfo[index];
            //         return Container(
            //           color: Color(0xFFFCEEA9).withOpacity(0.5),
            //           margin: EdgeInsets.only(right: 2),
            //           width: width/4.2,
            //           height: 100,
            //           child: TextButton(
            //             onPressed: (){
                          
            //             },
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Container(
            //                   child: Icon(data['icon'],size: 30,color: Color(0xFFE7A529),),
            //                 ),
            //                 SizedBox(height: 8,),
            //                 Text(data['title'],textAlign: TextAlign.center ,style: TextStyle(color: Colors.black54,fontSize: 12),)
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            // ),
            // SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
