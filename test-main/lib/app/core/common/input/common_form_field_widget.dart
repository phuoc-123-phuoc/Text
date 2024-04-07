import 'package:flutter/material.dart';
import 'package:mobile_test/app/utils/color_resources.dart';

class CommonFormFieldWidget extends StatelessWidget {
  CommonFormFieldWidget({
    Key? key,
    this.focusNode,
    this.icon,
    this.errorText = "",
    this.labelText,
    this.controllerEditting,
    required this.setValueFunc,
    this.textInputType = TextInputType.text,
    this.isObscureText = false,
    this.isEnabled = true,
    this.initValue,
    this.padding = 10,
    this.suffixIcon,
    this.enableInteractiveSelection = true,
    this.styleInput = const TextStyle(color: Colors.black),
    this.radiusBorder = 10,
    this.onEditingComplete,
  }) : super(key: key);

  final FocusNode? focusNode;
  final Icon? icon;
  final Widget? suffixIcon;
  String? errorText;
  final String? labelText;
  final TextEditingController? controllerEditting;
  final VoidCallback? onEditingComplete;
  final Function setValueFunc;
  final TextInputType textInputType;
  final bool isObscureText;
  final bool? isEnabled;
  final String? initValue;
  final double? padding;
  final bool? enableInteractiveSelection;
  final TextStyle? styleInput;
  final double? radiusBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: ColorResources.f7F7F7, // Đặt màu nền xám
        borderRadius: BorderRadius.circular(radiusBorder!),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: TextFormField(
          style: styleInput,
          enableInteractiveSelection: enableInteractiveSelection!,
          initialValue: initValue,
          enabled: isEnabled!,
          obscureText: isObscureText,
          focusNode: focusNode,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: padding!, vertical: 12),
            errorText: errorText != "" ? errorText : null,
            border: InputBorder.none, // Loại bỏ viền của TextFormField
            hintText: labelText,
            prefixIcon: icon,
            suffixIcon: suffixIcon,
          ),
          textAlign: TextAlign.justify,
          maxLines: 1,
          keyboardType: textInputType,
          controller: controllerEditting,
          onChanged: (value) {
            setValueFunc(value);
          },
        ),
      ),
    );
  }
}
