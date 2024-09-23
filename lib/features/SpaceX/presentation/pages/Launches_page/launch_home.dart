import 'package:flutter/material.dart';
import 'Launch_ui_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'launch_details_pages.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LaunchHome extends StatefulWidget {
  const LaunchHome({super.key});

  @override
  State<LaunchHome> createState() => _LaunchHomeState();
}

class _LaunchHomeState extends State<LaunchHome> {
  Future<List<LaunchData>> getUsers() async {
    var url = Uri.parse('https://api.spacexdata.com/v3/launches/past');
    late http.Response response;
    List<LaunchData> users = [];
    int n = 0;

    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> launchList = jsonDecode(response.body);

        for (var item in launchList) {
          var title = await item['mission_name'];
          var details = await item['details'];
          details ??= 'not available';
          var date = await item['launch_date_utc'];

          var status = item['launch_success'];
          status ??= true;
          var year = item['launch_year'];
          // var date = item['static_fire_date_utc'];
          LaunchData user = LaunchData(title, details, date, status, year);

          users.add(user);
        }
      } else {
        return Future.error("Something gone wrong, ${response.statusCode}");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   title: const Text("Launches",
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 15)),
        // ),
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage('lib/assets/images/dark.png')),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text('Waiting',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
              );
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("  Launches",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)))
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkResponse(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserDetail(snapshot.data[index]),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: InkWell(
                                  child: GlassmorphicContainer(
                                      width: double.maxFinite,
                                      height: 100,
                                      borderRadius: 10,
                                      blur: 20,
                                      alignment: Alignment.bottomCenter,
                                      border: 2,
                                      linearGradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            const Color(0xFFffffff)
                                                .withOpacity(0.1),
                                            const Color(0xFFFFFFFF)
                                                .withOpacity(0.05),
                                          ],
                                          stops: const [
                                            0.1,
                                            1,
                                          ]),
                                      borderGradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          const Color(0xFFffffff)
                                              .withOpacity(0.5),
                                          const Color((0xFFFFFFFF))
                                              .withOpacity(0.5),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot
                                                          .data[index].title,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                    Text(
                                                      snapshot.data[index].year,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 8),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    // color: Colors.green,
                                                    color: snapshot
                                                            .data[index].status
                                                        ? Colors.green
                                                        : Colors.red,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                        // "Success",
                                                        snapshot.data[index]
                                                                .status
                                                            ? "Success"
                                                            : "Fail",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            const Column(
                                              children: [
                                                Text(
                                                    "  Second  GTO launch for Falcon 9. The USAF evaluated launch data  from this flight as \n"
                                                    "  part of a separate certification program for SpaceX to qualify to fly U.S. military   ........",
                                                    style: TextStyle(
                                                        fontSize: 7,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  snapshot.data[index].date,
                                                  // DateFormat("yyyy-MM-dd").format(snapshot.data[index].date),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    ));
  }
}
