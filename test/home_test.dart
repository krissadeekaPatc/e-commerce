import 'package:flutter_test/flutter_test.dart';
import 'package:e_comerce/data/model/product_model.dart';
import 'package:e_comerce/presentation/main/sections/home/home_view.dart';

void main() {
  group('Home Widget and Data', () {
    
    final productModel = ProductModel(
      productItems: [
        ProductItem(
          id: 1,
          name: "test_product",
          imageUrl: 'imageUrl',
          price: 100,
          isFavorite: false,
        ),
      ],
    );
    
   final item =productModel.productItems[0];
    testWidgets('Home Test Data', (WidgetTester tester) async {
      await tester.pumpWidget(const HomeView());
      expect(find.byType(HomeView), findsOneWidget);
    });

    test('Test Product Name', () {
      expect(item.name, "test_product");
    });

    test('Test Product id', () {
      expect(item.id, 1);
    });
  });
}
