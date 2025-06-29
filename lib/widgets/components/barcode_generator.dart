import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarcodeWidget extends StatelessWidget {
  final String data;

  const BarcodeWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final svg = Barcode.code128().toSvg(
      data,
      width: media.width - 60,
      height: 105,
      drawText: true,
    );

    return SvgPicture.string(svg);
  }
}
