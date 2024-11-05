import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thibaitizokutansaku_map/chibauji.dart';
import 'package:thibaitizokutansaku_map/provider.dart';


class UpdateScreen extends ConsumerWidget {
  UpdateScreen(this.no,this.subtitle,{super.key});

  final int no;
  final String subtitle;
  final chibaujiContentTextController = TextEditingController();
  bool enable = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ChibaUji> chibaujiList = ref.watch(chibaujiListProvider);
    ChibaujiListNotifier chibaujiListNotifier = ref.read(chibaujiListProvider.notifier);
    MedalListNotifier medalListNotifier = ref.read(medalListProvider.notifier);

    onPressedUpdateButton() {
      String content = chibaujiContentTextController.text;
      chibaujiListNotifier.updateSubtitle(no,content);

      var counter = 0;
      for(var map in chibaujiList){
        if(map.flag == true){
          counter = counter +1;
        }
      }
      daiarogu(image){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: EdgeInsets.zero,
              title : Image.asset(
                image,
                height: 250,
                fit: BoxFit.cover,
              ),
              content: Text("おめでとうございます！"),
              actions: <Widget>[
                TextButton(
                  child: Text('ok'),
                  onPressed: () {
                    medalListNotifier.tuika(image);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
      switch (counter) {
        case 4:
          var image =  'assets/images/5.jpg';
          daiarogu(image);
        case 9:
          var image =  'assets/images/10.png';
          daiarogu(image);
        case 13:
          var image =  'assets/images/14.png';
          daiarogu(image);
      }
    };

    return
      Scaffold(
        appBar: AppBar(title: const Text('メモを入力')),
        body: Column(
          children: [
            Text(
              '${chibaujiList[no-1].name}のメモ',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: chibaujiContentTextController,
              maxLength: 20,
              onChanged:(String? value){
                enable = true;
                print(enable);
              } ,
            ),

            ElevatedButton(
              onPressed:
              onPressedUpdateButton,
              child: const Text('完了'),
            ),
            Text('※完了ボタンを押してから、上の矢印で戻ってください'),

          ],
        ),
      );
  }
}