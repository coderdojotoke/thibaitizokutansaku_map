import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thibaitizokutansaku_map/provider.dart';

class MedaliListPage extends ConsumerWidget {
  MedaliListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List medalList = ref.watch(medalListProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('メダル'),

      ),
      body: Center(
          child: ListView.builder(
            itemCount: medalList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: Image.asset(
                    '${medalList[index]}',
                    width: 100,
                    height: 230,
                    fit: BoxFit.contain,
                  ),

                );
            },

          )
      ),
    );
  }
}