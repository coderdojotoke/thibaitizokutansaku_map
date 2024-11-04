import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thibaitizokutansaku_map/chibauji.dart';
import 'package:thibaitizokutansaku_map/provider.dart';
import 'package:thibaitizokutansaku_map/updatescreen.dart';

class ChibaUjiListPage2 extends ConsumerWidget {
  ChibaUjiListPage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<ChibaUji> chibaujiList = ref.watch(chibaujiListProvider);
    ChibaujiListNotifier chibaujiListNotifier = ref.read(
        chibaujiListProvider.notifier);

    onPresserSaveButton() {
      chibaujiListNotifier.saveList();
    }

    return
      Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          title: const Text('お気に入りリスト'),
          actions: [
            IconButton(
              icon: const Icon(Icons.file_download_outlined),
              onPressed: () {onPresserSaveButton();},
              iconSize: 30,
            ),
          ],
        ),
        body: Center(
            child: ListView.builder(
              itemCount: chibaujiList.length,
              itemBuilder: (BuildContext context, int index) {
                if ( chibaujiList[index].favorite != false ) {
                  return
                    ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: Image.asset(
                          'assets/images/${chibaujiList[index].image}',
                          width: 100,
                          height: 230,
                          fit: BoxFit.contain,
                        ),
                        title: Text(
                          chibaujiList[index].name,
                          style: const TextStyle(fontSize: 30),
                        ),
                        subtitle: Text(
                          chibaujiList[index].subtitle,
                          style: const TextStyle(fontSize: 20),
                        ),
                        trailing: Icon(Icons.edit),

                       onTap: (){
                          Navigator.push(
                            context,
                           MaterialPageRoute(
                               builder: (context) => UpdateScreen(chibaujiList[index].no,chibaujiList[index].subtitle,)),
                          );
                        }

                    );

                }else{
                  return Container();
                }
              },
            )
        ),
      );
  }
}