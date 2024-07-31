// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  String get bannerId => "ca-app-pub-3940256099942544/6300978111";
  // String get bannerId => "ca-app-pub-4317773806707889/6628993380";

  BannerAd _showBannerAd(int bannerWidth, String bannerId) {
    final bannerAd = BannerAd(
      size: AdSize(width: bannerWidth, height: 70),
      adUnitId: bannerId,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {},
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {},
      ),
    );

    // Start loading.
    bannerAd.load();
    return bannerAd;
  }

  BannerAd showHomeBanner(int w) {
    return _showBannerAd(w, bannerId);
  }

  // void showInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: cubit.interstialId,
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (a) {
  //         a.show();
  //       },
  //       onAdFailedToLoad: (a) {},
  //     ),
  //   );
  // }

  // Future<void> showVideoAd(
  //   void Function(AdWithoutView, RewardItem) onUserEarnedReward,
  // ) {
  //   return RewardedAd.load(
  //     adUnitId: cubit.rewardedId,
  //     request: const AdRequest(),
  //     rewardedAdLoadCallback: RewardedAdLoadCallback(
  //       onAdLoaded: (a) {
  //         a.show(onUserEarnedReward: onUserEarnedReward);
  //       },
  //       onAdFailedToLoad: (al) {},
  //     ),
  //   );
  // }
}
