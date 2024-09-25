part of '../../../imports/create_contribution_imports.dart';

///Creates a dashed horizontal line widget.
class BuildStepLineWidget extends StatefulWidget {
  //Width of the line
  final double? width;

  //Height of the line
  final double? height;

  final bool isActive;

  //Width of the each dash line.
  final double dashWidth;

  //Space between each dash line.
  final double dashSpace;

  //Color of dash line.
  final Color lineColor;
  final Color dashColor;

  final Color activeColor;

  //Stroke width for each dash line.
  final double strokeWidth;

  const BuildStepLineWidget({
    super.key,
    this.width,
    this.height,
    this.isActive = false,
    this.dashWidth = 2,
    this.dashSpace = 5,
    this.strokeWidth = 1,
    this.lineColor = Colors.grey,
    this.dashColor = Colors.grey,
    this.activeColor = Colors.green,
  });

  @override
  State<BuildStepLineWidget> createState() => _DashedLineState();
}

class _DashedLineState extends State<BuildStepLineWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: RepaintBoundary(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CustomPaint(
            size: Size(
              widget.width ?? double.infinity,
              widget.height ?? 2,
            ),
            painter: DashedLinePainter(
              dashWidth: widget.dashWidth,
              dashSpace: widget.dashSpace,
              lineColor: widget.lineColor,
              dashColor: widget.dashColor,
              strokeWidth: widget.strokeWidth,
              isActive: widget.isActive,
              activeColor: widget.activeColor,
            ),
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color lineColor;
  final Color dashColor;
  final Color activeColor;
  final double strokeWidth;
  double startX = 0;
  final bool isActive;
  final Paint painter;

  DashedLinePainter({
    this.dashWidth = 9,
    this.dashSpace = 5,
    this.strokeWidth = 1,
    this.lineColor = Colors.grey,
    this.dashColor = Colors.grey,
    this.activeColor = Colors.green,
    required this.isActive,
  }) : painter = Paint()
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    if (isActive) {
      painter.color = activeColor;
      // straight Line
      canvas.drawLine(Offset(0, size.height / 2),
          Offset(size.width, size.height / 2), painter);
    } else {
      // Half dashed line at the start and half straight line at the end

      painter.color = dashColor;
      while (startX < size.width / 2) {
        canvas.drawLine(Offset(startX, size.height / 2),
            Offset(startX + dashWidth, size.height / 2), painter);
        startX += dashWidth + dashSpace;
      }
      painter.color = lineColor;
      canvas.drawLine(Offset(startX, size.height / 2),
          Offset(size.width, size.height / 2), painter);
    }
  }

  @override
  bool shouldRepaint(DashedLinePainter oldDelegate) {
    final bool shouldRepaint = oldDelegate.lineColor != lineColor ||
        oldDelegate.dashColor != dashColor ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
    return shouldRepaint;
  }
}
