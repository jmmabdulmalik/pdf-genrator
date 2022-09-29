import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pdfgenrate/controlers/app_non_staticprop.dart';
import 'package:pdfgenrate/controlers/app_static_class.dart';
import '../models/pdfmodel.dart';

class MyPdf {

  static Future<File> generateNewPdf( {required Uint8List signature, required PdfModel data,required BuildContext context,key}) async {
    var logo = (await rootBundle.load("assets/pdflogo.jpeg")).buffer.asUint8List();

    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
          maxPages: 1,
          pageFormat: PdfPageFormat.a3,
          margin: pw.EdgeInsets.all(0),
          build: (pw.Context context) =>
          [
            pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    '0',
                    textAlign: TextAlign.left,
                    style: pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                pw.Container(
                  height: 50,
                  color: PdfColors.yellow700,
                ),
                pw.SizedBox(
                  height: 10,
                ),
                // invoice detail and date and design
               AppStaticPropertys.buildHeader(logo,),
                pw.SizedBox(
                  height: 30,
                ),
                //bill to and bill by detail and address
                AppStaticPropertys.billBybillTo(
                    text1: 'Bill By',
                    text2: 'Bill To',
                    color: PdfColors.amber,
                    size: 45),
                pw.SizedBox(
                  height: 10,
                ),
                AppStaticPropertys.billBybillTo(
                    text1: 'Name:${data.billByOrginazi}',
                    text2: 'Name:${data.billedToOrganization}',
                    color: PdfColors.black,
                    size: 35),
                AppStaticPropertys.billBybillTo(
                    text1: 'Emial: ${data.billByEmail}',
                    text2: 'Email: ${data.billedToEmail}',
                    color: PdfColors.black,
                    size: 35),
                AppStaticPropertys.billBybillTo(
                    text1: 'Adress: ${data.billByAddress}',
                    text2: 'Adress: ${data.billedToAddress}',
                    color: PdfColors.black,
                    size: 35),
                AppStaticPropertys.billBybillTo(
                    text1: 'phone: ${ data.billByPhoneNumber}',
                    text2: 'phone: ${data.billedToPhoneNumber}',
                    color: PdfColors.black,
                    size: 35),
                pw.SizedBox(
                  height: 10,
                ),
                //center container item detail and serial no
                AppStaticPropertys.itemDetails(data),
                pw.ListView.builder(itemCount: AppNonSatitcProp.items.length, itemBuilder: (Context context, int index) {
                  debugPrint('List: ${AppNonSatitcProp.items}');
                  var item = AppNonSatitcProp.items[index];
                  var quantity = int.parse(item['quantity']);
                  var price = int.parse(item['price']);
                  var total = quantity * price;
                  return pw.Row(
                    children: [
                      pw.Expanded(
                        flex:1,
                        child: pw.Padding(
                          padding: pw.EdgeInsets.only(left: 50),
                          child: pw.Text('${index+1}',style: pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: 30,
                      )),),),
                     pw.Expanded(
                       flex:1,
                       child:pw.Text('${item['Name']}',style: pw.TextStyle(
                       color: PdfColors.black,
                       fontSize: 29,
                     )),),
                      pw.Expanded(
                        child: pw.Align(
                        alignment: pw.Alignment.center,
                        child:pw.Text(
                            '${quantity}',style: pw.TextStyle(
                          fontSize: 25,
                        ),
                        ),
                      ),),
                    pw.Expanded(
                      child: pw.Text(
                        '${price}',style: pw.TextStyle(
                        fontSize: 25,
                      )
                      ),
                    ),
                      pw.Expanded(
                        child: pw.Text(
                            '${total}',style: pw.TextStyle(
                          fontSize: 25,
                        ),
                        ),
                      )
                    ]
                  );
    }),
                pw.SizedBox(
                  height: 80,
                ),
                // Table and description here
               AppStaticPropertys.descripDesign(data,),
           pw.SizedBox(
             height: 50
           ),
            pw.Container(
              margin: pw.EdgeInsets.only(left: 500),
             height: 50,
              child: pw.Center(child:pw.Image(pw.MemoryImage(signature)),
              ),
            ),
              ],
            ),
    );

    var tempDirectory = await getTemporaryDirectory();
    debugPrint('=======================');
    debugPrint('${tempDirectory.path}');
    final file = File('${tempDirectory.path}' '/' + 'example.pdf');

    var newPdf = await file.writeAsBytes(await pdf.save());

    return newPdf;
  }

  static Future openMyFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
