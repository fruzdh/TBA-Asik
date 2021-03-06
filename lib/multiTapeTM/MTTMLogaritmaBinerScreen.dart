import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tubes/model/Item.dart';

class MTTMLogaritmaBinerScreen extends StatefulWidget {
  final int A;
  final double width;

  MTTMLogaritmaBinerScreen({
    required this.A,
    required this.width,
  });

  _MTTMLogaritmaBinerScreen createState() => _MTTMLogaritmaBinerScreen();
}

class _MTTMLogaritmaBinerScreen extends State<MTTMLogaritmaBinerScreen> {
  final controller1 = ScrollController();
  final controller2 = ScrollController();
  final controller3 = ScrollController();
  List<Item> tape1 = [];
  List<Item> tape2 = [];
  List<Item> tape3 = [];
  int activeIndex1 = 3;
  int activeIndex2 = 3;
  int activeIndex3 = 3;
  double padding = 16.0;
  int total = 0;
  bool done = false;
  int q = 0;
  String hasil = '';
  Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {});

  int defSpeed = 1000;
  int defSpeedJ = 500;

  int curSpeed = 0;
  int curSpeedJ = 0;

  int twoTimeSpeed = 500;
  int twoTime = 250;

  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    int count = this.widget.width ~/ 50.0;
    total = count;
    if (count % 2 == 0) {
      padding = (this.widget.width % 50.0) / 2.0 + 25.0;
      total--;
    } else {
      if (this.widget.width % 50.0 > 32.0) {
        padding = (this.widget.width % 50.0) / 2;
      } else {
        padding = (this.widget.width % 50.0) / 2.0 + 50.0;
        total -= 2;
      }
    }

    for (int i = 0; i < (total - 2) / 2; i++) {
      tape1.add(Item('-1', false));
      tape2.add(Item('-1', false));
      tape3.add(Item('-1', false));
      activeIndex1++;
      activeIndex2++;
      activeIndex3++;
    }

    tape1.add(Item('B', false));
    tape1.add(Item('B', false));
    tape1.add(Item('B', false));

    tape2.add(Item('B', false));
    tape2.add(Item('B', false));
    tape2.add(Item('B', false));

    tape3.add(Item('B', false));
    tape3.add(Item('B', false));
    tape3.add(Item('B', false));

    if (this.widget.A < 0) {
      tape1.add(Item('Y', false));
      tape2.add(Item('B', false));
      tape3.add(Item('B', false));
      int tempA = this.widget.A * -1;
      for (int i = 0; i < tempA; i++) {
        tape1.add(Item('0', false));
        tape2.add(Item('B', false));
        tape3.add(Item('B', false));
      }
    } else if (this.widget.A > 0) {
      tape1.add(Item('X', false));
      tape2.add(Item('B', false));
      tape3.add(Item('B', false));
      for (int i = 0; i < this.widget.A; i++) {
        tape1.add(Item('0', false));
        tape2.add(Item('B', false));
        tape3.add(Item('B', false));
      }
    }

    tape1.add(Item('1', false));
    tape2.add(Item('B', false));
    tape3.add(Item('B', false));

    tape1.add(Item('B', false));
    tape1.add(Item('B', false));
    tape1.add(Item('B', false));

    tape2.add(Item('B', false));
    tape2.add(Item('B', false));
    tape2.add(Item('B', false));

    tape3.add(Item('B', false));
    tape3.add(Item('B', false));
    tape3.add(Item('B', false));

    for (int i = 0; i < (total - 2) / 2; i++) {
      tape1.add(Item('-1', false));
      tape2.add(Item('-1', false));
      tape3.add(Item('-1', false));
    }
  }

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
            timer.cancel();
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Multi Tape Turing Machine',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'log\u{2082}' + this.widget.A.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 16.0,
              ),
              height: 50.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tape1.length,
                  controller: controller1,
                  itemBuilder: (context, index) {
                    if (tape1[index].getContent() == '-1') {
                      return Container(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F4FA),
                          border:
                              Border.all(color: Color(0xFFF1F4FA), width: 0.5),
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: Text(
                            tape1[index].getContent(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: tape1[index].getIsCurrent() == true
                              ? Colors.lightBlueAccent
                              : Colors.lightBlue[700],
                          border:
                              Border.all(color: Color(0xFFF1F4FA), width: 0.5),
                        ),
                      );
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 4.0,
              ),
              height: 50.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tape2.length,
                  controller: controller2,
                  itemBuilder: (context, index) {
                    if (tape2[index].getContent() == '-1') {
                      return Container(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F4FA),
                          border:
                              Border.all(color: Color(0xFFF1F4FA), width: 0.5),
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: Text(
                            tape2[index].getContent(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: tape2[index].getIsCurrent() == true
                              ? Colors.lightBlueAccent
                              : Colors.lightBlue[700],
                          border:
                              Border.all(color: Color(0xFFF1F4FA), width: 0.5),
                        ),
                      );
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 16.0,
              ),
              height: 50.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tape3.length,
                  controller: controller3,
                  itemBuilder: (context, index) {
                    if (tape3[index].getContent() == '-1') {
                      return Container(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F4FA),
                          border:
                              Border.all(color: Color(0xFFF1F4FA), width: 0.5),
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: Text(
                            tape3[index].getContent(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: tape3[index].getIsCurrent() == true
                              ? Colors.lightBlueAccent
                              : Colors.lightBlue[700],
                          border:
                              Border.all(color: Color(0xFFF1F4FA), width: 0.5),
                        ),
                      );
                    }
                  }),
            ),
            AnimatedCrossFade(
                firstChild: Visibility(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    decoration: BoxDecoration(),
                    child: FloatingActionButton(
                      onPressed: () {
                        _isVisible = false;
                        curSpeed = defSpeed;
                        curSpeedJ = defSpeedJ;
                        setState(() {
                          tape1[activeIndex1].setIsCurrent(true);
                          tape2[activeIndex2].setIsCurrent(true);
                          tape3[activeIndex3].setIsCurrent(true);
                          jumpToItem1(curSpeedJ);
                          jumpToItem2(curSpeedJ);
                          jumpToItem3(curSpeedJ);
                          q = 0;
                        });
                        runTM(curSpeed);
                      },
                      child: Icon(Icons.play_arrow, color: Colors.white),
                    ),
                  ),
                ),
                secondChild: Visibility(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            curSpeed = defSpeed;
                            curSpeedJ = defSpeedJ;
                            timer.cancel();
                          },
                          child: Icon(Icons.pause),
                        ),
                        TextButton(
                          onPressed: () {
                            curSpeed = defSpeed;
                            curSpeedJ = defSpeedJ;
                            timer.cancel();
                            runTM(curSpeed);
                          },
                          child: Icon(Icons.play_arrow),
                        ),
                        TextButton(
                          onPressed: () {
                            curSpeed = twoTimeSpeed;
                            curSpeedJ = twoTime;
                            timer.cancel();
                            runTM(curSpeed);
                          },
                          child: Icon(Icons.fast_forward),
                        ),
                      ],
                    ),
                  ),
                ),
                crossFadeState: _isVisible
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 500)),
            Text('Hasil:', style: TextStyle(fontSize: 30)),
            Text(done ? hasil.toString() : '',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void jumpToItem1(int s) {
    int l = activeIndex1 - total ~/ 2.0;
    double value = 50.0 * l;
    controller1.animateTo(
      value,
      duration: Duration(milliseconds: s),
      curve: Curves.ease,
    );
  }

  void jumpToItem2(int s) {
    int l = activeIndex2 - total ~/ 2.0;
    double value = 50.0 * l;
    controller2.animateTo(
      value,
      duration: Duration(milliseconds: s),
      curve: Curves.ease,
    );
  }

  void jumpToItem3(int s) {
    int l = activeIndex3 - total ~/ 2.0;
    double value = 50.0 * l;
    controller3.animateTo(
      value,
      duration: Duration(milliseconds: s),
      curve: Curves.ease,
    );
  }

  void runTM(int s) {
    timer = Timer.periodic(Duration(milliseconds: s), (timer) {
      setState(() {
        if (!done) {
          if (q == 0) {
            q0();
          } else if (q == 1) {
            q1();
          } else if (q == 2) {
            q2();
          } else if (q == 3) {
            q3();
          } else if (q == 4) {
            q4();
          } else if (q == 5) {
            q5();
          } else if (q == 6) {
            q6();
          } else if (q == 7) {
            q7();
          } else if (q == 8) {
            q8();
          } else if (q == 9) {
            q9();
          } else if (q == 10) {
            q10();
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  void q0() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case 'XBB':
        {
          state('BBB', 'RSS', 1);
          break;
        }
      case 'YBB':
        {
          state('BBY', 'SSR', 9);
          break;
        }
      case '1BB':
        {
          state('BBY', 'SSR', 9);
          break;
        }
    }
  }

  void q1() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case '0BB':
        {
          state('0BB', 'RSS', 1);
          break;
        }
      case '1BB':
        {
          state('BBB', 'LSS', 2);
          break;
        }
    }
  }

  void q2() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case '0BB':
        {
          state('BBB', 'LSS', 3);
          break;
        }
    }
  }

  void q3() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case '0BB':
        {
          if (tape1[activeIndex1 - 3].getContent() == '-1') {
            tape1[activeIndex1 - 3].setContent('B');
            tape1.insert(
              0,
              Item('-1', false),
            );
            activeIndex1++;
          }
          if (tape2[activeIndex2 - 3].getContent() == '-1') {
            tape2[activeIndex2 - 3].setContent('B');
            tape2.insert(
              0,
              Item('-1', false),
            );
            activeIndex2++;
          }
          state('B0B', 'LRS', 4);
          break;
        }
      case 'BBB':
        {
          state('BBB', 'SSL', 6);
          break;
        }
    }
  }

  void q4() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case '0BB':
        {
          state('0BB', 'SSS', 2);
          break;
        }
      case 'BBB':
        {
          state('BB0', 'SLR', 5);
          break;
        }
    }
  }

  void q5() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case 'B0B':
        {
          if (tape2[activeIndex2 - 3].getContent() == '-1') {
            tape2[activeIndex2 - 3].setContent('B');
            tape2.insert(
              0,
              Item('-1', false),
            );
            activeIndex2++;
          }
          state('0BB', 'RLS', 5);
          break;
        }
      case 'BBB':
        {
          state('BBB', 'LSS', 2);
          break;
        }
    }
  }

  void q6() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case 'BBB':
        {
          state('BBY', 'SSR', 9);
          break;
        }
      case 'BB0':
        {
          state('BB0', 'SLR', 7);
          break;
        }
    }
  }

  void q7() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case 'BBB':
        {
          state('BBB', 'SSS', 10);
          break;
        }
      case 'B0B':
        {
          state('BBB', 'SSL', 8);
          break;
        }
    }
  }

  void q8() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case 'BB0':
        {
          state('BBB', 'SSL', 8);
          break;
        }
      case 'BBB':
        {
          state('BBY', 'SSR', 9);
          break;
        }
    }
  }

  void q9() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch (a + b + c) {
      case 'BBB':
        {
          state('BBX', 'SSR', 10);
          break;
        }
    }
  }

  void q10() {
    int xCount =
        tape3.where((item) => item.getContent() == 'X').toList().length;
    int yCount =
        tape3.where((item) => item.getContent() == 'Y').toList().length;
    int zeroCount =
        tape3.where((item) => item.getContent() == '0').toList().length;
    if (xCount == 1 && yCount == 1) {
      hasil = 'Tidak dapat diselesaikan';
    } else {
      hasil = zeroCount.toString();
    }
    q = -1;
    done = true;
  }

  void state(String content, String move, int destQ) {
    tape1[activeIndex1].setContent(content[0]);
    tape2[activeIndex2].setContent(content[1]);
    tape3[activeIndex3].setContent(content[2]);
    if (move[0] == 'R') {
      r1();
    } else if (move[0] == 'L') {
      l1();
    }
    if (move[1] == 'R') {
      r2();
    } else if (move[1] == 'L') {
      l2();
    }
    if (move[2] == 'R') {
      r3();
    } else if (move[2] == 'L') {
      l3();
    }
    q = destQ;
  }

  void r1() {
    tape1[activeIndex1].setIsCurrent(false);
    activeIndex1++;
    jumpToItem1(curSpeedJ);
    tape1[activeIndex1].setIsCurrent(true);
  }

  void l1() {
    tape1[activeIndex1].setIsCurrent(false);
    activeIndex1--;
    jumpToItem1(curSpeedJ);
    tape1[activeIndex1].setIsCurrent(true);
  }

  void r2() {
    tape2[activeIndex2].setIsCurrent(false);
    activeIndex2++;
    jumpToItem2(curSpeedJ);
    tape2[activeIndex2].setIsCurrent(true);
  }

  void l2() {
    tape2[activeIndex2].setIsCurrent(false);
    activeIndex2--;
    jumpToItem2(curSpeedJ);
    tape2[activeIndex2].setIsCurrent(true);
  }

  void r3() {
    tape3[activeIndex3].setIsCurrent(false);
    activeIndex3++;
    jumpToItem3(curSpeedJ);
    tape3[activeIndex3].setIsCurrent(true);
  }

  void l3() {
    tape3[activeIndex3].setIsCurrent(false);
    activeIndex3--;
    jumpToItem3(curSpeedJ);
    tape3[activeIndex3].setIsCurrent(true);
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    timer.cancel();
    super.dispose();
  }
}
