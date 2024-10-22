import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Providers/SelectedPageIndexProvider.dart';

class CustemNavBar extends ConsumerWidget {
  final PageController pageController;

  const CustemNavBar({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _selectedIndex = ref.watch(selectedIndexProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color:   Color.fromARGB(255, 6, 75, 102),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Home Icon
              IconButton(
                onPressed: () {
                  ref.read(selectedIndexProvider.notifier).selectIndex(0);
                  pageController.jumpTo(0); // Jump to page 0
                },
                icon: Icon(
                  CupertinoIcons.home,
                  color: _selectedIndex == 0
                      ? Colors.blueGrey.shade300  // Active state color
                      : Colors.grey.shade200, // Inactive state color
                ),
              ),

              // Search Icon
              IconButton(
                onPressed: () {
                  ref.read(selectedIndexProvider.notifier).selectIndex(1);
                  pageController.jumpToPage(1); // Jump to page 1
                },
                icon: Icon(
                  _selectedIndex == 1 ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,

                  color: _selectedIndex == 1
                      ? Colors.orange // Active state color
                      : Colors.white // Inactive state color
                ),
              ),

              // Message Icon
              IconButton(
                onPressed: () {
                  ref.read(selectedIndexProvider.notifier).selectIndex(2);
                  pageController.jumpToPage(2); // Jump to page 2
                },
                icon: Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  color: _selectedIndex == 2
                      ? Colors.blueGrey.shade300 // Active state color
                      : Colors.grey.shade200, // Inactive state color
                ),
              ),

              // Profile Icon
              IconButton(
                onPressed: () {
                  ref.read(selectedIndexProvider.notifier).selectIndex(3);
                  pageController.jumpToPage(3); // Jump to page 3
                },
                icon: Icon(
                  CupertinoIcons.person_fill,
                  color: _selectedIndex == 3
                      ? Colors.blueGrey.shade300 // Active state color
                      : Colors.grey.shade200, // Inactive state color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
