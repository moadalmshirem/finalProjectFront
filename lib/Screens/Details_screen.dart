import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Data/carouselsliderList.dart';
import 'package:realeestateapp/Providers/bookmarksProvider.dart';
import 'package:realeestateapp/Screens/Chats.dart';
import 'package:realeestateapp/Screens/Favorites.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class DetailScreen extends ConsumerWidget {
  final Item selectedItem;

  const DetailScreen({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);
    final isBookmarked = bookmarks.contains(selectedItem);
    final bookmarksNotifier = ref.read(bookmarksProvider.notifier);
    Size size = MediaQuery.of(context).size;
    PageController _controller = PageController();
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
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(30),
  ),
  child: Container(
    width: size.width,
    height: size.height * 0.5,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: PageView(
      controller: _controller,
      physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        Image.network(
          
          selectedItem.imageUrl1,
          fit: BoxFit.cover,
        ),
        Image.network(
          selectedItem.imageUrl2,
          fit: BoxFit.cover,
        ),
        Image.network(
          selectedItem.imageUrl3,
          fit: BoxFit.cover,
        ),
        Image.network(
          selectedItem.imageUrl4,
          fit: BoxFit.cover,
        ),
      ],
    ),
  ),
),
Positioned(
  bottom: 25,
  right: 140,
  left: 100,
  child: SmoothPageIndicator(
    controller: _controller,
     count:images.length,
     effect:  WormEffect(
                  dotHeight: 13,
                  dotWidth: 13,
                  type: WormType.thinUnderground,
                  activeDotColor: Color.fromARGB(255, 6, 75, 102),
                  dotColor: Colors.grey.shade100
                ),
                
    ),
    ),


              // Bookmark icon
              Positioned(
                top: 40,
                right: 16,
                child: InkWell(
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
                            ),
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>FavoritesScreen()));
                            }, child: Text("إذهب إلى المفضلة",style: TextStyle(color: Colors.orange.shade200),))
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromARGB(255, 6, 75, 102),
                        width: 1.5,
                      ),
                    ),
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
              ),
              // Back button
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
                        color: Color.fromARGB(255, 6, 75, 102),
                        width: 1.5,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 6, 75, 102),
                      ),
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
                    fontWeight: FontWeight.w700,
                  ),
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
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: " / شهريا",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text(" المساحة ${selectedItem.Area}م  "),
                        ),
                      ),
                      SizedBox(width: 35),
                      Container(
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text("غرف النوم :  ${selectedItem.rooms.toString()} "),
                        ),
                      ),
                      SizedBox(width: 35),
                      Container(
                        width: 85,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text("حمامات :  ${selectedItem.bathrooms.toString()}  "),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        selectedItem.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Cairo',
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('عدد الغرف: ${selectedItem.rooms}'),
                      Text('عدد الحمامات: ${selectedItem.bathrooms}'),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("حالة العقار :"),
                          Text(
                            ' ${selectedItem.isAvailable ? 'متاحة' : 'غير متاحة'}',
                            style: TextStyle(
                              color: selectedItem.isAvailable
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          // Booking button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 220,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: selectedItem.isAvailable ? () {} : null,
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: selectedItem.isAvailable
                            ? Color.fromARGB(255, 6, 75, 102)
                            : Colors.grey.shade200,
                      ),
                      child: Text(
                        selectedItem.isAvailable
                            ? "حجز الآن"
                            : "العقار  ليست متاحة",
                        style: TextStyle(
                          fontSize: 20,
                          color: selectedItem.isAvailable
                              ? Colors.white
                              : Colors.black38,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => ChatsScreen()),
                  );
                },
                label: Text(
                  'تواصل معنا',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 6, 75, 102), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    CupertinoIcons.chat_bubble_fill,
                    color: Color.fromARGB(255, 6, 75, 102),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}