import 'package:bilgi_yarismasi/soruBankasi.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/services.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            appBar: AppBar(
              titleTextStyle:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              title: Text("Bilgi Yarışması"),
              centerTitle: true,
              backgroundColor: Colors.teal,
            ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  Sorubankasi banka_1 = Sorubankasi();

  void bastanBasla() {
    setState(() {
      questionNumber = 0;
      secimler.clear();
    });
  }

  void soruYanitla(bool yanit) {
    setState(() {
      banka_1.getSorununYaniti() == yanit
          ? secimler.add(kDogruCevap)
          : secimler.add(kYanlisCevap);
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  banka_1.getSoruMetni(),
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
          ),
          Center(
              child: Wrap(
            children: secimler,
            spacing: 5,
            runSpacing: 5,
          )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: banka_1.getSoruSayisi() - 1 != questionNumber
                    ? Row(children: <Widget>[
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Container(
                                  color: Colors.red,
                                  child: TextButton(
                                      child: Icon(Icons.thumb_down,
                                          color: Colors.white, size: 30.0),
                                      onPressed: () => soruYanitla(false)),
                                ))),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Container(
                                  color: Colors.green[700],
                                  child: TextButton(
                                      child: Icon(Icons.thumb_up,
                                          size: 30.0, color: Colors.white),
                                      onPressed: () => soruYanitla(true)),
                                ))),
                      ])
                    : Expanded(
                        child: TextButton(
                          onPressed: () => bastanBasla(),
                          child: Container(padding: EdgeInsets.all(20.0),decoration: BoxDecoration(color: Colors.orangeAccent),child: Text("Baştan Başla",style: TextStyle(color: Colors.white,fontSize: 25)),),
                        ),
                      ),
              ))
        ]);
  }
}
