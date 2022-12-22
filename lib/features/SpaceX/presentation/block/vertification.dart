import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'home.dart';



class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            child:  Stack(alignment: Alignment.center, children: <Widget>[
              Image.asset('D:/DOC_FA/lib/assets/login 2.png',
                height:  MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,),
              Padding(
                padding: EdgeInsets.only(top: 215,),
                child: Align(
                  alignment: Alignment(0.0, 0.3),
                  child:Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(bottom: 10,),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Code verification',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily:'Poppins',
                                color: Color(0xffFFFFFF),
                                fontSize: 24
                            ),
                          ),
                        ),),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          border: Border.all(
                            color: Colors.grey ,
                            width: 0.6 ,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 358,
                        height: 283,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30,left: 10),
                              child: Container(
                                height: 30,
                                child: Text(
                                  'Enter your 6 digit code to continue',
                                  style: TextStyle(
                                      fontFamily:'Poppins',
                                      color: Color(0xffFFFFFF),
                                      fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15),
                              child: OTPTextField(
                                length: 6,
                                width: MediaQuery.of(context).size.width,
                                fieldWidth: 50,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                                textFieldAlignment: MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.box,
                                otpFieldStyle: OtpFieldStyle(
                                  focusBorderColor: Colors.orange, //(here)
                                  backgroundColor: Colors.grey,
                                ),
                                onChanged: (value) {
                                  code= value;//handle validation or checks here if necessary
                                },
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: InkResponse(
                                  // height: 60,
                                  // minWidth: 290,
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily:'Gotham',
                                        fontSize: 16.0),),
                                  // color: Color(0xffFFFFFF),
                                  // textColor: Color(0xff231F20),
                                  onTap: () async {
                                    try{
                                      // Create a PhoneAuthCredential with the code
                                      var _credential = PhoneAuthProvider.credential(verificationId: Login.verify, smsCode: code);

                                      // Sign the user in (or link) with the credential
                                      await auth.signInWithCredential(_credential);
                                      showDialog(
                                        context: context,
                                        builder: (context) => Center(
                                          child: Container(
                                            child: AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(10.0))),
                                              title: Center(child:Text('Yeay! Welcome Back',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:'Gotham',
                                                    fontSize: 24.0),),),
                                              content: Text('Once again you login successfully into visho app',
                                                style: TextStyle(
                                                    fontFamily:'Inter',
                                                    fontSize: 16.0),),
                                              actions: [
                                                Center(
                                                  child: MaterialButton(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(10.0))),
                                                    height: 54.0,
                                                    minWidth: 288.0,
                                                    textColor: Colors.white,
                                                    color: Colors.black,
                                                    child: Text('Go to Home',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily:'Gotham',
                                                          fontSize: 18.0),
                                                    ),
                                                    splashColor: Colors.blueGrey,
                                                    onPressed: () {
                                                      print('Hello');
                                                    },
                                                  ),
                                                ),
                                              ],
                                              titlePadding: const EdgeInsets.only(top: 50, bottom: 20),
                                              actionsPadding: const EdgeInsets.only(top: 50,bottom: 20),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    catch(e){
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Wrong OTP'),
                                          content: Text("Pleace Enter The Correct OTP"),
                                          actions: [
                                            TextButton(
                                              child:Text('OK'),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Center(
                                child: TextButton(onPressed: () async {
                                },
                                  child: Text('Resent',
                                    style: TextStyle(
                                        fontFamily:'Poppins',
                                        color: Color(0xffFFFFFF),
                                        fontSize: 16
                                    ),),),),

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            ),
            ),
        );
}
}