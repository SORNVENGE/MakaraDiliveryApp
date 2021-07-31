import 'package:bpa_express_app/state/booking_state.dart';
import 'package:bpa_express_app/ui/component/address_selecting.dart';
import 'package:bpa_express_app/ui/screen/BookingSuccess.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isCOD = false;
  bool isNoneCOD = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<BookingState>(builder: (context, state, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFFEA422),
            centerTitle: false,
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios)),
            title: Text("Booking", style: TextStyle(fontSize: 20)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.description),
                onPressed: () {},
              ),
            ],
          ),
          body: Container(
            color: Colors.grey.withOpacity(0.2),
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 15),
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: widget._formKey,
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(

                          padding: EdgeInsets.only(top: 10),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: InputFormField(
                                  prefixText: "Sender phone",
                                  value: state.senderPhone,
                                  onChange: (value) {
                                    state.changeSenderPhone(value);
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Please put sender phone";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                child: InputFormField(
                                  prefixText: "Sender name",
                                  value: "",
                                  onChange: (value) {
                                    state.changeSenderName(value);
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Please put sender name ";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressSelectingScreen()));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 20,top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Row(
                                          children: [
                                            Text("Sender address  ",style: TextStyle(fontSize: 15, fontFamily: 'base'),),
                                            Expanded(child: Text("Kompong Cham Srey Santhor",softWrap: true,style: TextStyle(fontSize: 12, fontFamily: 'bold'),)),
                                          ],
                                        ),
                                      ),
                                      Expanded(flex: 2,child: Icon(Icons.navigate_next,color: Colors.grey,)),
                                    ],
                                  ),
                                ),
                              ),
                              Container(padding: EdgeInsets.only(left: 10,right: 10,top: 10),child: Divider(thickness: 0.4,color: Colors.red,)),
                              Container(
                                padding: EdgeInsets.only(left: 20,bottom: 15),
                                child: Text("Please select your address",style: TextStyle(color: Colors.red,fontSize: 13, fontFamily: 'base')),
                              ),

                              Container(
                                child: InputFormField(
                                  prefixText: "Sender detail address",
                                  value: "",
                                  onChange: (value) {
                                    state.changeSenderDetailAddress(value);
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Please put detail address";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                child: InputFormField(
                                  prefixText: "Recipient phone",
                                  value: "",
                                  onChange: (value) {
                                    state.changeReceiverPhone(value);
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Please put recipient phone";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                child: InputFormField(
                                  prefixText: "Recipient name",
                                  value: "",
                                  onChange: (value) {
                                    state.changeReceiverName(value);
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Please put recipient name ";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                child: InputFormField(
                                  readOnly: true,
                                  prefixText: "Recipient address",
                                  suffixIcon: Icons.navigate_next,
                                  value: "",
                                  onChange: (value) {
                                    state.changeReceiverAddress(value);
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Please put sender address";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                child: InputFormField(
                                  prefixText: "Receiver detail address",
                                  value: "",
                                  onChange: (value) {
                                    state.changeReceiverDetailAddress(value);
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Please put address";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          color: Colors.white,
                          child: Container(
                            child: InputFormField(
                              prefixText: "Weight *  ",
                              suffixText: "KG",
                              value: "",
                              hint: "0-50.0*",
                              onChange: (value) {
                                state.changeWeight(value);
                              },
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "Please put the weight ";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: Container(
                            child: InputFormField(
                              prefixText: "Insured Amount *  ",
                              suffixText: "\$",
                              value: "",
                              hint: "0-50.0*",
                              onChange: (value) {
                                state.changeInsuredAmount(value);
                              },
                              validate: (value) {
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isCOD = !isCOD;
                                                isNoneCOD = false;
                                              });
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(2.0),
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.7,
                                                        color:
                                                            Color(0xFFFEA422)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                child: isCOD
                                                    ? Icon(Icons.check,
                                                        color: Colors.black)
                                                    : Container(child: null)),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            child: Text(
                                              "Pay COD",
                                              style: TextStyle(
                                                fontFamily: 'bold',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isNoneCOD = !isNoneCOD;
                                                isCOD = false;
                                              });
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(2.0),
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.7,
                                                        color:
                                                            Color(0xFFFEA422)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                child: isNoneCOD
                                                    ? Icon(Icons.check,
                                                        color: Colors.black)
                                                    : Container(child: null)),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            child: Text("NONE COD",
                                                style: TextStyle(
                                                  fontFamily: 'bold',
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              isCOD
                                  ? Column(
                                      children: [
                                        Container(
                                          child: InputFormField(
                                            prefixText: "COD Amount *  ",
                                            suffixText: "\$",
                                            value: state.codAmount,
                                            hint: "0-1000*",
                                            onChange: (value) {
                                              state.changeCodAmount(value);
                                            },
                                            validate: (value) {
                                              if (value.isEmpty) {
                                                return "Please put the COD Amount ";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        state.codAmount != ""
                                            ? Container(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      color: Colors.white,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10),
                                                        child: InputFormField(
                                                          readOnly: true,
                                                          statusShowAllBorder:
                                                              true,
                                                          prefixText: "Bank * ",
                                                          suffixIcon: Icons
                                                              .navigate_next,
                                                          value: state.bank,
                                                          onChange: (value) {
                                                            state.changeBank(
                                                                value);
                                                          },
                                                          validate: (value) {
                                                            // if (value.isEmpty) {
                                                            //   return "Please choose bacnk  ";
                                                            // }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      color: Colors.white,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10),
                                                        child: InputFormField(
                                                          statusShowAllBorder:
                                                              true,
                                                          prefixText:
                                                              "Account holder * ",
                                                          value: state
                                                              .accountHolder,
                                                          onChange: (value) {
                                                            state
                                                                .changeAccountHolder(
                                                                    value);
                                                          },
                                                          validate: (value) {
                                                            // if (value.isEmpty) {
                                                            //   return "Please put account holder ";
                                                            // }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      color: Colors.white,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10),
                                                        child: InputFormField(
                                                          statusShowAllBorder:
                                                              true,
                                                          prefixText:
                                                              "Bank card number * ",
                                                          value: state
                                                              .bankCardNumber,
                                                          onChange: (value) {
                                                            state
                                                                .changeBankCardNumber(
                                                                    value);
                                                          },
                                                          validate: (value) {
                                                            // if (value.isEmpty) {
                                                            //   return "Please put the bacnk card number  ";
                                                            // }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(child: null),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: Container(
                            child: InputFormField(
                              prefixText: "Item Detail  ",
                              value: state.itemDetail,
                              hint: "optional",
                              onChange: (value) {
                                state.changeItemDetail(value);
                              },
                              validate: (value) {
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 20, left: 10),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Estimated total price:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'bold',
                                      fontSize: 17),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFEA422),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Actual cost is subject to courier check",
                                    style: TextStyle(
                                        fontFamily: 'bold',
                                        color: Colors.white,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  " \$ 0.00",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'bold',
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  "Charge Details:",
                                  style: TextStyle(
                                      fontFamily: 'bold',
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Basic Cost: ",
                                      style: TextStyle(
                                          fontFamily: 'base',
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "0.00",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                        'Submit Orders',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'bold'),
                      ),
                      onPressed: () {
                        handleOnSubbmitOrder();
                      },
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }

  handleOnSubbmitOrder() {
    var state = Provider.of<BookingState>(context, listen: false);
    if (widget._formKey.currentState!.validate()) {
      var data = [
        {
          "senderPhone": state.senderPhone,
          "senderName": state.senderName,
          "senderAddress": state.senderAddress,
          "senderDetailAddress": state.senderDetailAddress,
          "receiverPhone": state.receiverPhone,
          "receiverName": state.receiverName,
          "receiverAddress": state.receiverAddress,
          "receiverDetailAddress": state.receiverDetailAddress,
          "weight": state.weight,
          "insuredAmount": state.insuredAmount,
          "codAmount": state.codAmount,
          "bank": state.bank,
          "accountHolder": state.accountHolder,
          "bankAccount": state.bankCardNumber,
          "itemDetail": state.itemDetail,
          "estimatedTotalPrice": state.estimatedTotalPrice
        },
        {"basicCost": state.basicCost}
      ];
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => BookingSuccessScreen()));
    }
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
    this.statusShowAllBorder = false,
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
        readOnly: widget.readOnly,
        onChanged: widget.onChange,
        obscureText: widget.isSecure,
        cursorColor: Color(0xFFFEA422),
        style: TextStyle(color: Colors.grey, fontSize: 17, fontFamily: 'base'),
        decoration: InputDecoration(
          prefixIcon: Container(
              padding: EdgeInsets.only(top: 3, left: 10, right: 5),
              child: Text(widget.prefixText,
                  style: TextStyle(color: Colors.black, fontFamily: 'base'))),
          suffixText: widget.suffixText,
          suffixIcon: Container(
            padding: EdgeInsets.only(top: 3),
            child: Icon(
              widget.suffixIcon,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
              maxHeight: 20, minHeight: 20, maxWidth: 150, minWidth: 10),
          suffixIconConstraints: BoxConstraints(
              maxHeight: 30, minHeight: 25, maxWidth: 30, minWidth: 10),
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 15,
              fontFamily: 'base'),
          contentPadding: EdgeInsets.only(left: 10, top: 6),
          filled: true,
          fillColor: Colors.white,
          labelStyle:
              TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'base'),
          enabledBorder: widget.statusShowAllBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.6))
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3),
                ),
          focusedBorder: widget.statusShowAllBorder
              ? OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.6)),
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
