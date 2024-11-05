import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thibaitizokutansaku_map/chibauji.dart';

final chibaujiListProvider =
StateNotifierProvider<ChibaujiListNotifier, List<ChibaUji>>((ref) {
  return ChibaujiListNotifier();
});

final indexProvider = StateProvider((ref){
  return 0;
},);

final medalListProvider =
StateNotifierProvider<MedalListNotifier, List>((ref) {
  return MedalListNotifier();
});


class ChibaujiListNotifier extends StateNotifier<List<ChibaUji>> {
  ChibaujiListNotifier() : super([
    ChibaUji(no: 1, name: '亥鼻城', subtitle: '千葉が一望できる展望台。桜の季節は最高！', image: 'inohana.jpg', favorite: false,lat: 35.60455518,lng: 140.1271149,flag: false),
    ChibaUji(no: 2, name: '御茶ノ水',subtitle:'源頼朝にここの水をつかったお茶をすすめたよ！', image: 'otyanomizu.jpg', favorite: false,lat: 35.6061434007113,lng: 140.125684468106,flag: false),
    ChibaUji(no: 3, name: '千葉神社',subtitle:'亀岩をなでて福運GET!', image: 'tibazinzya.jpg',favorite: false,lat: 35.6117773055556,lng:140.123666,flag: false),
    ChibaUji(no: 4, name: '通町公園',subtitle:'千葉常胤像とこんにちは！アートがいっぱい！', image: 'toorimati2.jpg', favorite: false,lat: 35.610867,lng: 140.122540,flag: false),
    ChibaUji(no: 5, name: '本町公園',subtitle:'都川の近くまで降りれる！春はお花見も。', image: 'honmati.jpg', favorite: false,lat: 35.6068624218069,lng: 140.127185317842,flag: false),
    ChibaUji(no: 6, name: '旭橋',subtitle:'亥鼻城がきれいに見える！歴史が長い橋。', image: 'asahi.jpg', favorite: false,lat: 35.606492116985,lng:140.126497897018,flag: false),
    ChibaUji(no: 7, name: '羽衣の松',subtitle:'伝説がいっぱいの松。どんな伝説かは、行ってのお楽しみ♪', image: 'hagoromonomatu.jpg', favorite: false,lat: 35.6041787195919,lng: 140.123010049046,flag: false),
    ChibaUji(no: 8, name: '君待橋',subtitle:'千葉常胤は源頼朝をここで迎えたのだよ!', image: 'kimimatibasi.jpg', favorite: false,lat:  35.6024934843818,lng: 140.118558750798,flag: false),
    ChibaUji(no: 9, name: '君待橋の碑',subtitle:'小さい公園になっているよ！疲れたら日陰で休んでみる？', image: 'kimimatibasinohi.jpg', favorite: false,lat: 35.601338236815,lng: 140.119213819469,flag: false),
    ChibaUji(no: 10, name: '高徳寺',subtitle:'千葉県立中央図書館の近くにあるよ！色鮮やかな植物がたくさん！', image: 'koutokuzi.jpg', favorite: false,lat: 35.6022655781317,lng: 140.126343723185,flag: false),
    ChibaUji(no: 11, name: '胤重寺',subtitle:'千葉県立中央図書館の真横。千葉氏ゆかりの地の看板も見つけて見てね！', image: 'inzyuuzi.jpg', favorite: false,lat: 35.6041024539254,lng: 140.126597260832,flag: false),
    ChibaUji(no: 12, name: '智光院',subtitle:'亥鼻城の緑が見えてきれい！駐車場の奥にあるから、見つけにくいよ！', image: 'tikouinn.jpg', favorite: false,lat: 35.6042664767976,lng: 140.125921218011,flag: false),
    ChibaUji(no: 13, name: '本敬寺',subtitle:'外観がとてもきれい！千葉神社の近くにあるよ！', image: 'honkyouzi.jpg', favorite: false,lat: 35.6099925361742,lng: 140.12632554853,flag: false),
    ChibaUji(no: 14, name: '香取神社', subtitle:'自然いっぱいの神社。小さいから、注意深く探してみよう！',image: 'katorizinzya.jpg',favorite: false,lat: 35.6114515740206,lng: 140.125332637356,flag: false),

  ]);

  void toggleCompleted(int no ) {
    state = state
        .map((chibauji) => ChibaUji(
      no: chibauji.no,
      name: chibauji.name,
      subtitle: chibauji.subtitle,
      image: chibauji.image,
      favorite: (no != chibauji.no) ? chibauji.favorite : !chibauji.favorite,
      lat: chibauji.lat,
      lng: chibauji.lng,
      flag: chibauji.flag,
    ))
        .toList();
  }

  void updateSubtitle(int no,String content ) {
    state = state
        .map((chibauji) => ChibaUji(
      no: chibauji.no,
      name: chibauji.name,
      subtitle:  (no != chibauji.no) ? chibauji.subtitle : content,
      image: chibauji.image,
      favorite: chibauji.favorite,
      lat: chibauji.lat,
      lng: chibauji.lng,
      flag: (no != chibauji.no) ? chibauji.flag : true,
    ))
        .toList();
  }
  Future<void>  saveList () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonStringList = state.map((chibauji) =>
        jsonEncode(chibauji.toJson())).toList();
    await prefs.setStringList('chibauji_list', jsonStringList);
  }

  Future<List<ChibaUji>> loadList() async {
    const String keychibaujilist = 'chibauji_list';
    final prefs = await SharedPreferences.getInstance();
    final List<String>? encodedList = prefs.getStringList(keychibaujilist);
    if (encodedList == null) {
      return
        [ChibaUji(no: 1, name: 'データ未登録', subtitle: 'データ未登録です', image: 'test', favorite: false,lat: 0,lng: 0,flag: false,
        )
        ];
    }
    return state = encodedList
        .map((chibau) => ChibaUji.fromJson(jsonDecode(chibau)))
        .toList();
  }
}

class MedalListNotifier extends StateNotifier<List<String>> {
  MedalListNotifier() : super([]);

  void tuika(String image) {
    state = [...state,image];
  }

  Future<void>  listsaveList () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> medals = state.toList();
    await prefs.setStringList('medallist',medals);
  }

  Future<List> listloadList() async {
    const String keymedallist = 'medallist';
    final prefs = await SharedPreferences.getInstance();
    final List<String>? encodedList = prefs.getStringList(keymedallist);
    if (encodedList == null) {
      return [];
    }
    return state = encodedList;
  }
}
