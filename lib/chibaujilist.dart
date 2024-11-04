import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thibaitizokutansaku_map/chibauji.dart';
import 'package:thibaitizokutansaku_map/provider.dart';

class ChibaUjiListPage extends ConsumerWidget {
  final chibaujiContentTextController = TextEditingController();
  final chibaujiContentTextFocusNode = FocusNode();

  ChibaUjiListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ChibaUji> chibaujiList = ref.watch(chibaujiListProvider);
    ChibaujiListNotifier chibaujiListNotifier = ref.read(
        chibaujiListProvider.notifier);
    MedalListNotifier medalListNotifier = ref.read(medalListProvider.notifier);

    onPressedToggleButton(int index) {
      chibaujiListNotifier.toggleCompleted(chibaujiList[index].no);
    }
    onPresserSaveButton() {
      chibaujiListNotifier.saveList();
      medalListNotifier.listsaveList();
    }
    onPresserLoadButton() {
      chibaujiListNotifier.loadList();
      medalListNotifier.listloadList();
    }

    return Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          title: const Text('一覧'),
          actions: [
            IconButton(
                icon: const Icon(Icons.file_download_outlined),
                onPressed: () {
                  onPresserSaveButton();
                  },
              iconSize: 30,
            ),
            IconButton(
              icon: const Icon(Icons.file_upload_outlined),
              onPressed: () {onPresserLoadButton();},
              iconSize: 30,
            ),
          ],
        ),
        body: Center(
            child: ListView.builder(
              itemCount: chibaujiList.length,
              itemBuilder: (BuildContext context, int index) {
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
                    trailing: Wrap(
                      spacing: 8,
                      children: [
                        Icon(
                            chibaujiList[index].flag ? Icons.flag : Icons
                            .flag_outlined
                        ),
                        Icon(
                            chibaujiList[index].favorite ? Icons.favorite : Icons
                                .favorite_border
                        ),
                      ],
                    ),
                    onTap: () => onPressedToggleButton(index),
                  );
              },
              //        }
              //)

            )
          //    .toList(),

        ),
      );

  }
}