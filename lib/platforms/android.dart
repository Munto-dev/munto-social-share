import 'package:munto_social_share/munto_social_share_platform_interface.dart';

class Android {
  Future<String> shareToWhatsapp(String message, String? filePath) {
    return MuntoSocialSharePlatform.instance
        .shareToWhatsappAndroid(message, filePath);
  }

  Future<String> shareFilesToWhatsapp(List<String> filePaths) {
    return MuntoSocialSharePlatform.instance
        .shareToWhatsappAndroidMultiFiles(filePaths);
  }

  Future<String> shareToTelegram(String message, String? filePath) {
    return MuntoSocialSharePlatform.instance
        .shareToTelegramAndroid(message, filePath);
  }

  Future<String> shareFilesToTelegram(List<String> filePaths) {
    return MuntoSocialSharePlatform.instance
        .shareToTelegramAndroidMultiFiles(filePaths);
  }

  Future<String> shareToTwitter(String message, String? filePath) {
    return MuntoSocialSharePlatform.instance
        .shareToTwitterAndroid(message, filePath);
  }

  Future<String> shareToInstagramDirect(String message) {
    return MuntoSocialSharePlatform.instance.shareToInstagramDirect(message);
  }

  Future<String> shareToInstagramFeed(String message, String? filePath) {
    return MuntoSocialSharePlatform.instance
        .shareToInstagramFeed(message, filePath);
  }

  Future<String> shareFilesToInstagramFeed(List<String> imagePaths) {
    return MuntoSocialSharePlatform.instance
        .shareToInstagramFeedAndroid(imagePaths);
  }

  Future<String> shareToInstagramReels(List<String> videoPaths) {
    return MuntoSocialSharePlatform.instance
        .shareToInstagramFeedAndroid(videoPaths);
  }

  Future<String> shareToMessenger(String message) {
    return MuntoSocialSharePlatform.instance.shareToMessenger(message);
  }

  Future<String> copyToClipBoard(String message) {
    return MuntoSocialSharePlatform.instance.copyToClipBoard(message);
  }

  Future<String> shareToFacebook(String hashtag, List<String> filePaths) {
    return MuntoSocialSharePlatform.instance
        .shareToFacebook(hashtag, filePaths);
  }

  Future<String> shareToInstagramStory(String appId,
      {String? stickerImage,
      String? backgroundImage,
      String? backgroundVideo,
      String? backgroundTopColor,
      String? backgroundBottomColor,
      String? attributionURL}) {
    return MuntoSocialSharePlatform.instance.shareToInstagramStory(appId,
        stickerImage: stickerImage,
        backgroundImage: backgroundImage,
        backgroundVideo: backgroundVideo,
        backgroundTopColor: backgroundTopColor,
        backgroundBottomColor: backgroundBottomColor,
        attributionURL: attributionURL);
  }

  Future<String> shareToFacebookStory(String appId,
      {String? stickerImage,
      String? backgroundImage,
      String? backgroundVideo,
      String? backgroundTopColor,
      String? backgroundBottomColor,
      String? attributionURL}) {
    return MuntoSocialSharePlatform.instance.shareToFacebookStory(appId,
        stickerImage: stickerImage,
        backgroundImage: backgroundImage,
        backgroundVideo: backgroundVideo,
        backgroundTopColor: backgroundTopColor,
        backgroundBottomColor: backgroundBottomColor,
        attributionURL: attributionURL);
  }

  ///works only for android
  Future<String> shareToTiktokStatus(List<String> filePaths) {
    return MuntoSocialSharePlatform.instance.shareToTiktokStatus(filePaths);
  }

  Future<String> shareToSystem(String title, String message, String? filePath) {
    return MuntoSocialSharePlatform.instance
        .shareToSystemAndroid(title, message, filePath);
  }

  Future<String> shareFilesToSystem(String title, List<String> filePaths) {
    return MuntoSocialSharePlatform.instance
        .shareToSystemAndroidMultifiles(title, filePaths);
  }

  Future<String> shareToSMS(String message, String? filePath) {
    return MuntoSocialSharePlatform.instance
        .shareToSMSAndroid(message, filePath);
  }

  Future<String> shareFilesToSMS(List<String> filePaths) {
    return MuntoSocialSharePlatform.instance
        .shareToSMSAndroidMultifiles(filePaths);
  }
}
