import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/ui/shared/screen_util.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/input_field.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
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
              InputField(
                smallVersion: false,
                controller: emailController,
                label: "Email",
                placeholder: "youremail@email.com",
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                smallVersion: false,
                controller: passwordController,
                label: "Password",
                placeholder: "Password",
                password: true,
              ),
              SizedBox(
                height: 20,
              ),
              BusyButton(
                  title: 'Login',
                  onPressed: () => Navigator.pushNamed(context, HomeViewRoute)),
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
