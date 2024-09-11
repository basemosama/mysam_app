import 'package:mysam_app/app/wishlist/data/model/db/database_wishlist_item.dart';
import 'package:mysam_app/app/wishlist/data/model/ui/wishlist.dart';

extension DatabaseWishlistToWishlistItemMapper on DatabaseWishlistItem {
  WishlistItem toWishlistItem() {
    return WishlistItem(
      id: id,
      name: name,
      imageUrl: imageUrl,
      date: date,
    );
  }
}

extension WishlistItemToDatabaseWishlistMapper on WishlistItem {
  DatabaseWishlistItem toDatabaseWishlistItem() {
    return DatabaseWishlistItem(
      id: id,
      name: name,
      imageUrl: imageUrl,
      date: date,
    );
  }
}
