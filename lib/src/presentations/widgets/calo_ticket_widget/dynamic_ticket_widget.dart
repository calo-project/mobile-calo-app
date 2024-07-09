part of '../widget.dart';

class DynamicTicketWidget extends StatefulWidget {
  final Color ticketBorderColor;
  final Color ticketBgColor;
  final Widget? ticketInfoWidget;
  final String? textDetails;

  const DynamicTicketWidget({
    super.key,
    required this.ticketBorderColor,
    required this.ticketBgColor,
    required this.ticketInfoWidget,
    required this.textDetails,
  });

  @override
  State<DynamicTicketWidget> createState() => _DynamicTicketWidgetState();
}

class _DynamicTicketWidgetState extends State<DynamicTicketWidget> {
  /// A global key that uniquely identifies the ticket content widget.
  /// Used to get the size of the ticket content.
  final GlobalKey ticketContentKey = GlobalKey();

  /// The height of the ticket content widget.
  /// Initialized to 0.0 and updated dynamically based on calculations.
  double contentHeight = 0.0;

  /// A [ValueNotifier] that notifies when the ticket widget needs to update.
  /// Initialized to false.
  ValueNotifier<bool> updateTicket = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    /// Calculates the content height and triggers a widget rebuild after the first frame is built.
    ///
    /// Uses [WidgetsBinding.addPostFrameCallback] to schedule a callback after the first frame.
    /// In the callback, calculates the actual content height and triggers a rebuild by calling
    /// [updateContentHeight]. This ensures the widget rebuilds with the correct content height
    /// after layout.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Calculate the content height after the first frame is built
      contentHeight = _calculateContentHeight();

