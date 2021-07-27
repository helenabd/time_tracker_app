import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/domain/domain.dart';
import 'package:time_tracker_app/services/services.dart';

class EmailSignInBloc {
  final AuthBase auth;
  EmailSignInBloc({
    @required this.auth,
  });

  // stream controller
  final StreamController<EmailSignInModel> _modelController =
      StreamController<EmailSignInModel>();
  // get the changes
  Stream<EmailSignInModel> get modelStream => _modelController.stream;
  // initialize default values
  EmailSignInModel _model = EmailSignInModel();

  void dispose() {
    _modelController.close();
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      if (_model.formType == EmailSignInFormType.SignIn) {
        await auth.signInEmailAndPassword(_model.email, _model.password);
      } else {
        await auth.createUserWithEmailAndPassword(
            _model.email, _model.password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = _model.formType == EmailSignInFormType.SignIn
        ? EmailSignInFormType.Register
        : EmailSignInFormType.SignIn;

    updateWith(
      email: '',
      password: '',
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    // update model
    _model = _model.copyWith(
      email: email,
      password: password,
      formType: formType,
      isLoading: isLoading,
      submitted: submitted,
    );
    // add updated model to _modelController
    _modelController.add(_model);
  }
}
