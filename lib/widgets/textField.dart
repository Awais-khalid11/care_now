import 'package:CareNow/helpers/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final String? suffixText;
  final String? label;
  final bool? isPasswordField;
  final TextStyle? textStyle;
  final Function(String? value)? onChange;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefix;
  final int? limit;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool? readOnly;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final String? text;
  final Color? counterColor;
  final bool? showCounter;
  final bool? showBorder;
  final bool? isDense;
  final Key? key;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? margin;
  final String? Function(String?)? validator;
  final Future<String?> Function(String?)? asyncValidator;
  final Widget? suffix;
  Widget? prefixIcon;
  Color? color;

  final _state = _CustomTextFieldState();

  @override
  _CustomTextFieldState createState() {
    return _state;
  }

  Future<void> validate() async {
    if (asyncValidator != null) {
      await _state.validate();
    }
  }

  CustomTextField({
    this.hint,
    this.suffixText,
    this.label,
    this.isPasswordField,
    this.textStyle,
    this.onChange,
    this.keyboardType,
    this.onFieldSubmitted,
    this.prefix,
    this.limit,
    this.controller,
    this.onTap,
    this.readOnly,
    this.fillColor,
    this.maxLines,
    this.minLines,
    this.text,
    this.counterColor,
    this.showCounter,
    this.showBorder,
    this.isDense,
    this.key,
    this.focusNode,
    this.margin,
    this.validator,
    this.asyncValidator,
    this.suffix,
    this.prefixIcon,
    this.color,
  });
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isHidden;
  String text = "";
  bool isPasswordField = false;

  @override
  void initState() {
    _isHidden = isPasswordField;
    errorMessage = null;
    if (widget.validator != null && widget.asyncValidator != null) {
      throw "validator and asyncValidator are not allowed at same time";
    }

    if (widget.controller != null && widget.text != null) {
      widget.controller!.text = widget.text!;
    }

    super.initState();
  }

  var isValidating = false;
  var isValid = false;
  var isDirty = false;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40.sp,
      decoration: BoxDecoration(
          color: MyColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: MyColor.blackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 15,
                offset: Offset(-1, 2)
            )
          ]),
      child: TextFormField(

        controller: widget.controller,
        onChanged: widget.asyncValidator == null
            ? widget.onChange
            : (value) {
          text = value.toString();
          validateValue(text);
          if (widget.onChange != null) {
            widget.onChange!(text);
          }
        },
        validator: widget.validator ??
            (widget.asyncValidator != null
                ? (value) {
              text = value.toString();
              return errorMessage;
            }
                : null),
        maxLength: widget.limit,
        keyboardType: widget.keyboardType,

        decoration: InputDecoration(
          suffixIcon: widget.suffix,
          suffixText: widget.suffixText,
          prefixIcon: widget.prefixIcon,
          counter: null,


          contentPadding:
              EdgeInsets.symmetric(vertical: 12.sp, horizontal: 8.sp),
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontFamily: 'PoppinsRegular',
            fontSize: 12.sp,
            color: widget.color??MyColor.blackColor
          ),
          filled: true,
          fillColor: MyColor.whiteColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
  Widget _getSuffixIcon() {
    if (isValidating) {
      return Transform.scale(scale: 0.7, child: CupertinoActivityIndicator());
    } else {
      if (!isValid && isDirty) {
        return Icon(
          Icons.cancel,
          color: Colors.red,
          size: 20,
        );
      } else if (isValid) {
        return Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 20,
        );
      } else {
        return SizedBox(
          height: 1,
          width: 1,
        );
      }
    }
  }
  Future<void> validateValue(String newValue) async {
    isDirty = true;
    if (text.isEmpty) {
      if (mounted) {
        setState(() {
          isValid = false;
        });
      }
      return;
    }
    isValidating = true;
    if (mounted) {
      setState(() {});
    }
    errorMessage = await widget.asyncValidator!(newValue);
    isValidating = false;
    isValid = errorMessage == null;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> validate() async {
    await validateValue(text);
  }
}
