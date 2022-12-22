import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spacex/features/SpaceX/presentation/pages/loginPage/otpPage.dart';

import '../Launches_page/launchHome.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
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
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('lib/assets/images/image4.jpg') ,
          fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 110),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(" Log In ",style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white,fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GlassmorphicContainer(
                    width: double.maxFinite,
                    height: 350,
                    borderRadius: 25,
                    blur: 20,
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
                    child: Padding(
                      padding:EdgeInsets.all(20),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Spacer(),
                          const Text("  One step to Go!!!" , style:  TextStyle(
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
                                  phone = value;
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter mobile number',
                                ),
                                keyboardType: TextInputType.number,

                              ),
                            ),
                          ),
                          const Spacer(),
                          InkResponse(
                            onTap: () async {
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpPage(),));
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: '+$phone',
                                verificationCompleted: (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {
                                  if (e.code == 'invalid-phone-number') {
                                    print('The provided phone number is not valid.');
                                  }
                                  // Handle other errors
                                },
                                codeSent: (String verificationId, int? resendToken) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const OtpPage()),
                                  );//action
                                  LoginPage.verify =verificationId;
                                },
                                timeout: const Duration(seconds: 60),
                                codeAutoRetrievalTimeout: (String verificationId) {},
                              );

                            },
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
                            },
                            child: Container(
                              width: double.maxFinite,
                              decoration:  BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                gradient:  const LinearGradient(colors:[Colors.white10 ,Colors.white10])
                              ),
                              height: 50,
                              child:  Center(child:Padding(
                                padding: const EdgeInsets.only(left: 10 ,right: 20),
                                child: Row(
                                  children: const [
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
                      ),
                    ),
                ),
              ),

                // BackdropFilter(
                //   filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),


            ],
          ),
        ),
      ),
    );
  }
}

