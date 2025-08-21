import '../../screens/home/model.dart';

class HomeState {
  final List<String> carouselItems; // image URLs
  final List<Product> featuredProducts;

  HomeState({
    this.carouselItems = const [],
    this.featuredProducts = const [],
  });

  HomeState copyWith({
    List<String>? carouselItems,

    List<Product>? featuredProducts,

  }) {
    return HomeState(
      carouselItems: carouselItems ?? this.carouselItems,

      featuredProducts: featuredProducts ?? this.featuredProducts,

    );
  }
}
