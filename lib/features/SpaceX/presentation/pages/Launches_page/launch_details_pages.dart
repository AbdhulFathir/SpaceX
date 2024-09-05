import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Launch_ui_data.dart';

class UserDetail extends StatelessWidget {
  final LaunchData data;
  final _controller = PageController();

   UserDetail(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                ),
                child: PageView(
                  controller: _controller,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration:  const BoxDecoration(
                        // color: Colors.red,
                         image: DecorationImage(image: AssetImage('lib/assets/images/image3.jpg'),fit: BoxFit.cover ),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(17),
                            child: InkResponse(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) =>));
                                Navigator.pop(context);
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
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: SmoothPageIndicator(
                                controller: _controller,
                                count: 3,
                                effect: const WormEffect(dotColor: Colors.white70,
                                    activeDotColor: Colors.white,
                                    dotHeight: 5,
                                    dotWidth: 5),
                                onDotClicked: (index) =>
                                    _controller.animateToPage(index,
                                        duration:
                                        const Duration(milliseconds: 300),
                                        curve: Curves.bounceOut),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration:  const BoxDecoration(
                        // color: Colors.pink,
                        image: DecorationImage(image: AssetImage('lib/assets/images/image2.jpg') ,fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(17),
                            child: InkResponse(
                              onTap: () {
                                Navigator.pop(context);
                                // Navigator.push(context, MaterialPageRoute(builder: (context) =>));
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
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: SmoothPageIndicator(
                                controller: _controller,
                                count: 3,
                                effect: const WormEffect(dotColor: Colors.white70,
                                    activeDotColor: Colors.white,
                                    dotHeight: 5,
                                    dotWidth: 5),
                                onDotClicked: (index) =>
                                    _controller.animateToPage(index,
                                        duration:
                                        const Duration(milliseconds: 300),
                                        curve: Curves.bounceOut),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration:  const BoxDecoration(
                       // color: Colors.blue,
                        image: DecorationImage(image: AssetImage('lib/assets/images/images1.jpg'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(17),
                            child: InkResponse(
                              onTap: () {
                                Navigator.pop(context);
                                // Navigator.push(context, MaterialPageRoute(builder: (context) =>));
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
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: SmoothPageIndicator(
                                controller: _controller,
                                count: 3,
                                effect: const WormEffect(dotColor: Colors.white70,
                                    activeDotColor: Colors.white,
                                    dotHeight: 5,
                                    dotWidth: 5),
                                onDotClicked: (index) =>
                                    _controller.animateToPage(index,
                                        duration:
                                        const Duration(milliseconds: 300),
                                        curve: Curves.bounceOut),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              child: Text(
                                // "Title",
                                 data.title,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // color: Colors.green,
                               color:data.status? Colors.green:Colors.red,
                            ),
                            child:  Center(
                              child: Text(
                                  // "Success",
                                   data.status?"Success":"Fail",
                                  style: const TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                              // "Mission Id",
                               data.year,
                              style: const TextStyle(fontSize: 15, color: Colors.white)),
                          Text(
                            // "Date",
                             data.date,
                            style: const TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        // "sdfgasd safgasdgsad safgasfsg dfxgadsfg fgdsfgdfsg dfgasfgs "
                        //     "asdfasfd adsfgafgdaf safgasdfgsad sgafadrsgeagf dsfasdjfgajsdf ",
                         data.details,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}