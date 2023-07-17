import'package:flutter/material.dart';

class SlideImage extends StatelessWidget {
  const SlideImage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/adidas_Sneaker.jpg'),
                  const SizedBox(width: 15,),
                  Image.asset('assets/Crystal_Stone_Jewelry.jpg'),
                  const SizedBox(width: 15,),
                  Image.asset('assets/Cargo_Pants.jpg'),
                  const SizedBox(height: 5,),
                  Image.asset('assets/Surreal_Jewelry_Designer.png'),
                  const SizedBox(width: 15,),
                  Image.asset('assets/Toy_Story_4.jpg'),
                  const SizedBox(height: 5,),
                  Image.asset('assets/off_white_sneakers.jpg'),
                  const SizedBox(width: 15,),
                  Image.asset('assets/baby_driver.jpeg',),
                ],
              ),
            ),
          )
      ),
    );
  }
}
