import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PdfModel{

  final String dueDate;
  final String invoiceDate;
  final String billByOrginazi;
  final String billByEmail;
  final String billByAddress;
  final String billByPhoneNumber;

  final String billedToOrganization;
  final String billedToEmail;
  final String billedToAddress;
  final String billedToPhoneNumber;

  final String serialNumber;
  final String itemName;
  final String quantity;
  final String price;


  final String totalExTax;
  final String  discount;
  final String  tax;
  final String  subTotalIncTax;
  
  final String description;
  final String termsCondition;
  PdfModel(
  {
    required this.dueDate,
    required this.invoiceDate,
    required this.billByOrginazi,
    required this.billByEmail,
    required this.billByPhoneNumber,
    required this.billByAddress,
    required this.billedToOrganization,
    required this.billedToEmail,
    required this.billedToPhoneNumber,
    required this.billedToAddress,
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.serialNumber,
    required this.totalExTax,
    required this.subTotalIncTax,
    required this.tax,
    required this.discount,
    required this.description,
    required this.termsCondition,
});
}