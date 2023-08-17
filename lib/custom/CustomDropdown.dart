import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key, this.height, this.width, this.child}) : super(key: key);
  final double? height;
  final double? width;
  final Widget? child;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? 50.h,
        padding: EdgeInsets.only(left: kIsWeb ? 5.w : 20.w,),
        decoration: BoxDecoration(
          color: Utils.getColor(ColorCode.grey_white),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: DropdownButtonHideUnderline(child: Center(child: widget.child!))
    );
  }
}
