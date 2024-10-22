
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Data/carouselsliderList.dart';
import 'package:realeestateapp/Screens/Chats.dart';
import 'package:realeestateapp/Screens/Favorites.dart';
import 'package:realeestateapp/Screens/Home.dart';
import 'package:realeestateapp/Screens/ProfileScreen.dart';
import 'package:realeestateapp/widgets/CustemNavBar.dart';
import 'package:realeestateapp/Providers/SelectedPageIndexProvider.dart';

class Mainview extends ConsumerStatefulWidget {
  const Mainview({super.key, required this.signinUsername});

  final TextEditingController signinUsername;

  @override
  ConsumerState<Mainview> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<Mainview> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 249),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          ref.read(selectedIndexProvider.notifier).selectIndex(index);
        },
        children: [
          HomeScreen(),
          const FavoritesScreen(),
          const ChatsScreen(),
          Profilescreen(username: widget.signinUsername.text),
        ],
      ),
      bottomNavigationBar: CustemNavBar(pageController: _pageController),
    );
  }
}
