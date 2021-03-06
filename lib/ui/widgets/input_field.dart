import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/shared/app_colors.dart';

import 'note_text.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final Function enterPressed;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final String additionalNote;
  final String label;
  final Function(String) onChanged;
  final List<TextInputFormatter> formatter;
  final int maxLines, maxLength;

  InputField(
      {@required this.controller,
      @required this.placeholder,
      @required this.label,
      this.enterPressed,
      this.fieldFocusNode,
      this.nextFocusNode,
      this.additionalNote,
      this.onChanged,
      this.formatter,
      this.maxLength,
      this.maxLines,
      this.validationMessage,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.password = false,
      this.isReadOnly = false,
      this.smallVersion = false});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPassword;
  double fieldHeight = 48;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: widget.smallVersion ? 80 : 48,
          alignment: Alignment.centerLeft,
          // padding: fieldPadding,
          // decoration:
          //     widget.isReadOnly ? disabledFieldDecortaion : fieldDecoration,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  focusNode: widget.fieldFocusNode,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  inputFormatters:
                      widget.formatter != null ? widget.formatter : null,
                  onEditingComplete: () {
                    if (widget.enterPressed != null) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.enterPressed();
                    }
                  },
                  onFieldSubmitted: (value) {
                    if (widget.nextFocusNode != null) {
                      widget.nextFocusNode.requestFocus();
                    }
                  },
                  obscureText: isPassword,
                  readOnly: widget.isReadOnly,
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    labelText: widget.label,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors().borderColor, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors().borderColor, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors().primaryColor, width: 2.0),
                    ),
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    hintStyle:
                        TextStyle(fontSize: widget.smallVersion ? 12 : 15),
                    suffix: GestureDetector(
                      onTap: () => setState(() {
                        isPassword = !isPassword;
                      }),
                      child: widget.password
                          ? Container(
                              width: fieldHeight,
                              height: fieldHeight,
                              alignment: Alignment.center,
                              child: Icon(
                                isPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            )
                          : Container(
                              width: fieldHeight,
                              height: fieldHeight,
                              alignment: Alignment.center,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        (widget.validationMessage != null)
            ? NoteText(
                widget.validationMessage,
                color: Colors.red,
              )
            : SizedBox(),
        (widget.additionalNote != null) ? verticalSpace(5) : SizedBox(),
        (widget.additionalNote != null)
            ? NoteText(widget.additionalNote)
            : SizedBox(),
        verticalSpaceSmall
      ],
    );
  }
}
