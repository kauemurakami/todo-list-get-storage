import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/core/values/colors.dart';

class CustomTextFormFieldGlass extends StatelessWidget {
  final Function(String value) onSaved;
  final Function(String value) onChanged;
  final Function(String value) validator;
  final bool emailCheck;
  final String text;
  final Widget sufixIcon;
  final Widget prefixIcon;
  final TextInputAction action;
  final TextInputType type;
  final bool obscure;
  final TextEditingController controller;
  final TextDirection direction;
  final int max;
  final formatter;
  final int maxLines;
  final String initialValue;
  final String hintText;

  CustomTextFormFieldGlass(
      {this.maxLines = 1,
      this.initialValue,
      this.emailCheck,
      this.text,
      this.formatter = const <TextInputFormatter>[],
      this.onChanged,
      this.onSaved,
      this.validator,
      this.sufixIcon,
      this.action,
      this.type,
      this.obscure = false,
      this.controller,
      this.direction = TextDirection.ltr,
      this.max,
      this.prefixIcon,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: this.formatter,
      maxLines: this.maxLines,
      initialValue: this.initialValue,
      maxLength: this.max,
      textDirection: this.direction,
      controller: this.controller,
      obscureText: this.obscure,
      style: TextStyle(fontSize: 16, color: Colors.white),
      keyboardType: this.type,
      cursorColor: neruColor2,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          fillColor: Colors.white,
          hintText: this.hintText,
          hintStyle: TextStyle(color: Colors.white),
          //contentPadding: EdgeInsets.only(top: 5),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          labelText: this.text,
          suffixIcon: this.sufixIcon,
          prefixIcon: this.prefixIcon),
      onChanged: (value) => this.onChanged(value),
      onSaved: (value) => this.onSaved(value),
      validator: (value) => this.validator(value),
      textInputAction: this.action,
    );
  }
}
