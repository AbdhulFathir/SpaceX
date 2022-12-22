import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spacex/features/SpaceX/presentation/block/vertification.dart';


class Login extends StatefulWidget {
  static String verify ="";

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static var phone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            child: Stack(alignment: Alignment.center, children: <Widget>[
              Image.asset('lib/assets/images/image4.jpg',
                height:  MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,),
              const Padding(
                padding: EdgeInsets.only(top: 215,left: 22),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily:'Poppins',
                        color: Color(0xffFFFFFF),
                        fontSize: 24
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.0, 0.6),
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey ,
                      width: 0.6 ,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 358,
                  height: 364,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30,left: 10),
                        child: Container(
                          height: 30,
                          child: const Text(
                            'One Step to Go',
                            style: TextStyle(
                                fontFamily:'Poppins',
                                color: Color(0xffFFFFFF),
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:15,left: 10),
                        child: Container(
                          height: 55,
                          width: 330,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            onChanged: (value){
                              phone = value;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              hintText: 'Enter mobile number',
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  color: Colors.grey),
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          // child: FlatButton(
                          //   height: 60,
                          //   minWidth: 290,
                          //   child: const Text(
                          //     'Continue',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         fontFamily:'Gotham',
                          //         fontSize: 16.0),),
                          //   color: Color(0xffFFFFFF),
                          //   textColor: Color(0xff231F20),
                          //   onPressed: () async {
                          //     await FirebaseAuth.instance.verifyPhoneNumber(
                          //       phoneNumber: '${'+'+phone}',
                          //       verificationCompleted: (PhoneAuthCredential credential) {},
                          //       verificationFailed: (FirebaseAuthException e) {
                          //         if (e.code == 'invalid-phone-number') {
                          //           print('The provided phone number is not valid.');
                          //         }
                          //         // Handle other errors
                          //       },
                          //       codeSent: (String verificationId, int? resendToken) {
                          //         Login.verify =verificationId;
                          //       },
                          //       timeout: const Duration(seconds: 60),
                          //       codeAutoRetrievalTimeout: (String verificationId) {},
                          //     );
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => const Verification()),
                          //     );//action
                          //   },
                          // ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8),
                        child:Container(
                          alignment: Alignment.bottomCenter,
                          child:Text(
                            'OR',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontFamily:'Gotham',
                                fontSize: 16.0),),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left:34,top: 12),
                        child: Container(
                          width: 293,
                          child: InkWell(
                            // height: 60,
                            // color: Colors.grey.withOpacity(0.2),
                            // textColor: Colors.grey,
                            onTap: () async {
                              // Trigger the authentication flow
                              final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

                              // Obtain the auth details from the request
                              final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

                              // Create a new credential
                              final credential = GoogleAuthProvider.credential(
                                accessToken: googleAuth?.accessToken,
                                idToken: googleAuth?.idToken,
                              );
                              // Once signed in, return the UserCredential
                              await FirebaseAuth.instance.signInWithCredential(credential);

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
                            },
                            child: Row(
                              children: [
                                Image.asset('D:/DOC_FA/lib/assets/Google.png',height: 25.0,),
                                Text(
                                  '        Continue with Google',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:'Gotham',
                                      fontSize: 16.0),),
                              ],
                            ),
                          ),
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