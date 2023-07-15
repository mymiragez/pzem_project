// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pzem_project/views/admin_ui.dart';

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: '#FFFFFF'.toColor(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/BGLogin2.jpg"), fit: BoxFit.cover, opacity: 80),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.45,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Power Electronic',
                    style: GoogleFonts.signikaNegative(
                      fontSize: MediaQuery.of(context).size.width * 0.10,
                      color: Color.fromARGB(255, 0, 152, 246),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.25,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 8, 255),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 72, 157, 253),
                        ),
                      ),
                      hintText: 'Enter Username',
                      hintStyle: GoogleFonts.signikaNegative(color: Color.fromARGB(255, 72, 157, 253)),
                      prefixIcon: Icon(CupertinoIcons.person_circle, color: Color.fromARGB(255, 72, 157, 253)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 8, 255),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 72, 157, 253),
                        ),
                      ),
                      hintText: 'Enter Password',
                      hintStyle: GoogleFonts.signikaNegative(color: Color.fromARGB(255, 72, 157, 253)),
                      prefixIcon: Icon(CupertinoIcons.lock_circle, color: Color.fromARGB(255, 72, 157, 253)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminUI(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 197, 239, 255),
                  ),
                  backgroundColor: Color.fromARGB(255, 72, 157, 253).withOpacity(0.95),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  foregroundColor: Color.fromARGB(6, 28, 60, 218).withOpacity(0.5),
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.55,
                    MediaQuery.of(context).size.width * 0.057,
                  ),
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.signikaNegative(
                    color: Color.fromARGB(255, 253, 244, 244),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
