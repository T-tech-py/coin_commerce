import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';

enum TextFieldType {
  password,
  plainText,
  search,
}

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.suffix,
    this.prefixIcon,
    this.textInputType,
    this.focusNode,
    this.fillColor,
    this.borderRadius,
    this.suffixIcon,
    this.maxLines = 1,
    this.textFieldType = TextFieldType.plainText,
    this.readOnly = false,
    this.inputFormatters,
    this.onTap,
    this.enable,
    this.hitTextCollor,
    this.maxLength,
    this.onEditingComplete,
    this.heading, this.border,
  }) : super(key: key);
  final TextFieldType textFieldType;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? heading;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? hitTextCollor;
  final BorderRadius? borderRadius;
  final int maxLines;
  final int? maxLength;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final bool? enable;
  final InputBorder? border;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    InputBorder border = OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
      borderSide:  const BorderSide(color: AppColor.grey300,
      width: 1),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.heading != null)
          Text(widget.heading??'',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.grey2,

            ),),
        const SizedBox(height: 5,),
        Container(
          // decoration:  BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       color: AppColor.grey500.withOpacity(0.1),
          //       blurRadius: 10,
          //     )
          //   ]
          // ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            autocorrect: false,
            enabled: widget.enable,
            onTap: widget.onTap,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            onEditingComplete: widget.onEditingComplete,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColor.textFieldTextColor

            ),
            readOnly: widget.readOnly,
            textCapitalization: widget.textCapitalization,
            keyboardType: widget.textInputType,
            obscureText:
            // ignore: avoid_bool_literals_in_conditional_expressions
            widget.textFieldType == TextFieldType.password ? _hideText : false,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: theme.textTheme.bodyMedium!.copyWith(
                color: widget.hitTextCollor??AppColor.grey4,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              labelText: widget.labelText,
              border: widget.border??border,
              focusedBorder:widget.border?? border,
              enabledBorder:widget.border?? border,
              filled: true,
              fillColor: widget.fillColor??AppColor.white,
              floatingLabelStyle:theme.textTheme.labelSmall!.copyWith(
                  color: AppColor.primaryTextColor),
              labelStyle: theme.textTheme.bodySmall!.copyWith(
                //color: AppColors.greyA3,
                fontSize: 12,
                // fontSize: 13.fontSize,
              ),

              suffix: widget.suffix,
             // prefix: widget.prefixIcon,
              suffixIcon: _suffix,
              prefixIcon: _preffix,
            ),
            validator: widget.validator,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }

  Widget? get _suffix {
    if (widget.textFieldType == TextFieldType.password) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            _hideText = !_hideText;
          });
        },
        child: _hideText
            ? const Icon(
          Icons.visibility_off,
          color: AppColor.textColor,
        )
            : const Icon(
          Icons.visibility,
          color: AppColor.textColor,
        ),
      );
    }
    return widget.suffixIcon;
  }
  Widget? get _preffix {
    if(widget.textFieldType ==  TextFieldType.search){
      return const Icon(CupertinoIcons.search,color: AppColor.grey3,);
    }
    return widget.prefixIcon;
  }
}

