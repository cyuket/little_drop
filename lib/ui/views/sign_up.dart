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
import 'package:little_drops/ui/widgets/modal.dart';
import 'package:little_drops/viewModel/signup_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phonNumberController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 414, height: 896, allowFontScaling: true);
    return ViewModelProvider.withConsumer(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors().background,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors().background,
              automaticallyImplyLeading: false,
              title: Text(
                'Sign Up',
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 20, color: AppColors().textColor)),
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
                      controller: fullNameController,
                      placeholder: "Enter Full Name",
                      label: "Full Name",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                      smallVersion: false,
                      controller: emailController,
                      placeholder: "youremail@email.com",
                      label: "Email",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                      smallVersion: false,
                      controller: phonNumberController,
                      placeholder: "+234 xxx xxx xxxxx",
                      label: "Phone Number",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                      smallVersion: false,
                      controller: passwordController,
                      placeholder: "Password",
                      label: "Password",
                      password: true,
                      additionalNote:
                          'Password has to be a minimum of 6 characters.',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BusyButton(
                      title: 'Sign Up',
                      busy: model.busy,
                      onPressed: () {
                        model.signUp(
                          email: emailController.text,
                          password: passwordController.text,
                          fullName: fullNameController.text,
                          phoneNumber: phonNumberController.text,
                        );
                        emailController.clear();
                        passwordController.clear();
                        phonNumberController.clear();
                        fullNameController.clear();
                      },
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
                                  context, LoginViewRoute);
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: AppColors().primaryColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
