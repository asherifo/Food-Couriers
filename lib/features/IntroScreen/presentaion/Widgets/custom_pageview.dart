import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class MyCustomPage extends StatelessWidget {
  const MyCustomPage({super.key, required this.showRow, required this.controller, required this.mainImage, required this.titlePage, required this.describePage, required this.onPress, });
  final String mainImage;
  final String titlePage;
  final String describePage;
  final bool showRow;
  final PageController controller;
 final VoidCallback onPress;



  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    return Center(child: SingleChildScrollView(
      child: Column(

        children: [
          Padding(padding: EdgeInsetsGeometry.only(top: 56,),child: Image.asset(mainImage,height: 434,width: 408,),),
          Center(
            child: SizedBox(
              height: 138,
              width: 260,
              child: Column(
                children: [
                  Center(
                    child: Text(titlePage,style: TextStyle(fontSize: 22,fontWeight: FontWeight(700),color: Colors.black,),textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 8,),
                  Center(
                    child: Text(describePage,style: TextStyle(fontSize: 12,fontWeight: FontWeight(400),color: Colors.black,),textAlign: TextAlign.center,),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(onTap: onPress ,child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Color.fromRGBO(214, 19, 85, 1),),
            height: 57,
            width: 157,

            child: Center(child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight(900),),)),),
          ),
          SizedBox(height: 10,),
          Row(spacing: 100,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child:showRow ? InkWell(onTap:(){
                  Navigator.pushReplacementNamed(context, '/Login');
                } ,child: Text('Skip',style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight(500),
                ),
                ),
                ) : Center()
              ),

              SmoothPageIndicator(
                controller: controller, // نفس الكنترولر بتاع الـ PageView
                count: 2,
                effect: JumpingDotEffect( // هناك أشكال كثيرة مثل Worm, Slide, ExpandingDot
                  activeDotColor: Color(0xFFD81B60),
                  dotColor: Color(0xFFE0E0E0),
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 1),
                child: showRow ? IconButton(onPressed: onPress, icon: Icon(Icons.arrow_forward,color: Color.fromRGBO(214, 19, 85, 1),)) : SizedBox(),
              ),
            ],
          ),
        ],
      ),
    ),) ;
  }
}
