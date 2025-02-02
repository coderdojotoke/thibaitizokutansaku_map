import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thibaitizokutansaku_map/chibaujilist.dart';
import 'package:thibaitizokutansaku_map/favoritelist.dart';
import 'package:thibaitizokutansaku_map/map.dart';
import 'package:thibaitizokutansaku_map/provider.dart';
import 'package:thibaitizokutansaku_map/start.dart';
import 'medal.dart';

void main() {
 const app = MaterialApp(
     home:start(),
 );
  const scope = ProviderScope(child: app);

  runApp(scope);
}

class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);

    const items = [
      BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: '一覧'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.checklist),
          label:'お気に入り'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label:'地図'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.military_tech),
          label:'メダル'
      )
    ];

    final  bar = BottomNavigationBar(
      items: items,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      currentIndex: index,
      onTap:(index){
        ref.read(indexProvider.notifier).state = index;
      },
    );
    final pages = [
      ChibaUjiListPage(),
      ChibaUjiListPage2(),
      Mymap(),
      MedaliListPage(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: bar,
    );

  }
}
