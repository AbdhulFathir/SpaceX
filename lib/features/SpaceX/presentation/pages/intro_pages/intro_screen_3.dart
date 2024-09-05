import 'package:flutter/material.dart';
import '../loginPage/login_page.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('lib/assets/images/image3.jpg')),
        ),
        child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 30, left: 30, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Mission to future ",
                            style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold )),
                        const Text("it's not just  the space fly to the moon, fly to the mars Beyond that, start journey for the space explorations",
                            style: TextStyle(color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: InkResponse(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                              ),
                              height: 50,
                              child: const Center(child:  Text("Get Started",
                                style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
