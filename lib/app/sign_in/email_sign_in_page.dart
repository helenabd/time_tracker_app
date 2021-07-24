import 'package:flutter/material.dart';

import 'package:time_tracker_app/services/services.dart';

import 'components/components.dart';

class EmailSignInPage extends StatelessWidget {
  final AuthBase auth;
  const EmailSignInPage({
    Key key,
    @required this.auth,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text('Sign In')),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInForm(
              auth: auth,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
