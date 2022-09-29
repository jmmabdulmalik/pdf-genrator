import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signature/signature.dart';

class AppTextEditingControlers{
 static TextEditingController billByEmail=TextEditingController();
 static TextEditingController billByPhone=TextEditingController();
 static TextEditingController billByAdress=TextEditingController();
 static TextEditingController billByOrginazition=TextEditingController();
 static TextEditingController billToEmail=TextEditingController();
 static TextEditingController billToPhone=TextEditingController();
 static TextEditingController billToAdress=TextEditingController();
 static TextEditingController billToOrginnization=TextEditingController();
 static TextEditingController termsCondition=TextEditingController();
 static TextEditingController description=TextEditingController();
 static TextEditingController itemNomber=TextEditingController();
 static TextEditingController itemName=TextEditingController();
 static TextEditingController itemPrice=TextEditingController();
 static TextEditingController itemQuantity=TextEditingController();
  static final signatureController = SignatureController(penStrokeWidth: 2, penColor: Colors.black);
}