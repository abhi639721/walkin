
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:walkin/Model/dashboardModel.dart';
import 'package:walkin/generated/assets.dart';

class CarouselSliderWidget extends StatefulWidget {
  final BannerSection bannerSection;
  const CarouselSliderWidget({super.key, required this.bannerSection});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Column(

        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200, // Adjust carousel height
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              //aspectRatio: 19 ,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items:
            widget.bannerSection.image.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      width: MediaQuery.of(context).size.width,
                        image,
                      fit: BoxFit.fitWidth,
                    ),
                  );
                },
              );
            }).toList(),
          ),

          indicatorWidget(length: widget.bannerSection.image.length),
        ],
      ),
    );
  }

  Widget indicatorWidget( { required int length  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: List.generate(length, (index) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(index),
          child: Image.asset(
            _current == index
                ? Assets.iconsEllipse12Copy
                :Assets.iconsEllipse12,
            height: 10,
          ),
        );
      }),
    );
  }
}
