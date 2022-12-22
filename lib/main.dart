import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'features/SpaceX/presentation/pages/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';



  Future <void> main()  async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    DevicePreview(enabled: !kReleaseMode,
       builder: (context) => MyApp(), // Wrap your app
     );
     runApp(MyApp());
   }




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: Colors.blue,
         textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home:  SplashView(),
    );
  }
}

//LoginPage -- loginPage firebase
// LaunchHome


