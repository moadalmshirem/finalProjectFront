import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Providers/bookmarksProvider.dart';
import 'package:realeestateapp/Screens/Details_screen.dart';
import 'package:realeestateapp/Screens/Home.dart';
import 'package:realeestateapp/widgets/CustemNavBar.dart';

class BookMarks extends ConsumerWidget {
  BookMarks({super.key});
  final _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 6, 75, 102),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            // leading: IconButton(
            //     onPressed: () => _controller.jumpTo(0),
            //     icon: Icon(
            //       CupertinoIcons.back,
            //       size: 32,
            //       color: Colors.white,
            //     )),
            title: Text(
              "المحفوظات",
              style: TextStyle(
                color: Colors.grey.shade200,
                fontSize: 24,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w500,
              ),
            ),
            toolbarHeight: 100,
          ),
        ),
      ),
      body: bookmarks.isEmpty
          ? const Center(
              child: Text(
                'قائمة المحفوظات فارغة',
                style: TextStyle(
                  fontFamily: "Cairo",
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final item = bookmarks[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.imageUrl1,
                        width: 60,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.description),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        color: Colors.orange,
                        size: 28,
                      ),
                      onPressed: () {
                        ref
                            .read(bookmarksProvider.notifier)
                            .toogleBookmark(item);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('تمت الإزالة من المفضلة')),
                        );
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(selectedItem: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
