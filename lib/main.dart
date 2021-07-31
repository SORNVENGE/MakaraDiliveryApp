import 'package:bpa_express_app/splashScreen.dart';
import 'package:bpa_express_app/state/api_state.dart';
import 'package:bpa_express_app/state/booking_state.dart';
import 'package:bpa_express_app/state/footer_state.dart';
import 'package:bpa_express_app/ui/MainScreen.dart';
import 'package:bpa_express_app/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => FooterState()),
        ChangeNotifierProvider(create: (context) => BookingState()),
        ChangeNotifierProvider(create: (context) => ApiState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // home: MainScreen(),
      ),
    );
  }

}
