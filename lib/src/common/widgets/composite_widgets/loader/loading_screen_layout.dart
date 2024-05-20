import 'package:flutter/material.dart';
import 'square_progress_indicator.dart';

class LoadingScreenLayout extends StatelessWidget {
  const LoadingScreenLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(
        child: SquareProgressIndicator(),
      ),
    );
  }
}
