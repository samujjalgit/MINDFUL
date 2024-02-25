import 'package:flutter/material.dart';
// import 'package:mindful/Signin.dart';
import 'package:mindful/signin.dart';

void main() {
  runApp(const LaunchScrn());
}

class LaunchScrn extends StatelessWidget {
  const LaunchScrn({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //body widget - refractored to center
      body: Center(
        child: Column(
          //aligning the main axis
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Mindful',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Text("'Healthy mind, healthy life.'"),
            const SizedBox(
              height: 60,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              // child: Column(
              //   children: [
              //     Image.asset('Assets/launch.png'),
              //   ],
              // ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Image.asset('Assets/launch.png'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SignIn();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.orange[50],
                minimumSize: const Size(200, 50),
              ),
              child: const Text("Start"),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
