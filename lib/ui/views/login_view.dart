import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/ui/shared/screen_util.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/input_field.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/ui/widgets/social_media.dart';
import 'package:little_drops/constants/route_names.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 414, height: 896, allowFontScaling: true);
    return Scaffold(
      backgroundColor: AppColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors().background,
        automaticallyImplyLeading: false,
        title: Text(
          'Login',
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 20, color: AppColors().textColor)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: screenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Image.asset(AppAsset().illustration4)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Kindly fill in your details',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 15, color: AppColors().textColor)),
                ),
              ),
              Text('Email:',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 13, color: AppColors().textColor))),
              SizedBox(
                height: 10,
              ),
              InputField(
                smallVersion: true,
                controller: emailController,
                placeholder: "Enter email",
              ),
              Text('Password:',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 13, color: AppColors().textColor))),
              SizedBox(
                height: 10,
              ),
              InputField(
                smallVersion: true,
                controller: passwordController,
                placeholder: "Password",
                password: true,
              ),
              BusyButton(title: 'Login', onPressed: null),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text('Or',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 14, color: AppColors().textColor))),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SocialMediaButton(
                    logoImage: AppAsset().google,
                    name: 'Sign in with Google',
                    isColor: true,
                    isSmall: true,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  SocialMediaButton(
                    logoImage: AppAsset().facebook,
                    color: AppColors().facebook,
                    name: 'Sign in with Facebook',
                    isSmall: true,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: <Widget>[
                    Text('Not a new member? ',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 12, color: AppColors().textColor),
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpViewRoute);
                      },
                      child: Text('Signup',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12, color: AppColors().primaryColor),
                          )),
                    )
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
