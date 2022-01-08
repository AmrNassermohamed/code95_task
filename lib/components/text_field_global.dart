import 'package:code95_task/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextFieldGlobal extends StatelessWidget {
  TextFieldGlobal(
      {required this.type,
      Key? key,
      required this.controller,
      required this.hint})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  int type = 0;

  late FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      keyboardType: type == 1 ? TextInputType.text : TextInputType.number,
      style: GoogleFonts.outfit(
          fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      focusNode: myFocusNode,
      cursorColor: Colors.white,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        filled: true,

        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        fillColor: Colors.white,
        hintStyle: GoogleFonts.cairo(
            fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGrey300, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(color: AppColor.lightGrey300, width: 1.0),
        ),

        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGrey300, width: 0.0),
        ),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hoverColor: AppColor.white,
        //fillColor: Colors.white,
        labelText: hint,
        labelStyle: GoogleFonts.outfit(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            ),

        focusColor: AppColor.white,
        //hintText: hint,
      ),
    );
  }
}
