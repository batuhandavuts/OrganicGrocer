import 'package:flutter/material.dart';
import 'package:grocery_app/loginscreens/common/color_extension.dart';
import 'package:grocery_app/loginscreens/common_widget/round_button.dart';
import 'package:grocery_app/loginscreens/common_widget/round_icon_button.dart';
import 'package:grocery_app/loginscreens/common_widget/round_textfield.dart';
import 'package:grocery_app/loginscreens/login/reset_password_view.dart';
import 'package:grocery_app/loginscreens/login/sign_up_view.dart';
import 'package:grocery_app/loginscreens/on_boarding/on_boarding_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "Login",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Add your details to login",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Your Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundTextfield(
                hintText: "Password",
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Login",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnBoardingView()));
                  }),
              const SizedBox(
                height: 4,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPasswordView()));
                },
                child: Text(
                  "forgot your password",
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "or Login With",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundIconButton(
                  onPressed: () {},
                  title: "Login with Facebook",
                  icon: "images/facebook_logo.png",
                  color: const Color(0xff367FC0)),
              const SizedBox(
                height: 25,
              ),
              RoundIconButton(
                  onPressed: () {},
                  title: "Login with Google",
                  icon: "images/google_logo.png",
                  color: const Color(0xffDD4839)),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpView()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
