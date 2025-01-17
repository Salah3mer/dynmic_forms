import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  Color? color;
  Function()? onTap;
  Function()? onComplet;
  Function(String val)? onCahange;
  Function(String? val)? onSave;
  Function(String val)? onSubmit;
  String? Function(String? val)? validator;
  TextInputType? textInputType;
  TextEditingController? controller;
  String label;
  bool? haveBorder;
  bool readOnly;
  bool? isObScure;
  Widget? suffixIconbutton;
  Icon? prefixIcon;
  int? maxLine;
  double? contantPadding;
  bool? haveShadow;
  CustomTextFormFeild(
      {super.key,
      this.textInputType,
      this.maxLine,
      this.isObScure,
      this.suffixIconbutton,
      this.prefixIcon,
      this.onTap,
      this.onCahange,
      this.onComplet,
      this.controller,
      this.onSave,
      this.onSubmit,
      this.validator,
      this.readOnly = false,
      this.haveShadow = true,
      required this.label,
      this.contantPadding,
      this.haveBorder = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // boxShadow: haveShadow!
        //     ? [
        //         const BoxShadow(
        //           color: Colors.black12,
        //           blurRadius: 5,
        //         ),
        //       ]
        //     : null,
      ),
      child: TextFormField(
          maxLines: maxLine ?? 1,
          controller: controller,
          onTap: onTap,
          onChanged: onCahange,
          onEditingComplete: onComplet,
          onFieldSubmitted: onSubmit,
          onSaved: onSave,
          validator: validator,
          keyboardType: textInputType,
          obscureText: isObScure ?? false,
          readOnly: readOnly,
          style: const TextStyle(color: Color(0xfff8f8ff)),
          decoration: InputDecoration(
            prefixIconColor: Colors.indigo,
            suffixIconColor: Colors.indigo,
            prefixIcon: prefixIcon,
            hintText: label,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 132, 140, 155)),
            suffixIcon: suffixIconbutton,
            fillColor: color ?? const Color(0xff2e384e),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: haveBorder!
                    ? const BorderSide(
                        width: 1,
                        color: Color(0xff2e384e),
                      )
                    : BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: haveBorder!
                    ? const BorderSide(
                        width: 1,
                        color: Color(0xff2e384e),
                      )
                    : BorderSide.none),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: haveBorder!
                    ? const BorderSide(
                        width: 1,
                        color: Color(0xff2e384e),
                      )
                    : BorderSide.none),
          )),
    );
  }
}
