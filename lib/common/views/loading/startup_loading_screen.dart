import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soundmates_app/config/app_colors.dart';
import 'package:soundmates_app/config/extensions.dart';

class StartupLoadingScreen extends ConsumerWidget {
  const StartupLoadingScreen({super.key});

  Widget shimmerContainer(double width, double height) => Shimmer.fromColors(
    baseColor: AppColors.shimmerBaseColor,
    highlightColor: AppColors.shimmerHighlightColor,
    child: Container(width: width, height: height, color: Colors.grey),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = context.screenWidth;
    final height = context.screenHeight;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              shimmerContainer(width * 0.7, height * 0.02),
              shimmerContainer(width * 0.5, height * 0.02),
              shimmerContainer(width * 0.8, height * 0.7),
              shimmerContainer(width * 0.9, height * 0.02),
            ],
          ).paddingAll(8),
        ),
      ),
    );
  }
}
