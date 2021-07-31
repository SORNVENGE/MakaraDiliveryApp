import 'package:bpa_express_app/state/api_state.dart';
import 'package:bpa_express_app/widgets/decoration_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MainScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController =
        TextEditingController(text: 'sorn');
    TextEditingController passwordController =
        TextEditingController(text: '123456');
    TextEditingController siteController = TextEditingController(text: '120033');
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/login_bg.jpeg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
            )),
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                          minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Form(
                            key: widget._formKey,
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Spacer(),
                                  Expanded(
                                      flex: 1, child: Container(child: null)),
                                  Expanded(
                                    flex: 9,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: usernameController,
                                          validator: (value) {
                                            if (value!.isEmpty)
                                              return 'Please enter your username';
                                            return null;
                                          },
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'IntroHeadB'),
                                          decoration: buildInputDecoration(
                                              Icons.perm_identity_outlined,
                                              "Username"),
                                        ),
                                        SizedBox(height: 20),
                                        TextFormField(
                                          controller: passwordController,
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'IntroHeadB'),
                                          obscureText: true,
                                          decoration: buildInputDecoration(
                                          Icons.lock_outline, "Password"),
                                          validator: (value) {
                                            if (value == null || value.isEmpty)
                                              return 'Please enter your password';
                                            // if (value.length < 6)
                                            //   return 'Password should not less than 6 charaters';
                                            // if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                                            //   return 'Please enter a strong password';
                                            // }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: siteController,
                                          validator: (value) {
                                            if (value!.isEmpty)
                                              return 'Please your Site number';
                                            return null;
                                          },
                                          keyboardType: TextInputType.phone,
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'IntroHeadB'),
                                          decoration: buildInputDecoration(
                                              Icons.place_outlined,
                                              "Site number"),
                                        ),
                                        SizedBox(height: 50),
                                        Container(
                                          child: GestureDetector(
                                            onTap: () {
                                              var state = Provider.of<ApiState>(
                                                  context,
                                                  listen: false);
                                              if (widget._formKey.currentState!
                                                  .validate()) {
                                                showLoading();
                                                state.login(
                                                    body: {
                                                      "email":
                                                          usernameController
                                                              .text,
                                                      "password":
                                                          passwordController
                                                              .text,
                                                      "code":
                                                          siteController.text
                                                    },
                                                    onSuccess: (response) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MainScreen()));
                                                    },
                                                    onError: (DioError error) {
                                                      var messageError = error
                                                              .response!
                                                              .data['data']
                                                          ['error'];
                                                      Navigator.of(context)
                                                          .pop();
                                                      displayErrorMessage(
                                                          context,
                                                          messageError);
                                                    });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: double.infinity,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFD3831B),
                                                border: Border.all(
                                                    color: Colors.white70
                                                        .withOpacity(0.1)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Login',
                                                    style: TextStyle(
                                                        color: Colors.white70,
                                                        fontFamily:
                                                            'IntroHeadB',
                                                        fontSize: 24.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 70),
                                        Align(
                                          alignment:
                                              FractionalOffset.bottomCenter,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  child: Text(
                                                    'KM',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  height: 20,
                                                  child: VerticalDivider(
                                                    color: Colors.white,
                                                    thickness: 1,
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  child: Text(
                                                    'EN',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  height: 20,
                                                  child: VerticalDivider(
                                                    color: Colors.white,
                                                    thickness: 1,
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  child: Text(
                                                    'CN',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer()
                                ]),
                          ),
                        ),
                      )));
            })));
  }


  void showLoading() async {
    return showDialog(
        context: context,
        builder: (_) => Center(
            // Aligns the container to center
            child: Container(
                // A simplified version of dialog.
                width: 100.0,
                height: 60.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.6)),
                child: Container(
                  margin:
                      EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
                  width: 30,
                  height: 30,
                  child: Theme(
                      data: ThemeData(
                          cupertinoOverrideTheme:
                              CupertinoThemeData(brightness: Brightness.dark)),
                      child: CupertinoActivityIndicator()),
                ))));
  }

  displayErrorMessage(BuildContext context, messageError) {
    AlertDialog alert = AlertDialog(
      contentPadding: EdgeInsets.all(5),
      content: Container(
          height: 180,
          child: Column(
            children: [
              Container(
                  height: 80,
                  child: Container(
                      child: Image.asset(
                    'assets/images/error.png',
                    height: 80,
                  ))),
              Expanded(
                  flex: 5,
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(messageError,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Gugi',
                              fontSize: 18,
                              fontWeight: FontWeight.bold)))),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 5, bottom: 5, top: 10),
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text("CANCEL",
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Gugi',
                              fontSize: 14)))),
            ],
          )),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
