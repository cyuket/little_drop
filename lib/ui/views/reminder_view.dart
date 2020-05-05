import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/ui/widgets/modal.dart';
import 'package:little_drops/constants/route_names.dart';

class ReminderView extends StatefulWidget {
  @override
  _ReminderViewState createState() => _ReminderViewState();
}

class _ReminderViewState extends State<ReminderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      appBar: AppBar(
        backgroundColor: AppColors().background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors().primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 327,
              child: Column(
                children: <Widget>[
                  Text(
                    'Let’s remind you about your clothings!',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 20, color: AppColors().textColor)),
                  ),
                  verticalSpace(20),
                  Text(
                    'When do you want us to remind you about your laundry?',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors().textColor.withOpacity(0.6))),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CheckboxGroup(
                labels: <String>[
                  "Every Sunday",
                  "Every Monday",
                  "Every Tuesday",
                  "Every Wednesday",
                  "Every Thursday",
                  "Every Friday",
                  "Every Saturday",
                  "Monthly",
                  "Never Thanks"
                ],
                activeColor: AppColors().primaryColor,
                labelStyle: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 14, color: AppColors().textColor)),
                onChange: (bool isChecked, String label, int index) => print(
                    "isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> checked) =>
                    print("checked: ${checked.toString()}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: BusyButton(
                  title: "Done",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext diaLogcontext) => CustomModal(
                        message: "Now, we’d notify you when it’s laundry day ",
                        buttonText: "Take me home, baby!",
                        onTap: () {
                          Navigator.pop(diaLogcontext);
                          Navigator.pushNamed(context, HomeViewRoute);
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
