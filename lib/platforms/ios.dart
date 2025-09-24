import 'package:munto_social_share/munto_social_share_platform_interface.dart';

class IOS {
  Future<String> shareToWhatsapp(String message) {
    return MuntoSocialSharePlatform.instance.shareToWhatsapp(message);
  }

  Future<String> shareToTelegram(String message) {
    return MuntoSocialSharePlatform.instance.shareToTelegram(message);
  }

  Future<String> shareImageToWhatsApp(String filePath) {
    return MuntoSocialSharePlatform.instance.shareImageToWhatsApp(filePath);
  }

  Future<String> shareToTwitter(String message, String? filePath) {
    return MuntoSocialSharePlatform.instance.shareToTwitter(message, filePath);
  }

  Future<String> shareToInstagramDirect(String message) {
    return MuntoSocialSharePlatform.instance.shareToInstagramDirect(message);
  }

  Future<String> shareToInstagramFeed(String imagePath) {
    return MuntoSocialSharePlatform.instance
        .shareToInstagramFeed("", imagePath);
  }

  Future<String> shareToInstagramReels(String videoPath) {
    return MuntoSocialSharePlatform.instance
        .shareToInstagramFeed("", videoPath);
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

  ///Works only after implementing native code provided here [https://pub.dev/packages/munto_social_share]
  Future<String> shareToTiktokPost(
      String videoFile, String redirectUrl, TiktokFileType tiktokFileType) {
    return MuntoSocialSharePlatform.instance
        .shareToTiktokPost(videoFile, redirectUrl, tiktokFileType);
  }

  Future<String> shareToSystem(String message, {List<String>? filePaths}) {
    return MuntoSocialSharePlatform.instance
        .shareToSystem("", message, filePaths: filePaths);
  }

  Future<String> shareToSMS(String message) {
    return MuntoSocialSharePlatform.instance.shareToSMS(message, filePaths: []);
  }
}
