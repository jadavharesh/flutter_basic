
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({Key? key,this.onTextChange, required this.controller, this.maxlenth,this.maxLine, this.textInputType, this.textInputAction, required this.hint, this.icons, this.passwordField, this.height, this.width, this.textsize, this.enabled});
  final Function? onTextChange;
  final TextEditingController controller;
  final int? maxlenth;
  final int? maxLine;
  final double? textsize;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String hint;
  final IconData? icons;
  final bool? passwordField;
  final double? height;
  final double? width;
  final bool? enabled;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? 50.h,
      padding: const EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
        color: Utils.getColor(ColorCode.grey_white),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.textInputType ?? TextInputType.text,
        inputFormatters: widget.textInputType != null ? widget.textInputType == TextInputType.number ? [FilteringTextInputFormatter.digitsOnly] : [] : [],
        maxLines: widget.maxLine ?? 1,
        maxLength: widget.maxlenth ?? 200,
        obscureText: widget.passwordField == null ? false : isPassword,
        enabled: widget.enabled ?? true,
        onChanged: (value)
        {
          if(widget.onTextChange!=null)
          {
            widget.onTextChange!(value);
          }
        },
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        style: TextStyle(color: Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: widget.textsize ?? 15.sp,fontFamily: 'Gilroy_semi_bold'),
        decoration:widget.icons==null ? InputDecoration(
          border: InputBorder.none,
          //hintText: widget.hint,
          labelText: widget.hint,
          counterText: "",
          hintStyle:TextStyle(color: Utils.getColor(ColorCode.hint_text),decoration: TextDecoration.none,fontSize: widget.textsize ?? 15.sp,fontFamily: 'Gilroy_semi_bold'),
        ) : InputDecoration(
          border: InputBorder.none,
          //hintText: widget.hint,
          labelText: widget.hint,
          counterText: "",
          //suffixIcon: widget.icons==null ? const SizedBox() : Icon(widget.icons,size: 25,color: Utils.getColor(ColorCode.hint_text)),
          suffixIcon: InkWell(onTap: (){
            setState(() {
              isPassword ? isPassword = false : isPassword = true;
            });
          },child: widget.icons==null ? const SizedBox() : widget.passwordField == null ? Icon(widget.icons,size: 25,color: Utils.getColor(ColorCode.hint_text)) : isPassword ? Icon(Icons.visibility_off,size: 25,color: Utils.getColor(ColorCode.hint_text)) : Icon(Icons.visibility,size: 25,color: Utils.getColor(ColorCode.hint_text))),
          hintStyle:TextStyle(color: Utils.getColor(ColorCode.hint_text),decoration: TextDecoration.none,fontSize: widget.textsize ?? 15.sp,fontFamily: 'Gilroy_semi_bold'),
        ),
      ),
    );
  }
}
