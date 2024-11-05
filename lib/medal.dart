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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text('メダル'),

      ),
      body: Center(
          child: ListView.builder(
            itemCount: medalList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 250,
                child: Image.asset('${medalList[index]}'),
                  );
            },

          )
      ),
    );
  }
}