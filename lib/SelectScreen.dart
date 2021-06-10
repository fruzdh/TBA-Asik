import 'package:flutter/material.dart';
import 'package:tubes/multiTapeTM/MTTMFaktorialScreen.dart';
import 'package:tubes/multiTapeTM/MTTMLogaritmaBinerScreen.dart';
import 'package:tubes/multiTapeTM/MTTMModuloScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPangkatScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPembagianScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPenguranganScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPenjumlahanScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPerkalianScreen.dart';
import 'package:tubes/standardTM/STMFaktorialScreen.dart';
import 'package:tubes/standardTM/STMLogaritmaBinerScreen.dart';
import 'package:tubes/standardTM/STMModuloScreen.dart';
import 'package:tubes/standardTM/STMPangkatScreen.dart';
import 'package:tubes/standardTM/STMPembagianScreen.dart';
import 'package:tubes/standardTM/STMPenguranganScreen.dart';
import 'package:tubes/standardTM/STMPenjumlahanScreen.dart';
import 'package:tubes/standardTM/STMPerkalianScreen.dart';

class SelectScreen extends StatelessWidget {
  final int type;
  final String A, B;

  SelectScreen({
    required this.type,
    required this.A,
    required this.B,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Turing Machine',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Pilih turing machine yang akan digunakan'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if(type == 1) {
                            return STMPenjumlahanScreen(
                              A: A,
                              B: B,
                              width: MediaQuery.of(context).size.width,
                            );
                          } else if(type == 2) {
                            return STMPenguranganScreen();
                          } else if(type == 3) {
                            return STMPerkalianScreen();
                          } else if(type == 4) {
                            return STMPembagianScreen();
                          } else if(type == 5) {
                            return STMFaktorialScreen();
                          } else if(type == 6) {
                            return STMModuloScreen();
                          } else if(type == 7) {
                            return STMPangkatScreen();
                          } else {
                            return STMLogaritmaBinerScreen();
                          }
                        }
                      )
                    );
                  },
                  child: const Text('Standard Turing Machine'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if(type == 1) {
                            return MTTMPenjumlahanScreen();
                          } else if(type == 2) {
                            return MTTMPenguranganScreen();
                          } else if(type == 3) {
                            return MTTMPerkalianScreen();
                          } else if(type == 4) {
                            return MTTMPembagianScreen();
                          } else if(type == 5) {
                            return MTTMFaktorialScreen();
                          } else if(type == 6) {
                            return MTTMModuloScreen();
                          } else if(type == 7) {
                            return MTTMPangkatScreen();
                          } else {
                            return MTTMLogaritmaBinerScreen();
                          }
                        }
                      )
                    );
                  },
                  child: const Text('Multi Tape Turing Machine'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}