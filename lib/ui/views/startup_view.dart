import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 300,
            height: 100,
            // child: Image.asset(AppAsset().appLogoSrc),
          ),
          CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(
              Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
