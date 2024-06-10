import 'package:flutter/material.dart';
import 'package:spacex/features/SpaceX/presentation/pages/intro_pages/introScreen3.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('lib/assets/images/image2.jpg')),
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
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        const Center(
                          child: Text("History of launches",
                              style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold)),
                        ),
                        Spacer(),
                        const Text("SpaceX has historical number of \n"
                            "launches so far to explore th space \n"
                            "and to develop a network around \n"
                            "the world",
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
                                backgroundColor: Colors.black45,
                                radius: 25,
                                child: Text("Skip"),
                              ),
                            ),
                            InkResponse(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroScreen3(),));
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
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
