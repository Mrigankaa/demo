import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageSlider extends StatelessWidget {
  HomePageSlider({super.key});

  final List<String> item = [
    'assets/4.png',
    'assets/3.png',
    'assets/5.png',
    'assets/2.png',
  ];
  final bool pageEnds = false;
  final controller =
      PageController(viewportFraction: 0.95, initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: PageView(
              padEnds: true,
              controller: controller,
              children: [
                ...item.map(
                  (e) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              e,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: controller,
            count: 4,
            effect: const ExpandingDotsEffect(
              dotHeight: 5,
              dotWidth: 5,
              activeDotColor: Colors.black,
              spacing: 10,
            ),
          )
        ],
      ),
    );
  }
}
