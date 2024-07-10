// ignore_for_file: unused_element, deprecated_member_use, unused_local_variable

part of 'widget.dart';

NavigationBarThemeData _getDefault(BuildContext context) {
  final ColorScheme colors = Theme.of(context).colorScheme;
  final TextTheme textTheme = Theme.of(context).textTheme;

  return NavigationBarThemeData(
    height: 80.0,
    elevation: 3.0,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    backgroundColor: colors.surface,
    shadowColor: Colors.transparent,
    surfaceTintColor: colors.surfaceTint,
    iconTheme: MaterialStateProperty.resolveWith((states) => IconThemeData(
        size: 24.0,
        color: states.contains(MaterialState.disabled)
            ? colors.onSurfaceVariant.withOpacity(0.38)
            : states.contains(MaterialState.selected)
                ? colors.onSecondaryContainer
                : colors.onSurfaceVariant)),
    indicatorColor: colors.secondaryContainer,
    indicatorShape: const StadiumBorder(),
    labelTextStyle: MaterialStateProperty.resolveWith(
        (states) => textTheme.labelMedium!.apply(
            color: states.contains(MaterialState.disabled)
                ? colors.onSurfaceVariant.withOpacity(0.70)
                : states.contains(MaterialState.selected)
                    ? colors.onSurface
                    : colors.onSurfaceVariant)),
  );
}

bool _isForwardOrCompleted(Animation<double> animation) =>
    animation.status == AnimationStatus.forward ||
    animation.status == AnimationStatus.completed;

class CaloNavigationBar extends StatelessWidget {
  const CaloNavigationBar({
    super.key,
    this.animationDuration,
    this.selectedIndex = 0,
    required this.destinations,
    this.labelBehavior,
    this.height,
    this.elevation,
    this.indicatorColor,
    this.overlayColor,
    this.indicatorShape,
    this.onDestinationSelected,
  });

  final Duration? animationDuration;
  final int selectedIndex;
  final List<Widget> destinations;
  final NavigationDestinationLabelBehavior? labelBehavior;
  final double? height;
  final double? elevation;
  final Color? indicatorColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final ShapeBorder? indicatorShape;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final NavigationBarThemeData defaults = _getDefault(context);
    final NavigationBarThemeData navigationBarThemeData =
        NavigationBarTheme.of(context);

    final double effectiveHeight =
        height ?? navigationBarThemeData.height ?? defaults.height!;
    final double effectiveElevation =
        elevation ?? navigationBarThemeData.elevation ?? defaults.elevation!;
    final NavigationDestinationLabelBehavior effectiveLabelBehavior =
        labelBehavior ??
            navigationBarThemeData.labelBehavior ??
            defaults.labelBehavior!;

