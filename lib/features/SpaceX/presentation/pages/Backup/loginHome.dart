import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:spacex/features/SpaceX/presentation/pages/Backup/otp.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  // late String _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/image4.jpg'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                " Log In ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "One step to Go!",
                        style: TextStyle(
                          color: Colors.white),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white10, Colors.white10])),
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter mobile number',
                            ),
                          ),
                        ),
                      ),
                      InkResponse(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const OtpPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: 50,
                          child: const Center(
                              child: Text("Continue",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.white30                    ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white10, Colors.white10])),
                        height: 50,
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 20),
                              child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Image(
                                      image: AssetImage(
                                          'lib/assets/images/GoogleLogo.png')),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Continue with Google",
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
