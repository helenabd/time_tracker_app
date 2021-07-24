import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_app/services/services.dart';

import '../app.dart';

class SignInPage extends StatelessWidget {
  final AuthBase auth;

  const SignInPage({
    Key key,
    @required this.auth,
  }) : super(key: key);

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(
          auth: auth,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Time Tracker')),
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 48),
          SocialSignInButton(
            backgroundColor: Colors.white,
            buttonText: 'Sign in with Google',
            textColor: Colors.black87,
            onPressed: _signInWithGoogle,
            imagePath: 'assets/images/google-logo.png',
          ),
          /*SizedBox(height: 8),
          SocialSignInButton(
            backgroundColor: Color(0xFF334D92),
            buttonText: 'Sign in with Facebook',
            textColor: Colors.white,
            onPressed: () {},
            imagePath: 'assets/images/facebook-logo.png',
          ),*/
          SizedBox(height: 8),
          SignInButton(
            backgroundColor: Colors.teal[700],
            buttonText: 'Sign in with email',
            textColor: Colors.white,
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height: 8),
          Text(
            'or',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          SignInButton(
            backgroundColor: Colors.lime[300],
            buttonText: 'Go anonymous',
            textColor: Colors.black,
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
