import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_comerce/presentation/main/sections/details/details_view_argumennts.dart';
import 'package:e_comerce/presentation/main/sections/home/home_view_provider.dart';
import 'package:e_comerce/presentation/resources/routes_manager.dart';
import 'package:e_comerce/presentation/widgets/widgets_utils.dart';


class HomeView extends StatelessWidget {
  
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewProvider()..initData(),
      child: Consumer<HomeViewProvider>(
        builder: (context, provider, _) {
          return provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  body: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        SafeArea(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10,),
                            child: defaultText(
                              'For you',
                              size: 24,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.productModel.productItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                          ),
                          itemBuilder: (context, index) {
                            final product = provider.productModel.productItems[index];
                            final isFavorite = product.isFavorite;
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.productDetails,
                                  arguments: DetailsViewArguments(id: product.id, index: index),
                                ).then((value) {
                                  provider.initData();
                                });
                              },
                              child: Card(
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                              top: Radius.circular(12.0),
                                            ),
                                            child: Image.network(
                                              product.imageUrl,
                                              fit: BoxFit.cover,
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              icon: Icon(
                                                isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: isFavorite
                                                    ? Colors.red
                                                    : Colors.black,
                                              ),
                                              onPressed: () {
                                                provider.setFavorites(index);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        product.name,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${product.price}฿",
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      provider.sortByPrice();
                    },
                  ),
                
                );
        },
      ),
    );
  }
}
