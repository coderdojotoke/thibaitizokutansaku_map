import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:thibaitizokutansaku_map/main.dart';


class kaiwa2 extends StatelessWidget {
  const kaiwa2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/images/tunetane.png',
              width: 200,
              height: 200,
            ),

            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'はあ。よく寝た。',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  'ん？見たことがないものがいっぱいじゃ！',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  'ここは、どこじゃ？今は何年じゃ？',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  '2024年か。',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  'なら、900年間寝てしまってたということか。',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  'ここは、どこじゃ？',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  '千葉！',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  'ここで何かをしたような覚えがある...。',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  'でも、忘れてしまった！どうしよう？',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  '旅をする？',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  'いい考えだな。',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  'でも、わしはまだ2024年になれていない。一緒に旅をしてくれるか？',
                  speed: const Duration(milliseconds: 150),
                ),
                TypewriterAnimatedText(
                  'なら、今すぐ出発だ！',
                  speed: const Duration(milliseconds: 150),
                ),

              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Root()),),
        child: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
