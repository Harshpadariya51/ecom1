// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../util.dart';

class bill extends StatefulWidget {
  const bill({super.key});

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {
  @override
  void initState() {
    super.initState();
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.all(16.0),
              child: pw.Column(
                children: [
                  // Invoice header
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Invoice',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 28),
                      ),
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            pw.Text(
                              'Your Customer',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 16),
                            ),
                            pw.Text(
                              'Virat Kohli\n Meera Bagh, Delhi 110001',
                              style: pw.TextStyle(fontSize: 16),
                            ),
                          ]),
                    ],
                  ),
                  pw.SizedBox(height: 50),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Column(
                          children: [
                            pw.Row(
                              children: [
                                pw.Text(
                                  'INVOICE      2020-123',
                                  style: pw.TextStyle(
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ],
                            ),
                            pw.SizedBox(
                              height: 20,
                            ),
                            pw.Divider(thickness: 2, color: PdfColors.black),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  'count',
                                  style: pw.TextStyle(
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Text(
                                  'Name',
                                  style: pw.TextStyle(
                                      fontSize: 14,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.SizedBox(
                                  width: 10,
                                ),
                                pw.Text(
                                  'Price',
                                  style: pw.TextStyle(
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.Text(
                                  'Qty',
                                  style: pw.TextStyle(
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.Text(
                                  'Total',
                                  style: pw.TextStyle(
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ],
                            ),
                            pw.Divider(thickness: 2, color: PdfColors.black),
                            ...Global.Cart_List.map((e) {
                              count++;
                              return pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Text(
                                    '$count',
                                    style: pw.TextStyle(fontSize: 16),
                                  ),
                                  pw.Text(
                                    '${e['name']}',
                                    style: pw.TextStyle(fontSize: 16),
                                  ),
                                  pw.Text(
                                    '${e['price']}',
                                    style: pw.TextStyle(fontSize: 16),
                                  ),
                                  pw.Text(
                                    '${e['qty']}',
                                    style: pw.TextStyle(fontSize: 16),
                                  ),
                                  pw.Text(
                                    '${e['subTotal']}',
                                    style: pw.TextStyle(fontSize: 16),
                                  ),
                                ],
                              );
                            }).toList(),
                            pw.Divider(thickness: 2, color: PdfColors.black),
                            pw.SizedBox(
                              height: 20,
                            ),
                            pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Expanded(
                                  child: pw.Table(
                                    children: [
                                      pw.TableRow(children: [
                                        pw.Spacer(),
                                        pw.Text(
                                          'Sub-total',
                                          style: pw.TextStyle(
                                              fontSize: 16,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                        pw.SizedBox(
                                          width: 10,
                                        ),
                                        pw.Text(
                                          '${Global.subsum}',
                                          style: pw.TextStyle(
                                              fontSize: 16,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                      ]),
                                      pw.TableRow(children: [
                                        pw.Spacer(),
                                        pw.Text(
                                          'Delivery',
                                          style: pw.TextStyle(
                                              fontSize: 16,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                        pw.SizedBox(
                                          width: 10,
                                        ),
                                        pw.Text(
                                          '${Global.delivery}',
                                          style: pw.TextStyle(
                                              fontSize: 16,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                      ]),
                                      pw.TableRow(children: [
                                        pw.Spacer(),
                                        pw.Text(
                                          'Discount',
                                          style: pw.TextStyle(
                                              fontSize: 16,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                        pw.SizedBox(
                                          width: 10,
                                        ),
                                        pw.Text(
                                          '-${Global.discount}',
                                          style: pw.TextStyle(
                                              fontSize: 16,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                      ]),
                                      pw.TableRow(children: [
                                        pw.Spacer(),
                                        pw.Text(
                                          'Amount due',
                                          style: pw.TextStyle(
                                              fontSize: 16,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                        pw.SizedBox(
                                          width: 10,
                                        ),
                                        pw.Text(
                                          '${Global.finalsum}',
                                          style: pw.TextStyle(
                                              fontSize: 16,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                      ])
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Divider(thickness: 2, color: PdfColors.black),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            'Salad Brand.',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 20),
                          ),
                          pw.SizedBox(
                            height: 16,
                          ),
                          pw.Text(
                            'Virat Kohli Meera Bagh, Delhi 110001',
                            style: pw.TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Divider(thickness: 2, color: PdfColors.black),
                ],
              ),
            );
          }),
    );
  }

  final pdf = pw.Document();

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Invoice Template'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Invoice header
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invoice',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(
                    'Your Customer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    'Virat Kohli\n Meera Bagh, Delhi 110001',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.end,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'INVOICE      2020-123',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(thickness: 2, color: Colors.black),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'count',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Qty',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Divider(thickness: 2, color: Colors.black),
                      ...Global.Cart_List.map((e) {
                        count++;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$count',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${e['name']}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${e['price']}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${e['qty']}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${e['subTotal']}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        );
                      }).toList(),
                      Divider(thickness: 2, color: Colors.black),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Table(
                              children: [
                                TableRow(children: [
                                  Spacer(),
                                  Text(
                                    'Sub-total',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${Global.subsum}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                TableRow(children: [
                                  Spacer(),
                                  Text(
                                    'Delivery',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${Global.delivery}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                TableRow(children: [
                                  Spacer(),
                                  Text(
                                    'Discount',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '-${Global.discount}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                TableRow(children: [
                                  Spacer(),
                                  Text(
                                    'Amount due',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${Global.finalsum}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(thickness: 2, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Salad Brand.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Virat Kohli Meera Bagh, Delhi 110001',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
            Divider(thickness: 2, color: Colors.black),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() async {
                Directory? res = await getExternalStorageDirectory();

                String path = res!.path;

                File file = File('$path/resume.pdf');

                await file.writeAsBytes(await pdf.save()).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      content: Text("Saved successfully"),
                    ),
                  );
                });
              });
            },
            child: const Icon(Icons.download),
          ),
          SizedBox(width: 15),
          FloatingActionButton(
            onPressed: () async {
              Printing.layoutPdf(onLayout: (format) {
                return pdf.save();
              });
            },
            child: const Icon(Icons.print),
          ),
        ],
      ),
    );
  }
}
