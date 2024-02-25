import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindful/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindful/settings.dart';
import 'package:mindful/talkbot.dart';
import 'package:mindful/signin.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  int _selectedIndex = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      // appBar: AppBar(
      //     // title: const Text('Mindful'),
      //     ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 80.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  'Googlers',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                Text(
                  'What would you like to do?',
                  style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CarouselSlider(
              items: [
                'Focus', //image will be added accordingly
                'Talk',
                'MHT',
                'Meditation',
                'Anxiety',
              ].map((name) {
                return Builder(
                  builder: (BuildContext context) {
                    int index = [
                      'Focus',
                      'Talk',
                      'MHT',
                      'Meditation',
                      'Anxiety',
                    ].indexOf(name);
                    return GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[200],
                          borderRadius: BorderRadius.circular(10.0),
                          // image: DecorationImage(
                          //     image: AssetImage(name), fit: BoxFit.fill),
                        ),
                        child: Center(
                          child: Text(
                            name,
                            style: const TextStyle(
                                fontSize: 24.0, color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TalkBot()));
                        }
                      },
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 900),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Today's top 4",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CarouselSlider(
              items: [
                'Anxiety: How to overcome?',
                'Depression: What is it?',
                'Meditation',
              ].map((items) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          items,
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 100.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 900),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
          ),
        ],
      ),
      // this section holds the bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 20,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (index == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => profilePage()));
            } else if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => settingsPage()));
            }
          }),
    );
  }
}
