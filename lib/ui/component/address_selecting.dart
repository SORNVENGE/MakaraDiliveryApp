import 'package:flutter/material.dart';

class AddressSelectingScreen extends StatefulWidget {
  @override
  _AddressSelectingScreenState createState() => _AddressSelectingScreenState();
}

class _AddressSelectingScreenState extends State<AddressSelectingScreen>
    with SingleTickerProviderStateMixin {
  List tapMenu = [
    {"title": "Please Choose"},
  ];
  int currentIndex = 0;
  bool statusShowButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFEA422),
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios)),
        title: Text("Selecting address", style: TextStyle(fontSize: 20)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.description),
            onPressed: () {},
          ),
        ],
      ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: tapMenu.length,
                      itemBuilder: (BuildContext context, index) {
                        var response = tapMenu[index];
                        return GestureDetector(
                          onTap: () {
                            var tempTapMenu = tapMenu;
                            tempTapMenu.removeRange(index+1, tempTapMenu.length);
                            print(tempTapMenu);
                            tempTapMenu.asMap().forEach((indexs, value) {
                              if (indexs == index) {
                                value['title'] = "Please Choose";
                              }
                            });
                            setState(() {
                              tapMenu = tempTapMenu;
                              currentIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 3),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: index == currentIndex
                                        ? Colors.red
                                        : Colors.white,
                                    width: 1),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: 85,
                            child: Text(
                              response['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontFamily: 'bold',
                                  fontSize: 15),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  currentIndex == 2
                    ? Container(
                      // padding: EdgeInsets.only(left: 18,right: 18,bottom: 8,top: 8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: Color(0xF3FAF6F5),
                        border:Border.all(color: Colors.orange, width: 0.7)),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("OK",style: TextStyle(color: Color(0xFFFEA422)),),
                        ),
                      )
                    : Container(child: null)
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: currentIndex == 0
                      ? Container(child: Text(currentIndex.toString()))
                      : currentIndex == 1
                          ? Container(child: Text(currentIndex.toString()))
                          : currentIndex == 2
                              ? Container(child: Text(currentIndex.toString()))
                              : Container(child: null),
                )),
            GestureDetector(
               onTap: () {
                      if (currentIndex <= 2) {
                        var tempTapMenu = tapMenu;
                        var data = {"title": "Please Choose"};
                        if (currentIndex != 2) tempTapMenu.add(data);
                        tempTapMenu.asMap().forEach((index, value) {
                          if (index == currentIndex) {
                            value['title'] = currentIndex == 0
                                ? "Phnom penh"
                                : currentIndex == 1
                                    ? "Russey keo"
                                    : "Kilomet lek 6";
                          }
                        });
                        setState(() {
                          setState(() {
                            currentIndex = currentIndex == 2
                                ? currentIndex
                                : currentIndex + 1;
                          });
                          tapMenu = tempTapMenu;
                        });
                      }
                    },

              child: Container(
                color: Colors.grey,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text("Add Tap")
                ),
              ),
            ),
          ],
        )));
  }
}
