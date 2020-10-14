import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/model/app.model.dart';
import 'package:flutter_notes/widgets/logo.widget.dart';
import 'package:flutter_notes/widgets/rounded-container.widget.dart';
import 'package:flutter_notes/widgets/sign-up-form.widget.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FormType formType = FormType.LOGIN;
  String submitLabel = 'Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: LogoWidget(),
            ),
            RoundedContainer(
              child: SignUpForm(
                formType: formType,
                submitLabel: submitLabel,
                onSubmit: () {
                  FirebaseFirestore store = FirebaseFirestore.instance;
                  store.collection('test').add({'name': 'juan'});
                },
                onChangeForm: () {
                  setState(() {
                    formType = formType == FormType.LOGIN
                        ? FormType.REGISTER
                        : FormType.LOGIN;
                    submitLabel =
                        formType == FormType.LOGIN ? 'Login' : 'Register';
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
