import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdfgenrate/controlers/app_non_staticprop.dart';
import 'package:pdfgenrate/controlers/app_static_class.dart';
import 'package:pdfgenrate/controlers/pdf_api.dart';
import 'package:pdfgenrate/controlers/steps_cubits/steps_cubit.dart';
import 'package:pdfgenrate/models/pdfmodel.dart';
import 'package:signature/signature.dart';
import '../controlers/apptexteditingcontroler.dart';
import 'package:intl/intl.dart';

class StepsScreen extends StatefulWidget {
  const StepsScreen({Key? key}) : super(key: key);

  @override
  State<StepsScreen> createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  int curantStep = 0;

  SignatureController controller = SignatureController(
      // penStrokeWidth: 2,points: AppTextEditingControlers.signatureController.points
      );

  PdfModel invoice() {
    var data = PdfModel(
      dueDate: DateFormat('yy-m-yy').format(DateTime.now()),
      invoiceDate: DateFormat('yy-mm-yy').format(DateTime.now()),
      billByOrginazi: AppTextEditingControlers.billByOrginazition.text,
      billByEmail: AppTextEditingControlers.billByEmail.text,
      billByPhoneNumber: AppTextEditingControlers.billByPhone.text,
      billByAddress: AppTextEditingControlers.billByAdress.text,
      billedToOrganization: AppTextEditingControlers.billToOrginnization.text,
      billedToEmail: AppTextEditingControlers.billToEmail.text,
      billedToPhoneNumber: AppTextEditingControlers.billToPhone.text,
      billedToAddress: AppTextEditingControlers.billToAdress.text,
      itemName: AppTextEditingControlers.itemName.text,
      price: AppTextEditingControlers.itemPrice.text,
      quantity: AppTextEditingControlers.itemQuantity.text,
      serialNumber: AppTextEditingControlers.itemNomber.text,
      totalExTax: '${15}%',
      subTotalIncTax: '${5000}%',
      tax: '${15}%',
      discount: '${15}%',
      description: AppTextEditingControlers.description.text,
      termsCondition: AppTextEditingControlers.termsCondition.text,
    );
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => StepsCubit(0),
        child:  BlocBuilder<StepsCubit, int>(
            builder: (context, state) {
              return  ListView(
                physics: BouncingScrollPhysics(),
                    children: [
                      Form(
                        key: AppStaticPropertys.formKey,
                        child: Stepper(
                          onStepContinue: () {
                           if (state > 5) return;
                            context.read<StepsCubit>().getState(state: state++);
                          },
                          onStepCancel: () {
                            if (state <= 0) return;
                            context.read<StepsCubit>().getState(state: state - 1);
                          },
                          currentStep: state,
                          onStepTapped: (int step) {
                            context.read<StepsCubit>().getState(state: step);
                          },
                          steps: AppNonSatitcProp().steper(),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 300,
                        child: ClipRect(
                          child: Signature(
                            height: 150,
                            width: 300,
                            controller: controller,
                            backgroundColor: Colors.amber.shade100,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              controller.clear();
                            },
                            child: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 40,
                            ),
                          )),
                          Expanded(
                              child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 40,
                            ),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                         margin: EdgeInsets.only(left: 60, right: 60),
                        height: 50,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () async {
                            if(AppNonSatitcProp.items.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.lightGreen,
                                    duration: Duration(
                                      seconds: 3,
                                    ),
                                    content: Text(
                                      'Please Add items',
                                      style:TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ));
                            }
                          else if(AppStaticPropertys.formKey.currentState!.validate() && controller.isNotEmpty ){

                                  var signature = await controller.toPngBytes();
                              final pdf = await MyPdf.generateNewPdf(
                                  signature: signature!,
                                  data: invoice(),
                                  context: context);
                              MyPdf.openMyFile(pdf);
                            }
                            else {
                                if(controller.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.lightGreen,
                                        duration: Duration(
                                          seconds: 3,
                                        ),
                                        content: Text(
                                          'Please Fill sign field',
                                          style:TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ));
                                }
                              else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.lightGreen,
                                        duration: Duration(
                                          seconds: 3,
                                        ),
                                        content: Text(
                                          'Please Fill All The Fields',
                                          style:TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ));
                                }
                            }
                          },
                          child: const Center(
                            child: Text('Generate Pdf',style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
              );
            },
          ),
      ),
    );
  }

}
