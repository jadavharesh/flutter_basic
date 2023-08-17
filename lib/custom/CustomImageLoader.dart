import 'package:flutter/material.dart';


class CustomImageLoader extends StatefulWidget {
  const CustomImageLoader({Key? key}) : super(key: key);

  @override
  State<CustomImageLoader> createState() => _CustomImageLoaderState();
}

class _CustomImageLoaderState extends State<CustomImageLoader> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(child: Image.asset('assets/image/loading.png',fit: BoxFit.fill));
  }
}

