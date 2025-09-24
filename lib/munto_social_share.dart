import 'package:munto_social_share/munto_social_share_platform_interface.dart';
import 'package:munto_social_share/platforms/android.dart';
import 'package:munto_social_share/platforms/ios.dart';

class MuntoSocialShare {
  Android android = Android();
  IOS iOS = IOS();

  Future<Map<String, bool>> getInstalledApps() async {
    return MuntoSocialSharePlatform.instance.getInstalledApps();
  }
}
