import 'package:flutter/material.dart';

import 'introScreen2.dart';
import 'introScreen3.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('lib/assets/images/images1.jpg')),
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
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        const Center(
                          child: Text("Rockets and Capsules",
                              style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold )),
                        ),
                        Spacer(),
                        const Text("The journey of the reusable rocket \nand the innovativeness discoveries\n"
                            "results the falcon rockets and dragon\ncapsules" ,
                            style: TextStyle(color: Colors.grey)),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkResponse(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroScreen3(),));
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.black87,
                                radius: 25,
                                child: Text("Skip"),
                              ),
                            ),
                            InkResponse(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroScreen2(),));
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: Icon(Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                          ],
                        ),
                        Spacer()
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
