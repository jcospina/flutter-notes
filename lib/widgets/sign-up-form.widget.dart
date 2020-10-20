import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/model/app.model.dart';
import 'package:flutter_notes/services/services.dart';
import 'package:flutter_notes/utils/constants.dart';
import 'package:flutter_notes/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  final FormType formType;
  final String submitLabel;
  final VoidCallback onSubmit;
  final VoidCallback onChangeForm;

  SignUpForm({
    this.formType,
    this.submitLabel,
    this.onSubmit,
    this.onChangeForm,
  });

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String name = '';
    String email = '';
    String password = '';
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignUpTextFormField(
            visible: widget.formType == FormType.REGISTER,
            icon: Icon(Icons.person),
            placeholder: 'Name',
            gap: 15.0,
            validator: (String value) {
              return value.isEmpty ? 'Please enter your name' : null;
            },
            onChange: (String newValue) {
              name = newValue;
            },
          ),
          SignUpTextFormField(
            icon: Icon(Icons.email),
            placeholder: 'Email',
            inputType: TextInputType.emailAddress,
            gap: 15.0,
            validator: (String value) {
              return EmailValidator.validate(value)
                  ? null
                  : 'Please enter a valid email';
            },
            onChange: (String newValue) {
              email = newValue;
            },
          ),
          SignUpTextFormField(
            icon: Icon(Icons.vpn_key),
            placeholder: 'Password',
            obscureText: true,
            gap: 15.0,
            validator: (String value) {
              return value.isEmpty ? 'Password cannot be empty' : null;
            },
            onChange: (String newValue) {
              password = newValue;
            },
          ),
          Visibility(
            visible: widget.formType == FormType.LOGIN,
            child: Align(
              alignment: Alignment.centerRight,
              child: Link(
                label: 'Forgot Password?',
                color: kDarkBlueColor.withOpacity(0.5),
                fontWeight: FontWeight.w400,
                onTap: () {},
              ),
            ),
          ),
          RoundedButton(
            label: widget.submitLabel,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                context.read<NoteAppState>().setLoginState(true);
                try {
                  if (widget.formType == FormType.REGISTER) {
                    await AuthService().registerUser(name, email, password);
                  } else {
                    await AuthService().login(email, password);
                  }
                } on FirebaseAuthException catch (e) {
                  Flushbar(
                    messageText: Text(
                      ErrorHandler().getAuthErrorMessage(e),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    icon: Icon(
                      Icons.warning,
                      color: Theme.of(context).primaryColor,
                    ),
                    duration: Duration(seconds: 5),
                    isDismissible: true,
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    flushbarPosition: FlushbarPosition.TOP,
                    shouldIconPulse: false,
                    boxShadows: kElevationToShadow[8],
                  )..show(context);
                } finally {
                  context.read<NoteAppState>().setLoginState(false);
                }
              }
            },
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.formType == FormType.LOGIN
                      ? 'Don\'t have an account?  '
                      : 'Already have an account? ',
                  style: kTitleTextStyle,
                ),
                Link(
                  label: widget.formType == FormType.LOGIN
                      ? 'Sign Up Now!'
                      : 'Login',
                  color: Theme.of(context).primaryColor,
                  onTap: widget.onChangeForm,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpTextFormField extends StatelessWidget {
  final bool visible;
  final Icon icon;
  final String placeholder;
  final double gap;
  final TextInputType inputType;
  final bool obscureText;
  final Function validator;
  final Function onChange;

  SignUpTextFormField({
    this.visible = true,
    this.icon,
    this.placeholder,
    this.gap,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: visible
          ? Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: icon,
                    labelText: placeholder,
                  ),
                  keyboardType: inputType,
                  obscureText: obscureText,
                  validator: validator,
                  onChanged: onChange,
                ),
                SizedBox(
                  height: gap,
                ),
              ],
            )
          : SizedBox(
              width: 100,
            ),
    );
  }
}
