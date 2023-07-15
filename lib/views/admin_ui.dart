// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

extension ColorExtension on String {
  toColor2() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class AdminUI extends StatefulWidget {
  const AdminUI({super.key});

  @override
  State<AdminUI> createState() => _AdminUIState();
}

class _AdminUIState extends State<AdminUI> {
  List<DropdownMenuItem<String>> get _dropdownTime {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "1",
        child: Text("Live"),
      ),
      DropdownMenuItem(
        value: "2",
        child: Text("Day"),
      ),
      DropdownMenuItem(
        value: "3",
        child: Text("Month"),
      ),
      DropdownMenuItem(
        value: "4",
        child: Text("Year"),
      ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get _dropdownRoom {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "1",
        child: Text("Sum"),
      ),
      DropdownMenuItem(
        value: "2",
        child: Text("Room 1"),
      ),
      DropdownMenuItem(
        value: "3",
        child: Text("Room 2"),
      ),
    ];
    return menuItems;
  }

  String? _selectRoom = '1';
  String? _selectTime = '1';
  var nf = NumberFormat('###,###.00', 'en_US');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: '#99d3ff'.toColor2(),
        body: SingleChildScrollView(
          //decoration: const InputDecoration(
          // image: DecorationImage(image: AssetImage("assets/images/BGLogin.jpg"), fit: BoxFit.cover, opacity: 870),
          //),
          child: SafeArea(
            left: true,
            right: true,
            top: true,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                          ),
                          icon: Icon(Icons.arrow_drop_down_rounded),
                          items: _dropdownRoom,
                          value: _selectRoom,
                          onChanged: (String? value) {
                            setState(() {
                              _selectRoom = value;
                            });
                          },
                          iconSize: 15,
                          style: GoogleFonts.signikaNegative(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                          iconEnabledColor: Colors.grey[700],
                          dropdownColor: Colors.deepOrange[50],
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                          ),
                          icon: Icon(Icons.arrow_drop_down_rounded),
                          items: _dropdownTime,
                          value: _selectTime,
                          onChanged: (String? value) {
                            setState(() {
                              _selectTime = value;
                            });
                          },
                          iconSize: 15,
                          style: GoogleFonts.signikaNegative(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                          iconEnabledColor: Colors.grey[700],
                          dropdownColor: Colors.deepOrange[50],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.07,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'summary',
                      style: GoogleFonts.signikaNegative(
                        fontSize: MediaQuery.of(context).size.width * 0.10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.12,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Cost',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.17,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '000',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.12,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Unit',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.17,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '0000',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.12,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Power',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.17,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '000',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.12,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Voltage',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.17,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '0000',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.12,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Current',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.17,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '0000',
                          style: GoogleFonts.signikaNegative(
                            fontSize: MediaQuery.of(context).size.width * 0.15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                /*Container(
                  child: LineChart(
                    LineChartData(),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
