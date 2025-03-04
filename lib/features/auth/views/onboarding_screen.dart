import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates_app/config/app_assets.dart';
import 'package:soundmates_app/config/app_colors.dart';
import 'package:soundmates_app/config/extensions.dart';
import 'package:soundmates_app/features/auth/views/widgets/info_container.dart';
import 'package:vector_graphics/vector_graphics.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: _buildUi(context, ref));
  }

  Widget _buildUi(BuildContext context, WidgetRef ref) => SizedBox.expand(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildOnboardingImage(context),
        _buildInfoRow().paddingSymmetric(h: 8),
        const Spacer(),
        _buildButton(context).paddingAll(8),
      ],
    ),
  );

  Widget _buildOnboardingImage(BuildContext context) => Stack(
    children: [
      VectorGraphic(
        loader: const AssetBytesLoader(AppAssets.backgroundImage),
        width: context.screenWidth,
        height: context.screenHeight * 0.6,
        fit: BoxFit.cover,
      ),
      VectorGraphic(
        loader: const AssetBytesLoader(AppAssets.authImageOne),
        width: context.screenWidth,
        height: context.screenHeight * 0.6,
        fit: BoxFit.contain,
      ),
    ],
  );

  Widget _buildInfoRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InfoContainer(text: 'x' * 10, iconData: Icons.star_rounded),
      InfoContainer(text: 'x' * 5, iconData: Icons.star_rounded),
      InfoContainer(text: 'x' * 20, iconData: Icons.star_rounded),
    ],
  );

  Widget _buildButton(BuildContext context) => ElevatedButton(
    onPressed: () {
      context.beamToNamed('/onboarding/auth');
    },
    child: const Text('Get Started'),
  ).maxWidth(context.screenWidth);
}
