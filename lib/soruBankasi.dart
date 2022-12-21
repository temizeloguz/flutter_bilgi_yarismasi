
import 'soru.dart';
int questionNumber = 0;
 class Sorubankasi {

  List<Soru> _sorular = [
  Soru(
  soruMetni: "1. Titanic gelmiş geçmiş en büyük gemidir.",
  sorununYaniti: false),
  Soru(
  soruMetni: "2. Dünyadaki tavuk sayısı,insan sayısından fazladır.",
  sorununYaniti: true),
  Soru(soruMetni: "3. Kelebeklerin ömrü bir gündür.", sorununYaniti: false),
  Soru(soruMetni: "4. Dünya düzdür.", sorununYaniti: false),
  Soru(
  soruMetni: "5. Kaju fıstığı aslında bir meyvenin sapıdır.",
  sorununYaniti: true),
  Soru(
  soruMetni: "6. Fatih Sultan Mehmet hiç patates yememiştir.",
  sorununYaniti: true),
  Soru(
  soruMetni:
  "Yarışma sona erdi. Yeşil ifadeler doğruyu,kırmızı ifadeler yanlış sayısını ifade eder. Baştan başlamak için en alttaki butonu kullan. ",
  sorununYaniti: true),
  ];

String getSoruMetni (){
return _sorular[questionNumber].soruMetni;
}
  bool getSorununYaniti (){
    return _sorular[questionNumber].sorununYaniti;
  }
int getSoruSayisi (){
  return _sorular.length;

}
}
