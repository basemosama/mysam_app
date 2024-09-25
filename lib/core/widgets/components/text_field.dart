// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/dimens/dimens.dart';
import 'package:mysam_app/core/resources/style/style.dart';
import 'package:mysam_app/core/resources/translation/app_locale_config.dart';
import 'package:playx/playx.dart';

/// This is a custom text field to have same behavior on whole application.
/// With ability to auto validate it's field and easily customize it.
class CustomTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextInputType? type;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final IconData? eIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? icon;
  final FocusNode? focus;
  final FocusNode? nextFocus;
  final bool read;
  final Function? edit;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final bool obscureText;
  final Color? fillColor;
  final bool autofocus;
  final GlobalKey<FormState>? formKey;
  final bool shouldAutoValidate;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final int? errorMaxLines;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final void Function(bool isValid)? onValidationChanged;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final EdgeInsets? scrollPadding;

  final Iterable<String>? autoFillHints;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final BorderRadius? borderRadius;
  final double? borderWidth;
  final void Function(String?)? onSubmitted;
  final Duration? debounceDuration;
  final bool debounceValidation;

  const CustomTextField({
    this.hint,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintStyle,
    this.onChanged,
    this.onTap,
    this.icon,
    this.type,
    this.validator,
    this.controller,
    this.focus,
    this.nextFocus,
    this.prefix,
    this.suffix,
    this.label,
    this.read = false,
    this.obscureText = false,
    this.enabled = true,
    this.eIcon,
    this.edit,
    this.fillColor,
    this.autofocus = false,
    this.shouldAutoValidate = false,
    this.padding,
    this.margin,
    this.errorMaxLines = 1,
    this.textColor,
    this.hintColor,
    this.labelColor,
    this.borderColor,
    this.focusedBorderColor,
    this.formKey,
    this.onValidationChanged,
    this.textInputAction = TextInputAction.done,
    this.prefixIcon,
    this.suffixIcon,
    this.scrollPadding,
    this.autoFillHints,
    this.contentPadding,
    this.borderRadius,
    this.borderWidth,
    this.onSubmitted,
    this.debounceDuration,
    this.debounceValidation = false,
  });

  @override
  State<StatefulWidget> createState() {
    return _CustomFieldState();
  }
}

class _CustomFieldState extends State<CustomTextField> {
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OptimizedTextField(
      hint: widget.hint?.tr(context: context),
      hintStyle: widget.hintStyle,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      onChanged: (value) {
        if (widget.debounceDuration != null) {
          if (_debounceTimer?.isActive ?? false) {
            _debounceTimer?.cancel();
          }
          _debounceTimer = Timer(widget.debounceDuration!, () {
            widget.onChanged?.call(value);
          });
        } else {
          widget.onChanged?.call(value);
        }
      },
      onTap: widget.onTap,
      icon: widget.icon,
      type: widget.type,
      validator: widget.validator,
      controller: widget.controller,
      focus: widget.focus,
      nextFocus: widget.nextFocus,
      scrollPadding: widget.scrollPadding,
      autoFillHints: widget.autoFillHints,
      onSubmitted: widget.onSubmitted,
      prefix: widget.prefixIcon != null
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Icon(
                widget.prefixIcon,
                // color: context.colors.secondary,
                size: 20.r,
              ),
            )
          : widget.prefix,
      suffix: widget.suffixIcon != null
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Icon(
                widget.suffixIcon,
                // color: context.colors.secondary,
                size: 20.r,
              ),
            )
          : widget.suffix,
      label: widget.label?.tr(context: context),
      read: widget.read,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      eIcon: widget.eIcon,
      edit: widget.edit,
      fillColor: widget.fillColor,
      autofocus: widget.autofocus,
      shouldAutoValidate: widget.shouldAutoValidate,
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: 8.h),
      margin: widget.margin,
      errorMaxLines: widget.errorMaxLines,
      textColor: widget.textColor,
      labelColor: widget.labelColor ?? context.colors.onSurface,
      borderColor: widget.borderColor,
      focusedBorderColor: widget.focusedBorderColor,
      formKey: widget.formKey,
      onValidationChanged: (isValid) {
        if (widget.onValidationChanged != null) {
          if (widget.debounceValidation && widget.debounceDuration != null) {
            if (_debounceTimer?.isActive ?? false) {
              _debounceTimer?.cancel();
            }
            _debounceTimer = Timer(widget.debounceDuration!, () {
              widget.onValidationChanged?.call(isValid);
            });
          } else {
            widget.onValidationChanged?.call(isValid);
          }
        }
      },
      textInputAction: widget.textInputAction,
      style: TextStyle(
        fontSize: Dimens.fieldTextSize,
        color: widget.textColor ?? context.colors.onSurface,
        fontFamily: fontFamily,
      ),
      labelStyle: TextStyle(
        color: widget.labelColor ?? context.colors.onSurface,
        fontSize: Dimens.fieldTextSize,
        fontFamily: fontFamily,
      ),
      contentPadding: widget.contentPadding ??
          EdgeInsets.only(
            top: 15.0.r,
            bottom: 15.0.r,
            right: 15.0.r,
            left: 15.0.r,
          ),
      hintColor: widget.hintColor ?? PlayxColors.grey,
      enabledBorder: OutlineInputBorder(
        borderRadius: widget.borderRadius ?? Style.fieldBorderRadius,
        borderSide: BorderSide(
          color: widget.borderColor ?? PlayxColors.grey,
          width: widget.borderWidth ?? 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: widget.focusedBorderColor ?? PlayxColors.grey,
          width: widget.borderWidth ?? 1,
        ),
        borderRadius: widget.borderRadius ?? Style.fieldBorderRadius,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: widget.borderColor ?? PlayxColors.grey,
          width: widget.borderWidth ?? 1,
        ),
        borderRadius: widget.borderRadius ?? Style.fieldBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Colors.red, width: widget.borderWidth ?? 1),
        borderRadius: widget.borderRadius ?? Style.fieldBorderRadius,
      ),
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
