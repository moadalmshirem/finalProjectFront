import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Data/carouselSliderData.dart';
import 'package:realeestateapp/Providers/selectedItemProvider.dart';
import 'package:realeestateapp/Screens/Details_screen.dart';

class CarouselSliderWidget extends ConsumerStatefulWidget {
  CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

int _currentIndex = 0;

class _CarouselSliderWidgetState extends ConsumerState<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: CarouselSliderData.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      ref.read(selectedItemProvider.notifier).state = item;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          selectedItem: item,
                        ),
                      ));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(item.imageUrl1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 170.0,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
