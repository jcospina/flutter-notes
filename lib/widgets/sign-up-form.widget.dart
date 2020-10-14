import 'package:flutter/material.dart';
import 'package:flutter_notes/model/app.model.dart';
import 'package:flutter_notes/utils/constants.dart';
import 'package:flutter_notes/widgets/link.widget.dart';
import 'package:flutter_notes/widgets/rounded-button.widget.dart';

class SignUpForm extends StatefulWidget {
  final FormType formType;
  final String submitLabel;
  final VoidCallback onSubmit;
  final VoidCallback onChangeForm;

  SignUpForm(
      {this.formType, this.submitLabel, this.onSubmit, this.onChangeForm});
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          ),
          SignUpTextFormField(
            icon: Icon(Icons.email),
            placeholder: 'Email',
            inputType: TextInputType.emailAddress,
            gap: 15.0,
          ),
          SignUpTextFormField(
            icon: Icon(Icons.vpn_key),
            placeholder: 'Password',
            obscureText: true,
            gap: 15.0,
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
            onPressed: widget.onSubmit,
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

  SignUpTextFormField({
    this.visible = true,
    this.icon,
    this.placeholder,
    this.gap,
    this.inputType = TextInputType.text,
    this.obscureText = false,
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
