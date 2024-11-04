import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:thibaitizokutansaku_map/provider.dart';

import 'chibauji.dart';

class Mymap extends ConsumerWidget {
  Mymap({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    List<ChibaUji> chibaujiList2 = ref.watch(chibaujiListProvider);

    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(35.61100000, 140.119331), // Center the map over London
        initialZoom: 16,
      ),
      children: [
        TileLayer( // Display map tiles from any source
          urlTemplate: 'https://cyberjapandata.gsi.go.jp/xyz/pale/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
          // And many more recommended properties!
        ),

        MarkerLayer(
          markers: [
            for (var p=0; p < chibaujiList2.length; p++ )
              if ( chibaujiList2[p].favorite != false )
              Marker(
                width: 80.0,
                height: 80.0,
                point:  LatLng(chibaujiList2[p].lat,chibaujiList2[p].lng ),
                child: Image.asset(
                    'assets/images/${chibaujiList2[p].image}'
                ),
              ),

            for (var i=0; i < chibaujiList2.length; i++ )
              if ( chibaujiList2[i].favorite != false )
              Marker(
                width: 120.0,
                height: 100.0,
                point:  LatLng(chibaujiList2[i].lat, chibaujiList2[i].lng),
                child:Text(chibaujiList2[i].subtitle,style: TextStyle(fontSize: 10,backgroundColor: Colors.white60,fontWeight: FontWeight.bold),),

              ),

          ],
        ),


        RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
          attributions: [
            TextSourceAttribution(
              '国土地理院 https://maps.gsi.go.jp/development/ichiran.html',

            ),
            // Also add images...
          ],
        ),
      ],
    );
  }
}
