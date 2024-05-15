part of 'wishlist_bloc.dart';

@immutable
class WishlistState {
  ScreenType? type;
  Failures? failures;
  WishlistModel? wishlistModel;
  DeleteResponse? deleteResponse;

  WishlistState(
      {this.type, this.failures, this.wishlistModel, this.deleteResponse});

  WishlistState copyWith({
    ScreenType? type,
    Failures? failures,
    WishlistModel? wishlistModel,
    DeleteResponse? deleteResponse,
  }) {
    return WishlistState(
      type: type ?? this.type,
      failures: failures ?? this.failures,
      wishlistModel: wishlistModel ?? this.wishlistModel,
      deleteResponse: deleteResponse ?? this.deleteResponse,
    );
  }
}

final class WishlistInitial extends WishlistState {
  WishlistInitial() : super(type: ScreenType.init);
}
