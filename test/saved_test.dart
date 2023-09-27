import 'package:flutter_test/flutter_test.dart';
import 'package:e_comerce/data/model/product_model.dart';
import 'package:e_comerce/presentation/main/sections/saved/saved_view.dart';

void main() {
  group('SavedView Widget and Data', () {
    
    final productModel = ProductModel(
      productItems: [
        ProductItem(
          id: 13,
          name: "test_product",
          imageUrl: 'imageUrl',
          price: 100,
          isFavorite: false,
        ),
      ],
    );
    
   final item = productModel.productItems[0];
    testWidgets('Home Test Data', (WidgetTester tester) async {
      await tester.pumpWidget(const SavedView());
      expect(find.byType(SavedView), findsOneWidget);
    });

    test('Test Product Name', () {
      expect(item.name, "test_product");
    });


    //TEST FAILED DATA MOCK UP the rith onne would be id:13
    test('Test Product id', () {
      expect(item.id, 1);
    });
  });
}
