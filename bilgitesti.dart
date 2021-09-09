import 'package:flutter/material.dart';

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
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
  List<String> sorular = [
    'Bilgi Testi Soruları',
    "1.Titanic gelmiş geçmiş en büyük gemidir",
    "2.Dünyadaki tavuk sayısı insan sayısından fazladır",
    "3.Kelebeklerin ömrü bir gündür",
    "4.Dünya düzdür",
    "5.Kaju fıstığı aslında bir meyvenin sapıdır",
    "6.Fatih Sultan Mehmet hiç patates yememiştir",
    "7.Fransızlar 80 demek için, 4 - 20 der, "
  ];
  List<bool> yanitlar = [false, true, false, false, true, true];
  int soruIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                sorular[soruIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 2,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        setState(() {
                          {
                            bool yanlisyanit = yanitlar[soruIndex];

                            if (yanlisyanit == false) {
                              secimler.add(kDogruikonu);
                            } else {
                              secimler.add(kYanlisikonu);
                            }
                          }
                          soruIndex++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.green[400],
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        bool dogruyanit = yanitlar[soruIndex];
                        setState(() {
                          soruIndex++;

                          if (dogruyanit == false) {
                            secimler.add(kDogruikonu);
                          } else {
                            secimler.add(kYanlisikonu);
                          }
                        },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.black38,
                      child: Icon(Icons.delete, size: 30.0),
                      onPressed: () {
                        setState(() {
                          secimler.clear();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

const Icon kDogruikonu = Icon(
  Icons.mood,
  color: Colors.green,
);
const Icon kYanlisikonu = Icon(Icons.mood_bad, color: Colors.red);

