import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../Launches_page/launchHome.dart';
import '../dialogBox.dart';
import 'loginPage.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpFieldController otpController = OtpFieldController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('lib/assets/images/image4.jpg') ,
                fit: BoxFit.fill)
        ),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(17),
                child: InkResponse(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
                     },
                   child: const CircleAvatar(
                     backgroundColor: Colors.transparent,
                     radius: 25,
                     child: Icon(
                       Icons.navigate_before,
                       color: Colors.white,
                                    ),
                                  ),
                                ),
              ),
              Container(
                height: 120,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(" Code verification",style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white,fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GlassmorphicContainer(
                        width: double.maxFinite,
                        height: 280,
                        borderRadius: 25,
                        blur: 20,
                        alignment: Alignment.bottomCenter,
                        border: 2,
                        linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.1),
                              const Color(0xFFFFFFFF).withOpacity(0.05),
                            ],
                            stops: const [
                              0.1,
                              1,
                            ]),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.5),
                            const Color((0xFFFFFFFF)).withOpacity(0.5),
                          ],
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children:    [
                              const Spacer(),
                              const Center(
                                child: Text("Enter your 6 digit code to continue " , style:  TextStyle(
                                  color: Colors.white ,
                                ),),
                              ),
                              const Spacer(),
                              OTPTextField(
                                  controller: otpController,
                                  length: 6,
                                  width: MediaQuery.of(context).size.width,
                                  textFieldAlignment: MainAxisAlignment.spaceAround,
                                  fieldWidth: 45,
                                  fieldStyle: FieldStyle.box,
                                  otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.white10),
                                  outlineBorderRadius: 15,
                                  style: const TextStyle(fontSize: 17, color: Colors.white, ),
                                  onChanged: (pin) {
                                    code= pin;
                                  },
                                  onCompleted: (pin) {
                                    code= pin;
                                  }),
                              const Spacer(),
                              InkResponse(
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const DialogBox(),));
                                onTap: () async {

                                  try{

                                    await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId:  LoginPage.verify, smsCode: code));
                                    // PhoneAuthCredential credential  = PhoneAuthProvider.credential(verificationId: LoginPage.verify, smsCode: code);
                                    // await auth.signInWithCredential(credential);
                                    showDialog(
                                      context: context,
                                      builder: (context) => Center(
                                        child: Container(
                                          child: AlertDialog(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            title: const Center(child:Text('Yeay! Welcome Back',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:'Gotham',
                                                  fontSize: 24.0),),),
                                            content: const Text('Once again you login successfully into visho app',
                                              style: TextStyle(
                                                  fontFamily:'Inter',
                                                  fontSize: 16.0),),
                                            actions: [
                                              Center(
                                                child: MaterialButton(
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10.0))),
                                                  height: 54.0,
                                                  minWidth: 288.0,
                                                  textColor: Colors.white,
                                                  color: Colors.black,
                                                  splashColor: Colors.blueGrey,
                                                  onPressed: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LaunchHome(),));
                                                  },
                                                  child: const Text('Go to Home',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily:'Gotham',
                                                        fontSize: 18.0),
                                                  ),
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
                                        title: const Text('Wrong OTP'),
                                        content: const Text("Pleace Enter The Correct OTP"),
                                        actions: [
                                          TextButton(
                                            child:const Text('OK'),
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius:BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  height: 50,
                                  child:  const Center(child: Text("Submit" ,
                                      style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.black) )),
                                ),
                              ),
                              Container(
                                decoration:  BoxDecoration(
                                  borderRadius:BorderRadius.circular(10),
                                  color: Colors.transparent,
                                ),
                                height: 50,
                                child:  const Center(child: Text("Resent" ,
                                    style: TextStyle(color: Colors.white) )),
                              ),

                            ],
                          ),
                        )),
                  ),

                  // BackdropFilter(
                  //   filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),


                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}


//  InkResponse(
//                               onTap: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroScreen3(),));
//                               },
//                               child: const CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 25,
//                                 child: Icon(
//                                   Icons.navigate_next,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),







// Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(left: 10),
//               child: Text(" Code verification",style: TextStyle(fontWeight: FontWeight.bold,
//                   color: Colors.white,fontSize: 20),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: GlassmorphicContainer(
//                   width: double.maxFinite,
//                   height: 280,
//                   borderRadius: 25,
//                   blur: 20,
//                   alignment: Alignment.bottomCenter,
//                   border: 2,
//                   linearGradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         const Color(0xFFffffff).withOpacity(0.1),
//                         const Color(0xFFFFFFFF).withOpacity(0.05),
//                       ],
//                       stops: const [
//                         0.1,
//                         1,
//                       ]),
//                   borderGradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       const Color(0xFFffffff).withOpacity(0.5),
//                       const Color((0xFFFFFFFF)).withOpacity(0.5),
//                     ],
//                   ),
//                   child: null),
//             ),
//
//             // BackdropFilter(
//             //   filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
//
//
//           ],
//         ),