import 'package:bpa_express_app/state/footer_state.dart';
import 'package:bpa_express_app/ui/screen/AccountScreen.dart';
import 'package:bpa_express_app/ui/screen/HomeScreen.dart';
import 'package:bpa_express_app/ui/screen/ReCordScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FooterState>(builder: (context, state, child) {
      return Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: IndexedStack(
                  index: state.menuIndex,
                  children: [
                    HomeScreen(),
                    ReCordScreen(),
                    AccountScreen(),
                  ],
                ),
              ),
              Container(
                height: 85,
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ["Home","Records","Me",].asMap()
                  .map((index, value){
                      return MapEntry(index,
                      GestureDetector(
                        onTap: () {
                          state.changeMenuIndex(index);
                        },
                        child: AnimatedContainer(
                          duration: kThemeAnimationDuration,
                          child: Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            padding: EdgeInsets.symmetric(vertical: 7,horizontal: index == 1 ? 5 : 10),
                            child: Column(
                              children: [
                                Icon(index == 0? Icons.home_rounded: index == 1? Icons.description: Icons.person,color: Color(0xFFE2AB53),size: state.menuIndex==index?33:30),
                                // SizedBox(height: 5,),
                                AnimatedDefaultTextStyle(
                                  duration: kThemeAnimationDuration,
                                  child: Text(value,style: TextStyle(fontSize: 12.0,fontFamily: 'bold',color: state.menuIndex==index?Color(0xFFE2AB53):Color(0xFF1A1714))),
                                  style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontFamily: 'bold',fontSize: state.menuIndex == index? 12.0: 0.0)
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
                    }).values.toList()
                )
                )
            ],
          ),
        ),
      );
    });
  }
}