      // Trigger updateContentHeight to rebuild the widget with the new height
      updateContentHeight();
    });
  }

  /// Called whenever the widget configuration changes.
  ///
  /// Compares the old and new [DynamicTicketWidget] to determine if the widget
  /// needs to rebuild and update. Calls [super.didUpdateWidget] to complete
  /// the update lifecycle.
  @override
  void didUpdateWidget(covariant DynamicTicketWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Update content height based on parent widget constraints
      contentHeight = constraints.maxHeight;

      /// Builds the UI for the dynamic ticket widget.
      ///
      /// Uses a [ValueListenableBuilder] to rebuild when the ticket updates. The main
      /// ticket shape and visuals are rendered using a [CustomPaint] with
      /// [TicketPainter]. The content is laid out in a [Column] with the top section
      /// for custom ticket info and bottom section for default text.
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ValueListenableBuilder(
            valueListenable: updateTicket,
            builder: (context, bool val, _) {
              /// Renders the visual ticket shape and content using a [CustomPaint] widget.
              ///
              /// The [TicketPainter] handles custom painting the ticket shape and visuals.
              /// The content is laid out with a [Column] containing the custom ticket info
              /// at the top and default text at the bottom. Padding is added for white space.
              return CustomPaint(
                painter: TicketPainter(
                  borderColor: widget.ticketBorderColor,
                  bgColor: widget.ticketBgColor,
                  dottedLineColor: const Color(0xff0077b6),
                  contentHeight: _calculateContentHeight(),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        key: ticketContentKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),
                            if (widget.ticketInfoWidget != null)
                              widget.ticketInfoWidget ??
                                  const SizedBox.shrink(),
                            const SizedBox(height: 4.0),
                          ],
                        ),
                      ),
                      const SizedBox(height: 38.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 20.0),
                          Center(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: ClipRRect(
                                  // borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    'https://pngimg.com/d/barcode_PNG47.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            widget.textDetails!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }

  double _calculateContentHeight() {
    double contentHeight = 0.0;
    if (ticketContentKey.currentContext != null) {
      // Calculate the height of the content widget
      final contentSize =
          ticketContentKey.currentContext!.findRenderObject()!.paintBounds.size;
      contentHeight = contentSize.height;
      updateTicket.value = !updateTicket.value;
    }
    return contentHeight;
  }

  // Function to trigger a rebuild when the content height changes
  void updateContentHeight() {
    setState(() {
      contentHeight = _calculateContentHeight();
    });
  }
}

/// Custom painter class to draw the ticket shape with cutouts and dotted line.
///
/// This class handles all the custom painting to create the ticket shape and
/// visual elements like the cutouts and dotted line divider. It takes in
/// parameters like colors and sizing to draw the ticket.
class TicketPainter extends CustomPainter {
  final Color borderColor;
  final Color bgColor;
  final Color dottedLineColor;
  final double contentHeight;

  /// Constants for ticket shape cutout sizing.
  ///
  /// `_cornerGap`: The gap in pixels between the ticket corners and the start of the cutout curves.
  /// `_cutoutRadius`: The radius in pixels of the circular cutouts on the sides of the ticket.
  /// `_cutoutDiameter`: The diameter in pixels of the circular cutouts, calculated from the radius.
  static const _cornerGap = 16.0;
  static const _cutoutRadius = 19.0;
  static const _cutoutDiameter = _cutoutRadius * 2.0;

  TicketPainter({
    required this.bgColor,
    required this.borderColor,
    required this.dottedLineColor,
    required this.contentHeight,
  });

  /// Overrides [CustomPainter.paint] to draw the ticket shape and visual elements.
  ///
  /// Calculates sizing and positions for the ticket shape, cutouts, and dotted line.
  /// Creates [Paint] objects with styles and colors. Draws the path representing
  /// the ticket shape, cutouts, and dotted line divider onto the [Canvas].
  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width;
    final maxHeight = size.height;

    final cutoutStartPos = contentHeight + _cutoutRadius + 47.0;
    final leftCutoutStartY = cutoutStartPos;
    final rightCutoutStartY = cutoutStartPos - _cutoutDiameter;
    final dottedLineY = cutoutStartPos - _cutoutRadius;
    double dottedLineStartX = _cutoutRadius;

    // Adjust the calculation of dottedLineEndX
    final double dottedLineEndX = maxWidth - _cutoutRadius;

    // Calculate the maximum dash width that fits within the curve
    final double maxDashWidth = (dottedLineEndX - dottedLineStartX) / 2;

    // Set a maximum dash width (you can adjust this as needed)
    double maxAllowedDashWidth = 3.0;

    // Calculate the actual dash width (minimum of maxAllowedDashWidth and maxDashWidth)
    final double dashWidth = min(maxDashWidth, maxAllowedDashWidth);
    double dashSpace = 2.0;

    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = bgColor;

    final paintBorder = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor;

    final paintDottedLine = Paint()
      ..color = dottedLineColor
      ..strokeWidth = 1.0;

    var path = Path();

    path.moveTo(_cornerGap, 0);
    path.lineTo(maxWidth - _cornerGap, 0);
    _drawCornerArc(path, maxWidth, _cornerGap);
    path.lineTo(maxWidth, rightCutoutStartY);
    _drawCutout(path, maxWidth, rightCutoutStartY + _cutoutDiameter);
    path.lineTo(maxWidth, maxHeight - _cornerGap);
    _drawCornerArc(path, maxWidth - _cornerGap, maxHeight);
    path.lineTo(_cornerGap, maxHeight);
    _drawCornerArc(path, 0, maxHeight - _cornerGap);
    path.lineTo(0, leftCutoutStartY);
    _drawCutout(path, 0.0, leftCutoutStartY - _cutoutDiameter);
    path.lineTo(0, _cornerGap);
    _drawCornerArc(path, _cornerGap, 0);

    canvas.drawPath(path, paintBg);
    canvas.drawPath(path, paintBorder);

    while (dottedLineStartX < dottedLineEndX) {
      canvas.drawLine(
        Offset(dottedLineStartX, dottedLineY),
        Offset(dottedLineStartX + dashWidth, dottedLineY),
        paintDottedLine,
      );
      dottedLineStartX += dashWidth + dashSpace;
    }
  }

  /// Draws a semicircular cutout in the path.
  ///
  /// Parameters:
  /// - path: The [Path] to draw the cutout in.
  /// - startX: The x-coordinate of the start point of the cutout arc.
  /// - endY: The y-coordinate of the end point of the cutout arc.
  _drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: const Radius.circular(_cutoutRadius),
      clockwise: false,
    );
  }

  /// Draws a semicircular arc in the path from the current point to the given end point.
  ///
  /// Parameters:
  /// - path: The [Path] to draw the arc in.
  /// - endPointX: The x-coordinate of the end point of the arc.
  /// - endPointY: The y-coordinate of the end point of the arc.
  _drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(_cornerGap),
    );
  }

  /// Indicates if this [TicketPainter] should repaint when the specified
  /// [oldDelegate] changes. Returns false to avoid unnecessary repainting.
  @override
  bool shouldRepaint(TicketPainter oldDelegate) => false;

  /// Indicates if this [TicketPainter] should repaint when the specified
  /// [oldDelegate] changes. Returns false to avoid unnecessary repainting.
  @override
  bool shouldRebuildSemantics(TicketPainter oldDelegate) => false;
}
