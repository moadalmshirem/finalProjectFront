import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Data/carouselsliderList.dart';
import 'package:realeestateapp/Providers/bookmarksProvider.dart';
import 'package:realeestateapp/Screens/Chats.dart';
import 'package:realeestateapp/Screens/BookMarks.dart';
import 'package:realeestateapp/widgets/Reservation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.selectedItem});
  final Item selectedItem;

  void _showReservation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Reservation();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);
    final isBookmarked = bookmarks.contains(selectedItem);
    final bookmarksNotifier = ref.read(bookmarksProvider.notifier);
    Size size = MediaQuery.of(context).size;
    PageController _Controller = PageController();
    final List<String> images = [
      selectedItem.imageUrl1,
      selectedItem.imageUrl2,
      selectedItem.imageUrl3,
      selectedItem.imageUrl4,
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Container(
                  width: size.width,
                  height: size.height * 0.5,
                  child: PageView(
                    controller: _Controller,
                    children: images.map((url) {
                      return Image.network(url, fit: BoxFit.cover);
                    }).toList(),
                  ),
                ),
              ),
              Positioned(
                bottom: 25,
                right: 140,
                left: 100,
                child: SmoothPageIndicator(
                  controller: _Controller,
                  count: images.length,
                  effect: WormEffect(
                    dotHeight: 13,
                    dotWidth: 13,
                    activeDotColor: const Color.fromARGB(255, 6, 75, 102),
                    dotColor: Colors.grey.shade100,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          size: 32, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  bookmarksNotifier.toogleBookmark(selectedItem);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 3),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isBookmarked
                                ? 'تمت الإزالة من القائمة بنجاح'
                                : 'تمت الإضافة إلى المفضلة بنجاح',
                            style: TextStyle(fontFamily: "Cairo", fontSize: 13),
                          ),
                          TextButton(
                            onPressed: () {
                              if (!isBookmarked) {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => BookMarks()));
                              }
                            },
                            child: isBookmarked
                                ? Text("")
                                : Text(
                                    "إذهب إلى المفضلة",
                                    style: TextStyle(
                                      fontFamily: "Cairo",
                                      fontSize: 13,
                                      color: Colors.orange.shade200,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 45,
                  height: 45,
                  child: Center(
                    child: Icon(
                      isBookmarked
                          ? CupertinoIcons.bookmark_fill
                          : CupertinoIcons.bookmark,
                      size: 30,
                      color: isBookmarked
                          ? Colors.orange
                          : Color.fromARGB(255, 6, 75, 102),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  selectedItem.title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Cairo"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: " ${selectedItem.price} دل",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Cairo",
                          ),
                        ),
                        const TextSpan(
                          text: " / شهريا",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              fontFamily: "Cairo"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: Container(
              margin: const EdgeInsets.all(0),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildFeatureBox("المساحة ${selectedItem.Area}م"),
                    SizedBox(width: 35),
                    buildFeatureBox("غرف النوم :  ${selectedItem.rooms}"),
                    SizedBox(width: 35),
                    buildFeatureBox("حمامات :  ${selectedItem.bathrooms}"),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  selectedItem.description,
                  style: const TextStyle(
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "حالة العقار :",
                      style: TextStyle(
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' ${selectedItem.isAvailable ? 'متاحة' : 'غير متاحة'}',
                      style: TextStyle(
                        color: selectedItem.isAvailable
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Cairo",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Color.fromARGB(255, 6, 75, 102),
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextButton(
                    onPressed: selectedItem.isAvailable
                        ? () => _showReservation(context)
                        : null,
                    child: Text(
                      selectedItem.isAvailable ? "حجز الآن" : "غير متاح",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Cairo",
                        color: selectedItem.isAvailable
                            ? Color.fromARGB(255, 6, 75, 102)
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 6, 75, 102),
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => ChatsScreen()),
                          );
                        },
                        icon: Icon(
                          CupertinoIcons.chat_bubble,
                          color: Colors.black54,
                        ),
                        label: Text(
                          "مراسلة",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontFamily: "Cairo"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFeatureBox(String text) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color.fromARGB(255, 6, 75, 102),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
        ),
      ),
    );
  }
}
