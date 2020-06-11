import 'package:flutter/material.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';

class ProgressIndicators extends StatelessWidget {
  const ProgressIndicators({
    @required this.title,
    @required this.description,
    @required this.active,
    this.isLast = false,
  });
  final String title, description;
  final bool active, isLast;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                image: active
                    ? DecorationImage(image: AssetImage(AppAsset().orderCheck))
                    : null,
                border: Border.all(color: AppColors().primaryColor, width: 0.7),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            !isLast
                ? Column(
                    children: <Widget>[
                      verticalSpace(10),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors()
                            .primaryColor
                            .withOpacity(active ? 1 : 0.5),
                      ),
                      verticalSpace(10),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors()
                            .primaryColor
                            .withOpacity(active ? 1 : 0.5),
                      ),
                      verticalSpace(10),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors()
                            .primaryColor
                            .withOpacity(active ? 1 : 0.5),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
        horizontalSpaceMedium,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: progressOrder.copyWith(
                  fontWeight: FontWeight.w500,
                  color: active
                      ? AppColors.orderTextColor
                      : AppColors.orderTextColor.withOpacity(0.5)),
            ),
            Text(
              description,
              style: progressOrder.copyWith(
                  fontSize: 10,
                  color: active
                      ? AppColors.orderTextColor
                      : AppColors.orderTextColor.withOpacity(0.5)),
            ),
          ],
        )
      ],
    );
  }
}
