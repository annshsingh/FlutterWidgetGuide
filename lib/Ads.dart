import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

///Class to manage Ad states throughout the app

class Ads {
  static bool isShown = false;
  static bool _isGoingToBeShown = false;
  static BannerAd _bannerAd;
  static ValueNotifier<bool> isAdShown = ValueNotifier<bool>(false);

  ///Initialize the Admob on startup
  static void initialize() {
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-4000328104346549~8164868587");
  }

  ///Set banner ad on the screen
  static void setBannerAd(String adId) {
    _bannerAd = BannerAd(
      adUnitId: adId,
      size: AdSize.banner,
      targetingInfo: _getMobileAdTargetingInfo(),
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.loaded) {
          isShown = true;
          setIsAdShown(isShown);
          _isGoingToBeShown = false;
        } else if (event == MobileAdEvent.failedToLoad) {
          isShown = false;
          setIsAdShown(isShown);
          _isGoingToBeShown = false;
        }
      },
    );
  }

  ///Show banner ad on the screen
  static void showBannerAd(String adId) {
    if (_bannerAd == null) setBannerAd(adId);
    if (!isShown && !_isGoingToBeShown) {
      _isGoingToBeShown = true;
      _bannerAd
        ..load()
        ..show();
    }
  }

  ///Hide banner ad where you don't want it
  static void hideBannerAd() {
    if (_bannerAd != null && !_isGoingToBeShown) {
      _bannerAd.dispose().then((disposed) {
        isShown = !disposed;
        setIsAdShown(isShown);
      });
      _bannerAd = null;
    }
  }

  ///Ad related information
  static MobileAdTargetingInfo _getMobileAdTargetingInfo() {
    return MobileAdTargetingInfo(
      testDevices: <String>["DBC78393FB0E71331AF178ACE0873FC1"],
      nonPersonalizedAds: true,
      keywords: <String>["Game", "Utility", "Social"],
    );
  }

  ///For the code screen bottom padding
  static void setIsAdShown(bool value) {
    isAdShown.value = value;
  }

  ///For the code screen's ValueListenableBuilders - to manage padding below if ad is loaded
  static ValueNotifier<bool> getIsAdShown() {
    return isAdShown;
  }
}
