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
                onSubmit: () {},
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
