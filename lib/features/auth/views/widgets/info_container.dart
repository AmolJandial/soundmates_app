import 'package:flutter/material.dart';
import 'package:soundmates_app/config/app_colors.dart';
import 'package:soundmates_app/config/extensions.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key, required this.text, required this.iconData});

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return _buildUi(context);
  }

  Widget _buildUi(BuildContext context) =>
      Column(mainAxisAlignment: MainAxisAlignment.end, children: [_buildRoundContainer(), _buildText(context)]);

  Widget _buildRoundContainer() => Container(
    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.shimmerBaseColor)),
    child: Center(child: Icon(iconData)).paddingAll(8),
  );

  Widget _buildText(BuildContext context) =>
      Text(text, style: context.textTheme.labelLarge, textAlign: TextAlign.center).maxWidth(context.screenWidth * 0.3);
}
