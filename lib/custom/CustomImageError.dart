import 'package:flutter/material.dart';


class CustomImageError extends StatefulWidget {
  const CustomImageError({Key? key}) : super(key: key);

  @override
  State<CustomImageError> createState() => _CustomImageErrorState();
}

class _CustomImageErrorState extends State<CustomImageError> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(child: Image.asset('assets/image/no_image.png',fit: BoxFit.fill));
  }
}