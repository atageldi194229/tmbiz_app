// ignore_for_file: lines_longer_than_80_chars

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// App card
class AppCard extends StatelessWidget {
  /// Constructor
  const AppCard({
    required this.child,
    this.onPressed,
    this.borderRadius,
    this.color,
    this.padding,
    this.hasBorder = true,
    super.key,
  });

  /// On card pressed
  final VoidCallback? onPressed;

  /// Card child
  final Widget child;

  /// Card border radius
  final BorderRadius? borderRadius;

  /// Card color
  final Color? color;

  /// Card padding
  final EdgeInsets? padding;

  /// Border indicator defautl is `true`
  final bool hasBorder;

  static final _defaultBorderRadius = BorderRadius.circular(AppSpacing.sm);
  // static final _defaultColor = Colors.blueGrey[50];
  static const _defaultColor = AppColors.container;
  static const _defaultBorderColor = AppColors.border;
  static const _defaultPadding = EdgeInsets.all(20);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? _defaultBorderRadius;
    final color = this.color ?? _defaultColor;
    final padding = this.padding ?? _defaultPadding;

    return Material(
      shape: RoundedRectangleBorder(
        side: hasBorder ? const BorderSide(color: _defaultBorderColor) : BorderSide.none,
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.hardEdge,
      color: color,
      child: InkWell(
        splashColor: AppColors.primary.shade100,
        onTap: onPressed,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
