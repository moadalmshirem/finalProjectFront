import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Providers/SelectedPageIndexProvider.dart';
import 'package:realeestateapp/widgets/Reservation.dart';

class CustemNavBar extends ConsumerWidget {
  final PageController pageController;

  const CustemNavBar({super.key, required this.pageController});

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
    var _selectedIndex = ref.watch(selectedIndexProvider);

    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
            top: Radius.circular(30),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 6, 75, 102),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(selectedIndexProvider.notifier).selectIndex(0);
                      pageController.jumpTo(0);
                    },
                    icon: Icon(
                      CupertinoIcons.home,
                      color: _selectedIndex == 0
                          ? Colors.blueGrey.shade300
                          : Colors.grey.shade200,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(selectedIndexProvider.notifier).selectIndex(1);
                      pageController.jumpToPage(1);
                    },
                    icon: Icon(
                        _selectedIndex == 1
                            ? CupertinoIcons.bookmark_fill
                            : CupertinoIcons.bookmark,
                        color:
                            _selectedIndex == 1 ? Colors.orange : Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      _showReservation(context);
                    },
                    icon: Icon(
                      CupertinoIcons.search,
                      color: _selectedIndex == 2
                          ? Colors.blueGrey.shade300
                          : Colors.grey.shade200,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(selectedIndexProvider.notifier).selectIndex(3);
                      pageController.jumpToPage(3);
                    },
                    icon: Icon(
                      CupertinoIcons.person_fill,
                      color: _selectedIndex == 3
                          ? Colors.blueGrey.shade300
                          : Colors.grey.shade200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
