import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';

class SocialMediaButton extends StatelessWidget {
  final String logoImage, name;
  final Color color;
  final Function onTap;
  final bool isColor, isSmall;

  SocialMediaButton(
      {this.color,
      this.logoImage,
      this.name,
      this.onTap,
      this.isSmall = false,
      this.isColor = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: isSmall ? 163 : null,
          padding: EdgeInsets.all(8),
          height: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color.fromRGBO(213, 213, 213, 0.25),
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(logoImage),
              SizedBox(
                width: 20,
              ),
              Text(name,
                  style: !isColor ? regularTextStyle : regularTextStyleBlack),
            ],
          ),
        ),
      ),
    );
  }
}
