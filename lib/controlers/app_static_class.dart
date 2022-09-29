import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pdfgenrate/models/pdfmodel.dart';
import 'package:signature/signature.dart';

class AppStaticPropertys  {


  static GlobalKey<FormState> formKey=  GlobalKey<FormState>();


  static pw.Widget billBybillTo(
      {required String text1,
      required String text2,
      required PdfColor color,
      required double size}) {
    return pw.Container(
      margin: pw.EdgeInsets.only(left: 70),
      child: pw.Row(children: [
        pw.Expanded(
          flex: 1,
          child: pw.Text(
            '$text1',
            style: pw.TextStyle(
              color: color,
              fontSize: size,
            ),
          ),
        ),
        pw.Expanded(
          child: pw.Text(
            '$text2',
            style: pw.TextStyle(
              color: color,
              fontSize: size,
            ),
          ),
        ),
      ]),
    );
  }


  static pw.Widget buildHeader(Uint8List logo,) {
    return pw.Container(
      height: 200,
      // color: PdfColors.grey,
      padding: const pw.EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: pw.Row(children: [
        pw.Expanded(
          flex: 1,
          child: pw.SizedBox(
            height: 120,
            width: 120,
            child: pw.Image(
              pw.MemoryImage(
                logo,
              ),
            ),
          ),
        ),
        pw.Expanded(
          flex: 4,
          child: pw.ListView(
            padding: pw.EdgeInsets.zero,
            children: [
              pw.Center(
                child: pw.Text(
                  'Invoice',
                  style: pw.TextStyle(
                    fontSize: 50,
                    fontWeight: pw.FontWeight.normal,
                  ),
                ),
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Center(
                child: pw.Text(
                  'Invoice ID# 0001',
                  style: pw.TextStyle(
                    fontSize: 27,
                    fontWeight: pw.FontWeight.normal,
                  ),
                ),
              ),
              pw.Container(
                height: 100,
                child: pw.Row(
                  children: [
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          height: 50,
                          child: pw.Column(children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Center(
                                    child: pw.Text(
                                  'Invoice Date',
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                    fontWeight: pw.FontWeight.normal,
                                    color: PdfColors.grey500,
                                  ),
                                ))),
                            pw.Expanded(
                                flex: 1,
                                child: pw.Center(
                                    child: pw.Text(
                                      DateFormat('dd-MM-yyyy').format(DateTime.now()),
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.normal,
                                    color: PdfColors.black,
                                  ),
                                ))),
                          ]),
                        )),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        height: 50,
                        child: pw.Column(
                          children: [
                            pw.Expanded(
                                flex: 1,
                                child: pw.Center(
                                    child: pw.Text(
                                  'Due Date',
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                    fontWeight: pw.FontWeight.normal,
                                    color: PdfColors.grey500,
                                  ),
                                ))),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Center(
                                child: pw.Text(
                                  DateFormat('dd-MM-yyyy').format(DateTime.now()),
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.normal,
                                    color: PdfColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.SizedBox(
            height: 100,
            width: 100,
            child: BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: '',
            ),
          ),
        ),
      ]),
    );
  }

  static pw.Widget descripDesign(PdfModel data,) {
    return pw.Container(
      height: 200,
      margin: const pw.EdgeInsets.only(left: 40, right: 20),
      child: pw.Row(
        children: [
          pw.Expanded(
            flex: 3,
            child: pw.Column(
              children: [
                pw.Expanded(
                  flex: 1,
                  child: pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Description',
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                pw.Expanded(
                  child: pw.SizedBox(height: 10),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(data.description,
                        style: const pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 30,
                        )),
                  ),
                ),
                pw.Expanded(
                  child: pw.SizedBox(height: 40),
                ),
                pw.Expanded(
                  child: pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      'Terms and Conditions',
                      style: pw.TextStyle(
                        color: PdfColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                pw.Expanded(
                  child: pw.SizedBox(height: 10),
                ),
                pw.Expanded(
                  child: pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      data.termsCondition,
                      style: const pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          pw.Expanded(
            flex: 2,
            child: pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  left:pw.BorderSide(color: PdfColors.redAccent),
                  right:pw.BorderSide(color: PdfColors.redAccent),
                  top: pw.BorderSide(color: PdfColors.redAccent),
                )
              ),
              height: 350,
              child: pw.Column(
                children: [
                  pw.Expanded(
                    child: pw.Container(
                      height: 50,
                      width: 340,
                      decoration: pw.BoxDecoration(
                          color: PdfColors.amber,
                          border:
                              pw.Border.all(color: PdfColors.black, width: 3)),
                      child: pw.Align(
                          alignment: pw.Alignment.center,
                          child: pw.Text('Total Summary',
                              style: pw.TextStyle(
                                color: PdfColors.white,
                                fontSize: 30,
                              ))),
                    ),
                  ),
                  pw.Expanded(
                    flex: 3,
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                          color: PdfColors.amber100,
                          border:
                              pw.Border.all(color: PdfColors.black, width: 3)),
                      height: 300,
                      child: pw.Column(
                        children: [
                          pw.Expanded(
                            child: simpleText('Total(Eac Tax', '${data.totalExTax}'),
                          ),
                          pw.Expanded(
                            child: simpleText('Discount', '${data.discount}'),
                          ),
                          pw.Expanded(
                            child: simpleText('Sub total', '${data.tax}'),
                          ),
                          pw.Expanded(
                            child: simpleText('Total(Esc Tax', '${data.subTotalIncTax}'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget simpleText(String text1, String text2) {
    return pw.Row(
      children: [
        pw.Expanded(
          child: pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text('$text1',
                style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 20,
                )),
          ),
        ),
        pw.Expanded(
          child: pw.Padding(
            padding: pw.EdgeInsets.only(right: 20.0),
            child: pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text('$text2',
                  style: pw.TextStyle(
                    color: PdfColors.black,
                    fontSize: 20,
                  )),
            ),
          ),
        ),
      ],
    );
  }

  static pw.Widget itemDetailRow({required PdfModel data,}) {
    return pw.Container(
      height: 100,
      width: 800,
      margin: pw.EdgeInsets.only(left: 50),
      child: pw.Row(children: [
        pw.Expanded(
          child: pw.Text(data.serialNumber,
              style: pw.TextStyle(
                color: PdfColors.black,
                fontSize: 30,
              ),),
        ),
        pw.Expanded(
          flex: 3,
          child: pw.Align(
            alignment: pw.Alignment.center,
            child:pw.Text(data.itemName,
              style: pw.TextStyle(
                color: PdfColors.black,
                fontSize: 30,
              )),),
        ),
        pw.Expanded(
          flex: 2,
          child: pw.Align(
            alignment: pw.Alignment.center,
            child:pw.Text(data.quantity,
              style: pw.TextStyle(
                color: PdfColors.black,
                fontSize: 30,
              )),),
        ),
        pw.Expanded(
          child: pw.Text(data.price,
              style: pw.TextStyle(
                color: PdfColors.black,
                fontSize: 30,
              )),
        ),
        pw.Expanded(
          child: pw.SizedBox(
            width: 10,
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Text(data.price,
              style: pw.TextStyle(
                color: PdfColors.black,
                fontSize: 30,
              )),
        ),
      ]),
    );
  }

  static pw.Widget itemDetails(PdfModel data) {
    return pw.Container(
        padding: pw.EdgeInsets.only(left: 20, right: 30),
        height: 70,
        color: PdfColors.amber,
        child: pw.Row(children: [
          pw.Expanded(
            child: pw.Align(
        alignment: pw.Alignment.centerRight,
          child:pw.Text(
              'S.No',
              style: pw.TextStyle(
                color: PdfColors.white,
                fontSize: 30,
              ),
            ),
          ),),
          pw.Expanded(
            flex: 2,
            child: pw.Align(
              alignment: pw.Alignment.centerRight,
                child:pw.Text(
              'Item name',
              style: pw.TextStyle(
                color: PdfColors.white,
                fontSize: 30,
              ),
            ),
          ),),
          pw.Expanded(
            flex: 2,
            child: pw.Align(
            alignment: pw.Alignment.centerRight,
            child:pw.Text(
              'Quantity',
              style: pw.TextStyle(
                color: PdfColors.white,
                fontSize: 30,
              ),
            ),
          ),),
          pw.Expanded(
            flex: 2,
            child:pw.Align(
    alignment: pw.Alignment.centerRight,
    child: pw.Text(
              ' item price',
              style: pw.TextStyle(
                color: PdfColors.white,
                fontSize: 30,
              ),
            ),
          ),),
          pw.SizedBox(
            width: 10,
          ),
          pw.Expanded(
            flex: 2,
            child: pw.Align(
    alignment: pw.Alignment.centerRight,
    child: pw.Text(
              'total price',
              style: pw.TextStyle(
                color: PdfColors.white,
                fontSize: 30,
              ),
            ),
          ),),
        ],),);
  }
}
