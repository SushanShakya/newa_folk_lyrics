import 'package:bloc/bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsCubit extends Cubit<bool> {
  Future<InitializationStatus> init;

  AdsCubit(this.init) : super(false);

  // String get bannerId => "ca-app-pub-3940256099942544/6300978111";
  // String get downloadBannerId => "ca-app-pub-3940256099942544/6300978111";

  // String get interstialId => "ca-app-pub-3940256099942544/1033173712";

  // String get rewardedId => "ca-app-pub-3940256099942544/5224354917";

  String get bannerId => "ca-app-pub-4317773806707889/1505745444";

  String get downloadBannerId => "ca-app-pub-4317773806707889/8870287030";

  String get interstialId => "ca-app-pub-4317773806707889/4078038082";

  String get rewardedId => "ca-app-pub-4317773806707889/8165117595";

  // AdListener get listener => AdListener(
  //       onAdLoaded: (ad) => print(ad),
  //       onAdClosed: (ad) => print("adClosed $ad"),
  //       onAdFailedToLoad: (ad, er) => print("Failed to Load"),
  //       onAdOpened: (ad) => print("opened"),
  //       onAppEvent: (ad, x, d) => print('asdf'),
  //       onApplicationExit: (ad) => print('exit'),
  //       onNativeAdClicked: (ad) => print("clicked"),
  //       onNativeAdImpression: (ad) => print('asd'),
  //       onRewardedAdUserEarnedReward: (ad, add) => print('ad'),
  //     );
}
