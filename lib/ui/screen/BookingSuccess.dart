import 'package:bpa_express_app/state/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingSuccessScreen extends StatefulWidget {

  @override
  _BookingSuccessScreenState createState() => _BookingSuccessScreenState();
}

class _BookingSuccessScreenState extends State<BookingSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BookingState>(builder: (context, state, child) {
      return Scaffold(
         appBar:AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xFFFEA422),
            centerTitle: false,
            leading: GestureDetector(
              onTap: () {Navigator.of(context).pop();},
              child: Icon(Icons.arrow_back_ios)
            ),
            title: Text("Shipped Successfully",style: TextStyle(fontSize: 20)),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.description),
                onPressed: (){},
              ),
            ],
          ),
          body: Container(
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      width: double.infinity,
                      child:Stack(
                        children: [
                          Container(
                            height: 130,
                            width: double.infinity,
                            color: Color(0xFFFEA422),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 25),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Icon(Icons.not_accessible,size: 80,color: Colors.white,)
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    child: Text("Shipped Successfully",style: TextStyle(fontSize: 20,color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 105,
                            left: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                               Text("Booking No : ",style: TextStyle(color: Colors.grey,fontSize: 16)),
                                               Text("T29348569495931",style: TextStyle(color: Colors.black,fontSize: 15))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: TextButton(onPressed: (){},
                                          child: Row(
                                            children: [
                                              Container(height: 20, child: VerticalDivider(color: Color(0xFFFEA422),thickness: 1.2)),
                                              Text("Print",style: TextStyle(color: Color(0xFFFEA422),fontSize: 20),),
                                            ],
                                          ),),
                                        )
                                      ],
                                    )
                                  ),
                                  Divider(color: Colors.grey,thickness: 0.2,),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Row(
                                      children: [
                                          Text("Waybill No : ",style: TextStyle(color: Colors.grey,fontSize: 16)),
                                          Text("8384715028404790",style: TextStyle(color: Colors.black,fontSize: 15))
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.grey,thickness: 0.2,),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text("Pick up ",style: TextStyle(color: Colors.grey,fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.grey,thickness: 0.2,),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text("Order Detail ",style: TextStyle(color: Colors.grey,fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.grey,thickness: 0.2,),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text("Continue booking order ",style: TextStyle(color: Colors.grey,fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFEA422),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFEB7E68)),
                      ),
                      child: Text(
                        'Done',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'regular'),
                      ),
                      onPressed: () {
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
         );
    });
  }

}

class InputFormField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isSecure;
  final onChange;
  final Function validate;
  final String value;
  final bool readOnly;
  final bool statusShowAllBorder;

  final String prefixText;
  final String suffixText;
  final suffixIcon;

  const InputFormField({
    Key? key,
    this.hint = '',
    this.label = '',
    this.value = '',
    this.prefixText = '',
    this.suffixText = '',
    this.readOnly = false,
    this.isSecure = false,
    this.statusShowAllBorder=false,
    this.onChange,
    this.suffixIcon,
    required this.validate,
  }) : super(key: key);

  @override
  _InputFormFieldState createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  double height = 55;
  double bottom = 20;
  double box = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: TextFormField(
        initialValue: widget.value,
        validator: (value) {
          var valid = widget.validate(value);
          if (valid != null) {
            setState(() {
              height = 120.0;
              bottom = 10.0;
              box = 70.0;
            });
          }
          return valid;
        },
        onChanged: widget.onChange,
        obscureText: widget.isSecure,
        cursorColor: Color(0xFFFEA422),
        style: TextStyle(color: Colors.grey, fontSize: 17, fontFamily: 'Gugi'),
        decoration: InputDecoration(
          prefixIcon: Container(
              padding: EdgeInsets.only(top: 3, left: 10, right: 5),
              child: Text(widget.prefixText)),
          suffixText: widget.suffixText,
          suffixIcon: Container(
            padding: EdgeInsets.only(top: 3),
            child: Icon(
              widget.suffixIcon,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
              maxHeight: 20, minHeight: 20, maxWidth: 150, minWidth: 10),
          suffixIconConstraints: BoxConstraints(
              maxHeight: 30, minHeight: 25, maxWidth: 30, minWidth: 10),
          suffixStyle: TextStyle(color: Colors.grey),
          hintText: widget.hint,
          hintStyle:TextStyle(color: Colors.grey.withOpacity(0.4), fontSize: 15),
          contentPadding: EdgeInsets.only(left: 10, top: 6),
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
          // enabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.grey, width:widget.statusShowAllBorder?1 : 0.3),
          // ),
          enabledBorder: widget.statusShowAllBorder? OutlineInputBorder(borderSide:BorderSide(color: Colors.grey, width: 0.6)):UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.3),),
          focusedBorder: widget.statusShowAllBorder?OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)):UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0.6)),
           

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 1, color: Colors.redAccent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 1, color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
