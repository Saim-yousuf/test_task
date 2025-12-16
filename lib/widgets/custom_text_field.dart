import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:walletric/config/colors.dart';
import 'package:walletric/config/spacing.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final Widget? label;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? cursorTextStyle;
  final double? cursorHeight;
  final Color? cursorColor;
  final double? width;
  final double? height;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;
  final bool? filled;
  final bool autoFocus;
  final Color? fillColor;
  final bool? isDense;
  final bool isCollapsed;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final double outlineBorderRadius;
  final TextStyle? hintTextStyle;
  final bool isOutlinedInputBorder;
  final bool isunderlinedInputBorder;
  final bool obscureText;
  final bool readOnly;
  final String obscuringCharacter;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final FloatingLabelAlignment? floatingLabelAlignment;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? alignLabelWithHint;

  final bool isCaption;
  final String? captionText;
  final TextStyle? captionTextStyle;
  // 🔹 New
  final bool isPasswordField;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  const CustomTextField({
    super.key,
    this.controller,
    this.height,
    this.maxLines = 1,
    this.hintText,
    this.labelText,
    this.label,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.prefix,
    this.suffix,
    this.width,
    this.cursorTextStyle,
    this.cursorHeight,
    this.cursorColor = Colors.grey,
    this.padding = const EdgeInsets.all(6),
    this.filled = false,
    this.fillColor,
    this.autoFocus = false,
    this.isDense = true,
    this.isCollapsed = false,
    this.hintTextStyle,
    this.enabledBorder = const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    this.focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    this.enabledBorderColor = Palette.grey,
    this.focusedBorderColor = Palette.greyBlue,
    this.outlineBorderRadius = 8,
    this.isOutlinedInputBorder = false,
    this.isunderlinedInputBorder = false,
    this.validator,
    this.onChanged,
    this.onTap,
    this.borderWidth = 1.0,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.floatingLabelAlignment,
    this.floatingLabelBehavior,
    this.alignLabelWithHint,
    this.isCaption = false,
    this.captionText,
    this.captionTextStyle,
    this.isPasswordField = false, // 🔹 default false
    this.inputFormatters,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPasswordField ? true : widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isCaption && widget.captionText != null) ...[
            Text(
              widget.captionText!,
              style: widget.captionTextStyle ??
                  TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            5.kH,
          ],
          TextFormField(
            focusNode: widget.focusNode,
            textAlign: TextAlign.start,
            inputFormatters: widget.inputFormatters,
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            obscureText: _obscure,
            obscuringCharacter: widget.obscuringCharacter,
            maxLines: widget.maxLines,
            autofocus: widget.autoFocus,
            cursorColor: widget.cursorColor,
            style: widget.cursorTextStyle ??
                const TextStyle(
                  fontSize: 16,
                  color: Palette.backLight,
                ),
            cursorHeight: widget.cursorHeight,
            validator: widget.validator,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            decoration: InputDecoration(
              contentPadding: widget.padding,
              filled: widget.filled,
              fillColor: widget.fillColor,
              enabledBorder: widget.isOutlinedInputBorder
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.enabledBorderColor!,
                        width: widget.borderWidth,
                      ),
                      borderRadius:
                          BorderRadius.circular(widget.outlineBorderRadius),
                    )
                  : widget.isunderlinedInputBorder
                      ? UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: widget.enabledBorderColor!,
                            width: widget.borderWidth,
                          ),
                        )
                      : widget.enabledBorder,
              focusedBorder: widget.isOutlinedInputBorder
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.focusedBorderColor!,
                        width: widget.borderWidth,
                      ),
                      borderRadius:
                          BorderRadius.circular(widget.outlineBorderRadius),
                    )
                  : widget.isunderlinedInputBorder
                      ? UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: widget.focusedBorderColor!,
                            width: widget.borderWidth,
                          ),
                        )
                      : widget.focusedBorder,
              isDense: widget.isDense,
              isCollapsed: widget.isCollapsed,
              prefixIcon: widget.prefix,
              suffixIcon: widget.isPasswordField
                  ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    )
                  : (widget.suffix != null
                      ? widget.suffix!
                      : const SizedBox(
                          height: 40,
                          width: 0,
                        )),
              suffixIconConstraints: widget.suffix == null
                  ? const BoxConstraints(
                      minWidth: 0,
                      minHeight: 45,
                    )
                  : null,

              // suffixIcon: widget.isPasswordField
              //     ? IconButton(
              //         icon: Icon(
              //           _obscure ? Icons.visibility_off : Icons.visibility,
              //           color: Colors.grey,
              //         ),
              //         onPressed: () {
              //           setState(() {
              //             _obscure = !_obscure;
              //           });
              //         },
              //       )
              //     : (widget.suffix ??
              //         const SizedBox(
              //           width: 0,
              //           height: 0,
              //         )),
              // suffixIconConstraints: const BoxConstraints(
              //   minWidth: 40,
              //   minHeight: 40,
              //   maxWidth: 40,
              //   maxHeight: 40,
              // ),

              hintText: widget.hintText,
              hintStyle: widget.hintTextStyle ??
                  TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade400,
                  ),
              labelText: widget.labelText,
              label: widget.label,
              floatingLabelAlignment: widget.floatingLabelAlignment,
              floatingLabelBehavior: widget.floatingLabelBehavior,
              alignLabelWithHint: widget.alignLabelWithHint,
              // errorStyle: const TextStyle(
              //   fontSize: 14,
              //   color: Colors.red,
              // ),
              errorMaxLines: 1,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(widget.outlineBorderRadius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(widget.outlineBorderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
