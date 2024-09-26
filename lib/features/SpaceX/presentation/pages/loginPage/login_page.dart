import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spacex/features/SpaceX/presentation/pages/loginPage/glass_container.dart';
import 'package:spacex/features/SpaceX/presentation/pages/loginPage/otpPage.dart';
import '../Launches_page/launch_home.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String verify ="";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static var phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('lib/assets/images/image4.jpg') ,
          fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(" Log In ",style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.white,fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GlassContainer(widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Spacer(),
                  const Text("  One step to Go!" , style:  TextStyle(
                    color: Colors.white ,
                  ),),
                  const Spacer(),
                  Container(
                    decoration:  BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        gradient:  const LinearGradient(colors:[Colors.white10 ,Colors.white10])
                    ),
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        onChanged: (value){
                          phone = "+94$value";
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter mobile number',
                          hintStyle: TextStyle(
                            color: Colors.white24
                          )
                        ),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),

                      ),
                    ),
                  ),
                  const Spacer(),
                  InkResponse(
                    // onTap: () async {
                    //   if (kDebugMode) {
                    //     print(phone);
                    //   }
                    //   //Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpPage(),));
                    //   await FirebaseAuth.instance.verifyPhoneNumber(
                    //     phoneNumber: '+94$phone',
                    //     verificationCompleted: (PhoneAuthCredential credential) {},
                    //     verificationFailed: (FirebaseAuthException e) {
                    //       if (e.code == 'invalid-phone-number') {
                    //         if (kDebugMode) {
                    //           print('The provided phone number is not valid.');
                    //         }
                    //       }
                    //       // Handle other errors
                    //     },
                    //     codeSent: (String verificationId, int? resendToken) {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => const OtpPage()),
                    //       );//action
                    //       LoginPage.verify =verificationId;
                    //     },
                    //     timeout: const Duration(seconds: 60),
                    //     codeAutoRetrievalTimeout: (String verificationId) {},
                    //   );
                    //
                    // },
                    onTap: () async {
                      FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: phone,
                          verificationCompleted: (PhoneAuthCredential credential) {

                          },
                          verificationFailed: (FirebaseAuthException e) {
                            // Handle verification failure
                            print('Verification failed: ${e.message}');
                          },
                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OtpPage()),
                          ); //action
                          LoginPage.verify = verificationId;
                        },
                        timeout: const Duration(seconds: 60),
                        codeAutoRetrievalTimeout: (String verificationId) {
                      // Auto-retrieval timeout
                      print('Verification ID: $verificationId');
                      },
                      );                    },
                    child: Container(
                      decoration:  BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: 50,
                      child:  const Center(child: Text("Continue" ,
                          style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.black) )),
                    ),
                  ),
                  const Spacer(),
                  const Center(
                    child: Text("OR" , style:  TextStyle(
                      color: Colors.white30 ,
                    ),),
                  ),
                  const Spacer(),
                  InkResponse(
                    onTap: ()  async {
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
                          child: AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(
                                    Radius.circular(10.0))),
                            title: const Center(child:Text('Yeah! Welcome Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily:'Gotham',
                                  fontSize: 24.0),),),
                            content: const Text('Once again you login successfully into SpaceX app',
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
                      );
                    },

                    child: Container(
                      width: double.maxFinite,
                      decoration:  BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          gradient:  const LinearGradient(colors:[Colors.white10 ,Colors.white10])
                      ),
                      height: 50,
                      child:  const Center(child:Padding(
                        padding:  EdgeInsets.only(left: 10 ,right: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                height: 25,
                                width: 25,
                                child: Image(image: AssetImage('lib/assets/images/GoogleLogo.png')),
                              ),
                            ),
                            Spacer(),
                            Text("Continue with Google" ,
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                          ],
                        ),
                      )),
                    ),
                  ),
                  const Spacer(),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

