import 'package:flutter/material.dart';
import 'package:online_store/controllers/banner_controller.dart';
import 'package:online_store/models/bannr_model.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  //A future that will hold list of banners once loaded from API
  late Future<List<BannerModel>> futuresBanner;

  @override
  void initState() {
    super.initState();
    futuresBanner = BannerController().loadBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 210, 209, 209),
        borderRadius: BorderRadius.circular(8),
      ),
      child: FutureBuilder(
      future: futuresBanner,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No Banners'),
          );
        } else {
          final banners = snapshot.data!;
          return PageView.builder(
              itemCount: banners.length,
              
              itemBuilder: (context, index) {
                final banner = banners[index];
                return Image.network(
                  banner.image,
                  fit: BoxFit.cover,
                );
              });
        }
      }),
    );
  }
}
