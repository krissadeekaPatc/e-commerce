import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:e_comerce/presentation/main/sections/cart/check_out/check_out_view_arguments.dart';
import 'package:e_comerce/presentation/main/sections/cart/check_out/check_out_view_provider.dart';
import 'package:e_comerce/presentation/widgets/widgets_utils.dart';

class CheckOutView extends StatelessWidget {
  
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final args = ModalRoute.of(context)!.settings.arguments as CheckOutViewArguments;
    
    return ChangeNotifierProvider(
      create: (_) => CheckOutViewProvier()..initData(args.price),
      child: Consumer<CheckOutViewProvier>(
        builder: (context, provider, _) {
          return provider.isLoading
              ? Container()
              : Scaffold(
                  appBar: AppBar(
                    leading: _backButton(context),
                    title: defaultText(
                      'Check out',
                      size: 24,
                      weight: FontWeight.bold,
                    ),
                    centerTitle: false,
                  ),
                  body: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),
                        QrImageView(
                          data: provider.qrCode,
                          size: 300,
                        ),
                        const SizedBox(height: 30),
                        _description(args),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }


  Widget _description(
    CheckOutViewArguments args,
  ) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          defaultText(
            "Scan and Pay",
            size: 32,
            weight: FontWeight.bold,
          ),
          defaultText(
            "${NumberFormat().format(args.price)} ฿",
            size: 32,
            weight: FontWeight.bold,
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
