import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:little_drops/ui/shared/app_colors.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled, outline;
  const BusyButton(
      {@required this.title,
      this.busy = false,
      @required this.onPressed,
      this.enabled = true,
      this.outline = false});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      child: InkWell(
        child: Material(
          color: !widget.outline
              ? widget.enabled
                  ? AppColors().primaryColor
                  : AppColors().primaryColor
              : Colors.white,
          elevation: 3,
          borderRadius: BorderRadius.circular(5),
          child: AnimatedContainer(
            height: widget.busy ? 48 : null,
            width: widget.busy ? 48 : null,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: widget.busy ? 10 : 15,
                vertical: widget.busy ? 10 : 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors().primaryColor)),
            child: !widget.busy
                ? Text(
                    widget.title,
                    style: widget.outline
                        ? buttonTitleTextStyleBlack
                        : buttonTitleTextStyle,
                  )
                : CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
          ),
        ),
      ),
    );
  }
}
