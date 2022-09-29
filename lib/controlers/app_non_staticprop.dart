import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdfgenrate/controlers/app_static_class.dart';
// import 'package:pdf/widgets.dart';

import 'apptexteditingcontroler.dart';

class AppNonSatitcProp {
  int index = 0;

  static List<Map<String, dynamic>> items = [];

  List<Step> steper() {
    return [
      Step(
          title: Text('Date'),
          content: Container(
            color: Colors.red,
          )),
      Step(
          title: Text('Billed By'),
          content: Container(
            height: 240,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    height: 40,
                    child: Center(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter  name.';
                          }
                          ;
                        },
                        controller: AppTextEditingControlers.billByOrginazition,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 3, top: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter  Email.';
                        }
                        ;
                      },
                      controller: AppTextEditingControlers.billByEmail,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 3, top: 3),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter  Adrees.';
                        }
                        ;
                      },
                      controller: AppTextEditingControlers.billByAdress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Address',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter  phone.';
                          }
                          ;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'phone',
                        ),
                        controller: AppTextEditingControlers.billByPhone),
                  ),
                ),
              ],
            ),
          )),
      Step(
        title: Text('Billed To'),
        content: Container(
          height: 200,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  height: 40,
                  child: Center(
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter  name.';
                          }
                          ;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                        ),
                        controller:
                            AppTextEditingControlers.billToOrginnization),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  width: 400,
                  margin: EdgeInsets.only(bottom: 3, top: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter  Email.';
                        }
                        ;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                      controller: AppTextEditingControlers.billToEmail),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 3, top: 3),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter  Addrees.';
                        }
                        ;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Addrees',
                      ),
                      controller: AppTextEditingControlers.billToAdress),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter  phone.';
                        }
                        ;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'phone',
                      ),
                      controller: AppTextEditingControlers.billToPhone),
                ),
              ),
            ],
          ),
        ),
      ),
      Step(
        title: Text('Items'),
        content: Container(
          height: 200,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 3, top: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'item Name',
                      ),
                      controller: AppTextEditingControlers.itemName),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 3, top: 3),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: Center(
                    child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'item qua',
                        ),
                        controller: AppTextEditingControlers.itemQuantity),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'itemPrice',
                      ),
                      controller: AppTextEditingControlers.itemPrice),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          items.add({
                            'Name': AppTextEditingControlers.itemName.text,
                            'price': AppTextEditingControlers.itemPrice.text,
                            'quantity': AppTextEditingControlers.itemQuantity.text,
                          });
                          AppTextEditingControlers.itemName.clear();
                          AppTextEditingControlers.itemQuantity.clear();
                          AppTextEditingControlers.itemPrice.clear();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 100,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              "Add Items",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Step(
        title: Text('Description'),
        content: Container(
          height: 110,
          child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter  descrip.';
                }
                ;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Description',
              ),
              controller: AppTextEditingControlers.description),
        ),
      ),
      Step(
        title: Text('Terms Condition'),
        content: Container(
          height: 110,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Terms conditioin.';
                      }
                      ;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Terms Condition',
                    ),
                    controller: AppTextEditingControlers.termsCondition),
              )
            ],
          ),
        ),
      ),
    ];
  }
}
