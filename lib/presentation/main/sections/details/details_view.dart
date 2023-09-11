import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_comerce/presentation/main/sections/details/details_view_argumennts.dart';
import 'package:e_comerce/presentation/main/sections/details/details_view_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce/presentation/widgets/widgets_utils.dart';

class DetailsView extends StatelessWidget {
  
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailsViewArguments;
    return ChangeNotifierProvider(
      create: (_) => DetailsViewProvier()..initData(id: args.id),
      child: Consumer<DetailsViewProvier>(
        builder: (context, provider, _) {
          return provider.isLoading ? Container() : Scaffold(
            appBar: AppBar(
              leading: _backButton(context),
            ),
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _image(provider, context),
                    _nameAndPrice(provider,args),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.all(30),
                    child: defaultButton(
                      context,
                      onPressed: () {
                        provider.updateCart();
                      },
                      title: "Add to cart",
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  CachedNetworkImage _image(DetailsViewProvier provider, BuildContext context) {
    return CachedNetworkImage(
        imageUrl: provider.item!.imageUrl,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error));
  }

  Container _nameAndPrice(
    DetailsViewProvier provider,
    DetailsViewArguments args,
  ) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              defaultText(
                provider.item!.name,
                size: 16,
                weight: FontWeight.bold,
              ),
              IconButton(
                icon: Icon(
                  provider.item!.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: provider.item!.isFavorite ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  provider.setFavorites(args.id);
                },
              ),
            ],
          ),
          defaultText(
            "${provider.item!.price} ฿",
            size: 16,
          ),
        ],
      ),
    );
  }

  Align _backButton(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
