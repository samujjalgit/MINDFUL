// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mindful/home.dart';
import 'package:mindful/launch.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: _user != null ? _userInfo() : _googleSignInButton(),
      //const Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Text(
      //         overflow: TextOverflow.ellipsis,
      //         'Sign In',
      //         style: TextStyle(fontSize: 25),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _googleSignInButton() {
    return Center(
      child: SizedBox(
        height: 50,
        child: SignInButton(
          Buttons.google,
          text: 'Sign up with Google',
          onPressed: _handleGoogleSignIn,
        ),
      ),
    );
  }

  Widget _userInfo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_user!.photoURL!),
              ),
            ),
          ),
          Text(_user!.email!),
          Text(
            _user!.displayName ?? "",
            // style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const Spacer(flex: 1),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const HelloScreen();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.orange[50],
              minimumSize: const Size(200, 50),
            ),
            child: const Text("Next"),
          ),
          MaterialButton(
            color: Color.fromARGB(255, 255, 172, 70),
            child: const Text("Sign Out"),
            onPressed: _auth.signOut,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }

  // void _handleGoogleSignOut() {
  //   try {
  //     GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
  //     _auth.signOut();
  //   } catch (error) {
  //     print(error);
  //   }
  // }
}
