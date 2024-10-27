import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Data/carouselSliderData.dart';
import 'package:realeestateapp/Data/carouselsliderList.dart';
import 'package:realeestateapp/Providers/bookmarksProvider.dart';
import 'package:realeestateapp/Screens/Details_screen.dart';

class GridItem extends ConsumerWidget {
  final List<Item> gridItems;

  GridItem({
    super.key,
    required this.gridItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);
    final bookmarksNotifier = ref.read(bookmarksProvider.notifier);

    return SizedBox(
      height: 450,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: CarouselSliderData.length,
        itemBuilder: (context, index) {
          final item = CarouselSliderData[index];
          // Check if the current item is bookmarked
          final isBookmarked = bookmarks.contains(item);

          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => DetailScreen(selectedItem: item)));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 6, 75, 102).withOpacity(0.1),
                  width: 0.7,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.network(
                        item.imageUrl1,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(fontFamily: "Cairo"),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(" ${item.price}دل",
                                style: TextStyle(fontFamily: "Cairo")),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            // Toggle the bookmark status of the item
                            final wasBookmarked =
                                bookmarksNotifier.toogleBookmark(item);
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 3),
                                content: Text(
                                  wasBookmarked
                                      ? 'تمت الإضافة إلى المفضلة بنجاح'
                                      : 'تمت الإزالة من القائمة بنجاح',
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: isBookmarked ? Colors.orange : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
