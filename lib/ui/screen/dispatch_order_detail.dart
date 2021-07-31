import 'package:bpa_express_app/ui/screen/problem_dispatch.dart';
import 'package:flutter/material.dart';

class DispatchOrderDetail extends StatefulWidget {
  DispatchOrderDetail({Key? key}) : super(key: key);

  @override
  _DispatchOrderDetailState createState() => _DispatchOrderDetailState();
}

class _DispatchOrderDetailState extends State<DispatchOrderDetail> {
  List<dynamic>buttonList = ['Rejection', 'Problem', 'POD'];
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
          title: Text('Dispatch order detail ', style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'bold')),
        )
      ),
      body: Container(
        color: Color(0xEEF8F5F5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 9, 
              child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Text('85585555477678657', style: TextStyle(fontFamily: 'base', fontSize: 14),),
                            ),
                            Container(height: 30 , child: VerticalDivider(color:  Color(0xFFFEA422),thickness: 1.5,)),
                            GestureDetector(onTap: (){}, child: Text('Tracking', style: TextStyle(color: Color(0xFFFEA422),fontFamily: 'bold',),)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Booking NO.: VP0344400404907043234", style: TextStyle(fontSize:13, fontFamily: 'base',), ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Divider(thickness: 0.8,),
                           
                            Padding(padding: EdgeInsets.only(bottom: 5,top: 5),
                              child: Text("Receipiet: TEST B", style: TextStyle(fontSize:13, fontFamily: 'base',)),
                            ),
                            Divider(thickness: 0.8,),

                            Padding(padding: EdgeInsets.only(bottom: 5,top: 5),
                              child: Row(
                                children: [
                                  Text("Phone: ", style: TextStyle(fontSize:13, fontFamily: 'base',)),
                                  Text(" 0897667577", style: TextStyle(fontSize:13, color: Color(0xFFFEA422), fontFamily: 'base',)),
                                  Padding(padding: EdgeInsets.only(left: 10),
                                    child: Icon(Icons.call, color: Color(0xFFFEA422), size: 18,)
                                  )
                                ],
                              ),
                            ),
                            Divider(thickness: 0.8,),
                            Padding(padding: EdgeInsets.only(bottom: 5,top: 5),
                              child: Text("Post code: ", style: TextStyle(fontSize:13, fontFamily: 'base',)),
                            ),
                            Divider(thickness: 0.8,),
                            Padding(padding: EdgeInsets.only(bottom: 5,top: 5),
                              child: Text("Receipiet's Sub district: Boeung kansaend banlong N/A Ratanak Kiri", style: TextStyle(fontSize:13, fontFamily: 'base',)),
                            ),
                            Divider(thickness: 0.8,),
                            Padding(padding: EdgeInsets.only(bottom: 5,top: 5),
                              child: Text("Detail Address: 12 34", style: TextStyle(fontSize:13, fontFamily: 'base',)),
                            ),
                            Divider(thickness: 0.8,),
                            Padding(padding: EdgeInsets.only(bottom: 5,top: 5),
                              child: Text("Remark: ", style: TextStyle(fontSize:13, fontFamily: 'base',)),
                            ),
                            Divider(thickness: 0.8,),
                            Padding( padding: EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.near_me_outlined, color: Color(0xFFFEA422), size: 18,),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Text("333.1km", style: TextStyle(fontSize:13, color: Color(0xFFFEA422), fontFamily: 'bold',), )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),        
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:Color(0xFFFEA422),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('COD', style: TextStyle(fontFamily: 'bold',),)
                            ),
                            Column(
                              children: [
                                Text('Price',style: TextStyle(fontFamily: 'bold',)),
                                Text('0.00 \$',style: TextStyle(fontFamily: 'base',)),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buttonList.asMap().map((key, value){
                    return MapEntry(key,
                      TextButton(
                        onPressed: (){
                          if(key==1) Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProblemDispatch()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFFEA422),
                              width: 1.0,
                            ),
                            color: Color(0x48FEA222),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(value, style: TextStyle(color: Color(0xFFF5940C), fontWeight: FontWeight.w500, fontFamily: 'bold'),),
                        ),
                      ),
                    );
                  }).values.toList()
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}