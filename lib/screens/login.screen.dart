import 'package:flutter/material.dart';
import 'package:flutter_notes/model/app.model.dart';
import 'package:flutter_notes/widgets/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

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
      body: ModalProgressHUD(
        inAsyncCall: context.watch<NoteAppState>().loginIn,
        child: SafeArea(
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
      ),
    );
  }
}
