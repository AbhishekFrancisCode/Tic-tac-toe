import 'package:flutter/material.dart';

get textButtonStyle => ButtonStyle(
    elevation: MaterialStateProperty.all<double>(0.0),
    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(10))),
    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent));

extension CustomButtonStyle on ButtonStyle {
  get mediumSize => copyWith(
      minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(100)));
}

extension CutstomTextStyle on TextStyle {
  get mediumSize => copyWith(fontSize: 18);

  get boldText => copyWith(fontWeight: FontWeight.bold);
}
