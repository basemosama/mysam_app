part of '../../imports/my_contributions_imports.dart';

class CustomTabIndicator extends Decoration {
  final TabController controller;
  final List<Color> colors;

  const CustomTabIndicator({required this.controller, required this.colors});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorPainter(controller: controller, colors: colors);
  }
}

class _CustomIndicatorPainter extends BoxPainter {
  final TabController controller;
  final List<Color> colors;

  _CustomIndicatorPainter({required this.controller, required this.colors});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double animationValue = controller.animation!.value;

    // Determine which two colors we are interpolating between
    final int currentIndex = animationValue.floor();
    final int nextIndex = animationValue.ceil() % colors.length;

    final nextIndexFraction = animationValue - currentIndex;

    final Paint currentIndexPaint = Paint()
      ..color = colors[currentIndex]
      ..style = PaintingStyle.fill;

    final Paint nextIndexPaint = Paint()
      ..color = colors[nextIndex]
      ..style = PaintingStyle.fill;

    final Rect currentIndexRect = Offset(
          offset.dx,
          configuration.size!.height - 4.0,
        ) &
        Size(configuration.size!.width * (1 - nextIndexFraction), 4.0);

    final Rect nextIndexRect = Offset(
          offset.dx,
          configuration.size!.height - 4.0,
        ) &
        Size(configuration.size!.width * nextIndexFraction, 4.0);

    canvas.drawRect(currentIndexRect, currentIndexPaint);
    canvas.drawRect(nextIndexRect, nextIndexPaint);
  }
}
