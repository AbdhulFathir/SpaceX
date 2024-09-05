import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../dialog_box.dart';
import 'loginHome.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpFieldController otpController = OtpFieldController();

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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(17),
              child: InkResponse(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginHome(),));
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
                            Spacer(),
                            Center(
                              child: Text("Enter your 6 digit code to continue " , style:  TextStyle(
                                color: Colors.white ,
                              ),),
                            ),
                            Spacer(),
                            OTPTextField(
                                controller: otpController,
                                length: 6,
                                keyboardType: TextInputType.number,
                                width: MediaQuery.of(context).size.width,
                                textFieldAlignment: MainAxisAlignment.spaceAround,
                                fieldWidth: 45,
                                fieldStyle: FieldStyle.box,
                                otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.white10),
                                outlineBorderRadius: 15,
                                style: TextStyle(fontSize: 17, color: Colors.white, ),
                                onChanged: (pin) {
                                },
                                onCompleted: (pin) {
                                }),
                            Spacer(),
                            InkResponse(
                              onTap: () {

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