    return Material(
      color: Config.primaryColor,
      elevation: effectiveElevation,
      child: SafeArea(
        child: SizedBox(
          height: effectiveHeight,
          // width: 45,
          child: Row(
            children: [
              for (int i = 0; i < destinations.length; i++)
                Expanded(
                  child: _SelectableAnimatedBuilder(
                    duration: animationDuration ?? Duration.zero,
                    isSelected: i == selectedIndex,
                    builder: (context, animation) =>
                        _CaloNavigationDestinationInfo(
                      index: i,
                      selectedIndex: selectedIndex,
                      totalNumberOfDestinations: destinations.length,
                      selectedAnimation: animation,
                      labelBehavior: effectiveLabelBehavior,
                      indicatorColor: indicatorColor,
                      indicatorShape: indicatorShape,
                      overlayColor: overlayColor,
                      onTap: onDestinationSelected != null
                          ? () => onDestinationSelected!(i)
                          : () {},
                      child: destinations[i],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectableAnimatedBuilder extends StatefulWidget {
  const _SelectableAnimatedBuilder({
    required this.isSelected,
    this.duration = Duration.zero,
    this.alwaysDoFullAnimation = false,
    required this.builder,
  });

  final bool isSelected;
  final Duration duration;
  final bool alwaysDoFullAnimation;
  final Widget Function(BuildContext context, Animation<double> animation)
      builder;

  @override
  State<_SelectableAnimatedBuilder> createState() =>
      __SelectableAnimatedBuilderState();
}

class __SelectableAnimatedBuilderState extends State<_SelectableAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: widget.isSelected ? 1.0 : 0.0,
    );
  }

  @override
  void didUpdateWidget(_SelectableAnimatedBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }

    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward(from: widget.alwaysDoFullAnimation ? 0 : null);
      } else {
        _controller.reverse(from: widget.alwaysDoFullAnimation ? 1 : null);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _controller);
}

class _CaloNavigationDestinationInfo extends InheritedWidget {
  const _CaloNavigationDestinationInfo({
    required this.index,
    required this.selectedIndex,
    required this.totalNumberOfDestinations,
    required this.selectedAnimation,
    required this.labelBehavior,
    required this.indicatorColor,
    required this.indicatorShape,
    required this.onTap,
    required this.overlayColor,
    required super.child,
  });

  final int index;
  final int selectedIndex;
  final int totalNumberOfDestinations;
  final Animation<double> selectedAnimation;
  final NavigationDestinationLabelBehavior labelBehavior;
  final Color? indicatorColor;
  final ShapeBorder? indicatorShape;
  final MaterialStateProperty<Color?>? overlayColor;
  final VoidCallback onTap;

  static _CaloNavigationDestinationInfo of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_CaloNavigationDestinationInfo>()!;

  @override
  bool updateShouldNotify(_CaloNavigationDestinationInfo oldWidget) =>
      index != oldWidget.index ||
      totalNumberOfDestinations != oldWidget.totalNumberOfDestinations ||
      selectedAnimation != oldWidget.selectedAnimation;
}

class CaloNavigationDestination extends StatelessWidget {
  const CaloNavigationDestination({
    super.key,
    required this.icon,
    this.selectedIcon,
    required this.label,
    required this.labelColor,
    required this.selectedLabelColor,
    this.tooltip,
    this.enabled = true,
  });

  final Widget icon;
  final Widget? selectedIcon;
  final String label;
  final Color labelColor;
  final Color selectedLabelColor;
  final String? tooltip;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    _CaloNavigationDestinationInfo info =
        _CaloNavigationDestinationInfo.of(context);
    const Set<MaterialState> selectedState = {MaterialState.selected};
    const Set<MaterialState> unselectedState = {};
    // ignore: duplicate_ignore
    // ignore: unused_local_variable
    const Set<MaterialState> disabledState = {MaterialState.disabled};

    final NavigationBarThemeData navigationBarTheme =
        NavigationBarTheme.of(context);
    final defaults = _getDefault(context);
    final Animation<double> animation = info.selectedAnimation;

    return _CaloNavigationDestinationBuilder(
      label: label,
      tooltip: tooltip,
      enabled: enabled,
      buildIcon: (context) => Stack(
        alignment: Alignment.center,
        children: [
          CaloNavigationIndicator(
            animation: animation,
            color: info.indicatorColor ??
                navigationBarTheme.indicatorColor ??
                defaults.indicatorColor,
          ),
          _CaloStatusTransitionWidgetBuilder(
            animation: animation,
            builder: (context, child) => _isForwardOrCompleted(animation)
                ? (selectedIcon ?? icon)
                : icon,
          )
        ],
      ),
      buildLabel: (context) {
        final TextStyle effectiveSelectedLabelTextStyle =
            TextStyle(color: selectedLabelColor, fontSize: 16);
        final TextStyle effectiveUnselectedLabelTextStyle =
            TextStyle(color: labelColor, fontSize: 16);
        final TextStyle effectiveDisabledLabelTextStyle =
            TextStyle(color: labelColor.withOpacity(0.5) , fontSize: 16);

        final TextStyle textStyle = enabled
            ? _isForwardOrCompleted(animation)
                ? effectiveSelectedLabelTextStyle
                : effectiveUnselectedLabelTextStyle
            : effectiveDisabledLabelTextStyle;

        return Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: MediaQuery.withClampedTextScaling(
            maxScaleFactor: 1.0,
            child: Text(label, style: textStyle),
          ),
        );
      },
    );
  }
}

class _CaloNavigationDestinationBuilder extends StatefulWidget {
  const _CaloNavigationDestinationBuilder({
    super.key,
    required this.buildIcon,
    required this.buildLabel,
    required this.label,
    this.tooltip,
    this.enabled = true,
  });

  final WidgetBuilder buildIcon;
  final WidgetBuilder buildLabel;
  final String label;
  final String? tooltip;
  final bool enabled;

  @override
  State<_CaloNavigationDestinationBuilder> createState() =>
      _CaloNavigationDestinationBuilderState();
}

class _CaloNavigationDestinationBuilderState
    extends State<_CaloNavigationDestinationBuilder> {
  final GlobalKey iconKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final _CaloNavigationDestinationInfo info =
        _CaloNavigationDestinationInfo.of(context);
    final NavigationBarThemeData navigationBarThemeData =
        NavigationBarTheme.of(context);
    final NavigationBarThemeData defaults = _getDefault(context);

    return _CaloNavigationBarDestinationSemantics(
      child: _CaloNavigationBarDestinationTooltip(
        message: widget.tooltip ?? widget.label,
        child: _CaloIndicatorInkWell(
          iconKey: iconKey,
          labelBehavior: info.labelBehavior,
          customBorder: info.indicatorShape ??
              navigationBarThemeData.indicatorShape ??
              defaults.indicatorShape,
          overlayColor: info.overlayColor ??
              navigationBarThemeData.overlayColor ??
              defaults.overlayColor,
          onTap: widget.enabled ? info.onTap : null,
          child: Row(
            children: [
              Expanded(
                child: _CaloNavigationBarDestinationLayout(
                  icon: widget.buildIcon(context),
                  iconKey: iconKey,
                  label: widget.buildLabel(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CaloNavigationIndicator extends StatelessWidget {
  const CaloNavigationIndicator({
    super.key,
    required this.animation,
    this.color,
    this.width = 45.0,
    this.height = 45.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(0.0)),
    this.shape,
  });

  final Animation<double> animation;
  final Color? color;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final double scale = animation.isDismissed
              ? 0.0
              : Tween<double>(begin: .4, end: 1.0).transform(
                  CurveTween(curve: Curves.easeInOutCubicEmphasized)
                      .transform(animation.value));

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.diagonal3Values(scale, 1.0, 1.0),
            child: child,
          );
        },
        child: _CaloStatusTransitionWidgetBuilder(
          animation: animation,
          builder: (context, child) => _SelectableAnimatedBuilder(
            isSelected: _isForwardOrCompleted(animation),
            duration: Duration.zero,
            alwaysDoFullAnimation: true,
            builder: (context, animation) => FadeTransition(
              opacity: animation,
            ),
          ),
        ),
      );
}

class _CaloStatusTransitionWidgetBuilder extends StatusTransitionWidget {
  const _CaloStatusTransitionWidgetBuilder({
    required super.animation,
    required this.builder,
    this.child,
  });

  final TransitionBuilder builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) => builder(context, child);
}

class _CaloNavigationBarDestinationSemantics extends StatelessWidget {
  const _CaloNavigationBarDestinationSemantics({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final _CaloNavigationDestinationInfo info =
        _CaloNavigationDestinationInfo.of(context);

    return _CaloStatusTransitionWidgetBuilder(
      animation: info.selectedAnimation,
      builder: (context, child) => Semantics(
        selected: _isForwardOrCompleted(info.selectedAnimation),
        container: true,
        child: child,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          Semantics(
            label: localizations.tabLabel(
              tabIndex: info.index + 1,
              tabCount: info.totalNumberOfDestinations,
            ),
          )
        ],
      ),
    );
  }
}

class _CaloNavigationBarDestinationTooltip extends StatelessWidget {
  const _CaloNavigationBarDestinationTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) => Tooltip(
        message: message,
        verticalOffset: 42.0,
        excludeFromSemantics: true,
        preferBelow: true,
        child: child,
      );
}

class _CaloIndicatorInkWell extends InkResponse {
  const _CaloIndicatorInkWell({
    required this.iconKey,
    required this.labelBehavior,
    super.overlayColor,
    super.customBorder,
    super.onTap,
    super.child,
  }) : super(
          containedInkWell: true,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        );

  final GlobalKey iconKey;
  final NavigationDestinationLabelBehavior labelBehavior;

  @override
  RectCallback? getRectCallback(RenderBox referenceBox) => () {
        final RenderBox iconBox =
            iconKey.currentContext!.findRenderObject()! as RenderBox;
        final Rect iconRect = iconBox.localToGlobal(Offset.zero) & iconBox.size;
        return referenceBox.globalToLocal(iconRect.topLeft) & iconBox.size;
      };
}

class _CaloNavigationBarDestinationLayout extends StatelessWidget {
  const _CaloNavigationBarDestinationLayout({
    super.key,
    required this.icon,
    required this.iconKey,
    required this.label,
  });

  final Widget icon;
  final GlobalKey iconKey;
  final Widget label;

  static final Key _labelKey = UniqueKey();

  @override
  Widget build(BuildContext context) => _CaloDestinationLayoutAnimationBuilder(
        builder: (context, animation) => CustomMultiChildLayout(
          delegate: _CaloNavigationDestinationLayoutDelegate(
            animation: animation,
          ),
          children: [
            LayoutId(
              id: _CaloNavigationDestinationLayoutDelegate.iconId,
              child: RepaintBoundary(
                key: iconKey,
                child: icon,
              ),
            ),
            LayoutId(
              id: _CaloNavigationDestinationLayoutDelegate.labelId,
              child: FadeTransition(
                alwaysIncludeSemantics: true,
                opacity: animation,
                child: RepaintBoundary(
                  key: _labelKey,
                  child: label,
                ),
              ),
            ),
          ],
        ),
      );
}

class _CaloDestinationLayoutAnimationBuilder extends StatelessWidget {
  const _CaloDestinationLayoutAnimationBuilder({required this.builder});

  final Widget Function(BuildContext context, Animation<double> animation)
      builder;

  @override
  Widget build(BuildContext context) {
    final _CaloNavigationDestinationInfo info =
        _CaloNavigationDestinationInfo.of(context);
    switch (info.labelBehavior) {
      case NavigationDestinationLabelBehavior.alwaysShow:
        return builder(context, kAlwaysCompleteAnimation);
      case NavigationDestinationLabelBehavior.alwaysHide:
        return builder(context, kAlwaysDismissedAnimation);
      case NavigationDestinationLabelBehavior.onlyShowSelected:
        return _CaloCurveAnimationBuilder(
          animation: info.selectedAnimation,
          curve: Curves.easeInOutCubicEmphasized,
          reverseCurve: Curves.easeInOutCubicEmphasized.flipped,
          builder: builder,
        );
    }
  }
}

class _CaloCurveAnimationBuilder extends StatefulWidget {
  const _CaloCurveAnimationBuilder({
    super.key,
    required this.animation,
    required this.curve,
    required this.reverseCurve,
    required this.builder,
  });

  final Animation<double> animation;
  final Curve curve;
  final Curve reverseCurve;
  final Widget Function(BuildContext context, Animation<double> animation)
      builder;

  @override
  State<_CaloCurveAnimationBuilder> createState() =>
      __CaloCurveAnimationBuilderState();
}

class __CaloCurveAnimationBuilderState
    extends State<_CaloCurveAnimationBuilder> {
  late AnimationStatus _animationDirection;
  AnimationStatus? _preservedDirection;

  @override
  void initState() {
    super.initState();
    _animationDirection = widget.animation.status;
    _updateStatus(widget.animation.status);
    widget.animation.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    widget.animation.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (_animationDirection != status) {
      setState(() {
        _animationDirection = status;
      });
    }

    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() {
        _preservedDirection = null;
      });
    }

    if (_preservedDirection == null &&
        (status == AnimationStatus.forward ||
            status == AnimationStatus.reverse)) {
      setState(() {
        _preservedDirection = status;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool shouldUseForwardCurve =
        (_preservedDirection ?? _animationDirection) != AnimationStatus.reverse;

    final Animation<double> curvedAnimation = CurveTween(
      curve: shouldUseForwardCurve ? widget.curve : widget.reverseCurve,
    ).animate(widget.animation);

    return widget.builder(context, curvedAnimation);
  }
}

class _CaloNavigationDestinationLayoutDelegate
    extends MultiChildLayoutDelegate {
  _CaloNavigationDestinationLayoutDelegate({required this.animation})
      : super(relayout: animation);

  final Animation<double> animation;

  static const int iconId = 1;
  static const int labelId = 2;

  @override
  void performLayout(Size size) {
    double halfWidth(Size size) => size.width / 2;
    double halfHeight(Size size) => size.height / 2;

    final Size iconSize = layoutChild(iconId, BoxConstraints.loose(size));
    final Size labelSize = layoutChild(labelId, BoxConstraints.loose(size));

    final double yPositionOffset = Tween<double>(
      begin: halfHeight(iconSize),
      end: halfHeight(iconSize) + halfHeight(labelSize),
    ).transform(animation.value);
    final double iconYPosition = halfHeight(size) - yPositionOffset;

    positionChild(
      iconId,
      Offset(
        halfWidth(size) - halfWidth(iconSize),
        iconYPosition,
      ),
    );

    positionChild(
      labelId,
      Offset(
        halfWidth(size) - halfWidth(labelSize),
        iconYPosition + iconSize.height,
      ),
    );
  }

  @override
  bool shouldRelayout(_CaloNavigationDestinationLayoutDelegate oldDelegate) =>
      oldDelegate.animation != animation;
}
