import 'package:flutter/material.dart';
import 'package:untitled1/features/IntroScreen/presentaion/Widgets/custom_pageview.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(

              color: Colors.white,
             child: PageView(
               controller: _controller,
               scrollDirection: Axis.horizontal,
               physics: NeverScrollableScrollPhysics(),

               children: [
                 //Introduction Page 1


                 MyCustomPage(onPress: (){
                   _controller.nextPage(
                     duration: const Duration(milliseconds: 400),
                     curve: Curves.linear,
                   );},showRow: true,
                   controller: _controller,
                   mainImage: "assets/images/intro1.png",
                   titlePage: 'Select the\n Favorities Menu',
                   describePage: 'Now eat well, dont leave the house,\nYou can choose your favorite\n food only with one click',
                 ),

                 //Introduction Page 2

                 MyCustomPage(onPress: (){
                   Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false,);
                 },
                     showRow: false,
                     controller: _controller,
                     mainImage: "assets/images/intro2.png",
                     titlePage: 'Good food at a\n cheap price',
                     describePage: 'You can eat at expensive\n restaurants with\n affordable price'
                 ),

               ],
             ),
            ),
          ),
        ],
      ),
    );
  }
}
