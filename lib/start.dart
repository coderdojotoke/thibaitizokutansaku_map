import 'package:flutter/material.dart';
import 'package:thibaitizokutansaku_map/main.dart';
import 'package:thibaitizokutansaku_map/story.dart';

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
         Align(
           alignment: Alignment.topRight,

         // Positioned(
            //right: 10,
            //bottom: 10,
            child: _buildFloatingActionButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/chiba.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(context) {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed:() {
            Navigator.push(
             context,
               MaterialPageRoute(builder: (context) => kaiwa2()),
             );
          },
            child:Text(
              'start',
              style: TextStyle(fontSize: (30),
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 80),


            ),

        )
        ),
      ],
    );
   /* return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => kaiwa2()),
        );
      },

       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children:<Widget> [

        //   Container(
        //     alignment: Alignment.center,
        //      height: 54,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text('Start'),
            ),

         ],
       ),
    );*/
  }
}
