
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomImageButton extends StatefulWidget {
  const CustomImageButton({Key? key, required this.onClick, required this.image, required this.height, required this.width}) : super(key: key);
  final Function onClick;
  final String image;
  final double height;
  final double width;

  @override
  State<CustomImageButton> createState() => _CustomImageButtonState();
}

class _CustomImageButtonState extends State<CustomImageButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child:Padding(
          padding: EdgeInsets.all(2.h),
          child: Image.asset(widget.image,fit: BoxFit.fill,height: widget.height,width: widget.width,)
        ),
        onTap: ()
        {
          widget.onClick();
        },
      ),
    );
  }
}
