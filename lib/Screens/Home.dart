import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Data/carouselSliderData.dart';

import 'package:realeestateapp/widgets/CarouselSlider.dart';
import 'package:realeestateapp/widgets/GridItem.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(seconds: 4),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 6, 75, 102),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Text(
                "الصفحة الرئيسة",
                style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 28,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w500),
              ),
              toolbarHeight: 100,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSliderWidget(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "تصفح الفئات",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 6, 75, 102),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildCategoryCard("منازل"),
                          SizedBox(width: 25),
                          _buildCategoryCard("فلل"),
                          SizedBox(width: 25),
                          _buildCategoryCard("إستراحات"),
                          SizedBox(width: 25),
                          _buildCategoryCard("شقق"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GridItem(
                gridItems: CarouselSliderData,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title) {
    return Container(
      width: 85,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 6, 75, 102)),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontFamily: "Cairo", fontWeight: FontWeight.w600),
      )),
    );
  }
}
