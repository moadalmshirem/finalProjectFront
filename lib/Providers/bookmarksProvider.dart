import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Data/carouselsliderList.dart';

class BookmarksNotifire extends StateNotifier<List<Item>> {
  BookmarksNotifire() : super([]);

  bool toogleBookmark(Item item) {
    final ItemIsBookmarked = state.contains(item);

    if (ItemIsBookmarked) {
      state = state
          .where((bitem) => bitem.id != item.id)
          .toList(); //bitem is not the same but just to clear any conflex that can be happend
      return false;
    } else {
      state = [...state, item];
      return true;
    }
  }
}

final bookmarksProvider =
    StateNotifierProvider<BookmarksNotifire, List<Item>>((ref) {
  return BookmarksNotifire();
});
