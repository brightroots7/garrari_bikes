import '../../screens/home/model.dart';
import 'home_event.dart';
import 'home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<LoadCarousel>((event, emit) async {
      // simulate fetching data
      final items = await fetchCarouselItems();
      emit(state.copyWith(carouselItems: items));
    });
    on<LoadFeaturedProducts>(_onLoadFeaturedProducts);
  }
  void _onLoadFeaturedProducts(LoadFeaturedProducts event, Emitter<HomeState> emit) async {
    final products = await fetchFeaturedProducts();
    emit(state.copyWith(featuredProducts: products));
  }

  Future<List<String>> fetchCarouselItems() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      'https://picsum.photos/400/200?1',
      'https://picsum.photos/400/200?2',
      'https://picsum.photos/400/200?3',
    ];
  }
  Future<List<Product>> fetchFeaturedProducts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Product(
        name: "SpeedX 2000",
        imageUrl: "assets/images/men.png",
        originalPrice: 20000,
        discountedPrice: 15999,
      ),
      Product(
        name: "Mountain Pro",
        imageUrl: "assets/images/women.png",
        originalPrice: 18000,
        discountedPrice: 14500,
      ),
      Product(
        name: "Roadster 350",
        imageUrl: "assets/images/kids.png",
        originalPrice: 24000,
        discountedPrice: 18999,
      ),
    ];
  }
}