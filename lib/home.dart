import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadAd();
  }

  void loadAd() async {
    _bannerAd = await BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdFailedToLoad: (ad, error) {
          print("Ad Loading Failed!! ${error.message}");
        },
        onAdLoaded: (ad) {
          print("Ad Loading Success!!");
        },
      ),
      request: AdRequest(),
    )
      ..load();
    setState(() {});
  }

  // ca-app-pub-2073225096026157/5337451575  add id

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChitChat"),
      ),
      body: Stack(
        children: [
          Container(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bannerAd != null
                ? SizedBox(
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(
                      ad: _bannerAd!,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
