import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:appinio_social_share/appinio_social_share.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Social Share Test",
      home: const SocialShareHomePage(),
    );
  }
}

class SocialShareHomePage extends StatefulWidget {
  const SocialShareHomePage({Key? key}) : super(key: key);

  @override
  State<SocialShareHomePage> createState() => _SocialShareHomePageState();
}

class _SocialShareHomePageState extends State<SocialShareHomePage> {
  AppinioSocialShare appinioSocialShare = AppinioSocialShare();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social Share Test"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Instagram 공유 테스트",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Instagram Story 공유
              ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text("Instagram Story로 공유"),
                onPressed: shareToInstagramStory,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // Instagram Feed 공유
              ElevatedButton.icon(
                icon: const Icon(Icons.photo),
                label: const Text("Instagram Feed로 공유"),
                onPressed: shareToInstagramFeed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // Instagram Reel 공유
              ElevatedButton.icon(
                icon: const Icon(Icons.video_camera_back),
                label: const Text("Instagram Reel로 공유"),
                onPressed: shareToInstagramReel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // Instagram Direct 공유
              ElevatedButton.icon(
                icon: const Icon(Icons.message),
                label: const Text("Instagram Direct로 공유"),
                onPressed: shareToInstagramDirect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "기타 공유 옵션",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // WhatsApp 공유 (수정된 버전)
              ElevatedButton.icon(
                icon: const Icon(Icons.chat),
                label: const Text("WhatsApp으로 공유"),
                onPressed: shareToWhatsApp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // Facebook 공유
              ElevatedButton.icon(
                icon: const Icon(Icons.facebook),
                label: const Text("Facebook으로 공유"),
                onPressed: shareToFacebook,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800]!,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // 설치된 앱 확인
              ElevatedButton.icon(
                icon: const Icon(Icons.apps),
                label: const Text("설치된 앱 확인"),
                onPressed: checkInstalledApps,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600]!,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Instagram Story 공유
  void shareToInstagramStory() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);

      if (result != null && result.paths.isNotEmpty) {
        String filePath = result.paths[0]!;

        if (Platform.isIOS) {
          await appinioSocialShare.iOS.shareToInstagramStory(
            "your_facebook_app_id", // Facebook App ID가 필요합니다
            stickerImage: filePath, // 스티커 이미지
            backgroundImage: filePath, // 배경 이미지 (선택사항)
            backgroundTopColor: "#FF0000", // 배경 색상 (선택사항)
            backgroundBottomColor: "#00FF00", // 배경 색상 (선택사항)
          );
        } else {
          await appinioSocialShare.android.shareToInstagramStory(
            "your_facebook_app_id", // Facebook App ID가 필요합니다
            stickerImage: filePath, // 스티커 이미지
            backgroundImage: filePath, // 배경 이미지 (선택사항)
            backgroundTopColor: "#FF0000", // 배경 색상 (선택사항)
            backgroundBottomColor: "#00FF00", // 배경 색상 (선택사항)
          );
        }

        _showSuccessMessage("Instagram Story 공유 완료!");
      }
    } catch (e) {
      _showErrorMessage("Instagram Story 공유 실패: $e");
    }
  }

  // Instagram Feed 공유
  void shareToInstagramFeed() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: true);

      if (result != null && result.paths.isNotEmpty) {
        List<String> filePaths =
            result.paths.where((path) => path != null).cast<String>().toList();

        if (Platform.isIOS) {
          // iOS: shareToInstagramFeed(String imagePath) - 하나의 이미지만
          await appinioSocialShare.iOS.shareToInstagramFeed(filePaths.first);
        } else {
          // Android: shareFilesToInstagramFeed(List<String> imagePaths) - 여러 이미지
          await appinioSocialShare.android.shareFilesToInstagramFeed(filePaths);
        }

        _showSuccessMessage("Instagram Feed 공유 완료!");
      }
    } catch (e) {
      _showErrorMessage("Instagram Feed 공유 실패: $e");
    }
  }

  // Instagram Reel 공유
  void shareToInstagramReel() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.video, allowMultiple: true);

      if (result != null && result.paths.isNotEmpty) {
        List<String> filePaths =
            result.paths.where((path) => path != null).cast<String>().toList();

        if (Platform.isIOS) {
          // iOS: shareToInstagramReels(String videoPath) - 하나의 비디오만
          await appinioSocialShare.iOS.shareToInstagramReels(filePaths.first);
        } else {
          // Android: shareToInstagramReels(List<String> videoPaths) - 여러 비디오
          await appinioSocialShare.android.shareToInstagramReels(filePaths);
        }

        _showSuccessMessage("Instagram Reel 공유 완료!");
      }
    } catch (e) {
      _showErrorMessage("Instagram Reel 공유 실패: $e");
    }
  }

  // Instagram Direct 공유
  void shareToInstagramDirect() async {
    try {
      if (Platform.isIOS) {
        await appinioSocialShare.iOS
            .shareToInstagramDirect("안녕하세요! 테스트 메시지입니다.");
      } else {
        await appinioSocialShare.android
            .shareToInstagramDirect("안녕하세요! 테스트 메시지입니다.");
      }

      _showSuccessMessage("Instagram Direct 공유 완료!");
    } catch (e) {
      _showErrorMessage("Instagram Direct 공유 실패: $e");
    }
  }

  // WhatsApp 공유 (수정된 버전)
  void shareToWhatsApp() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);

      if (result != null && result.paths.isNotEmpty) {
        String filePath = result.paths[0]!;

        if (Platform.isIOS) {
          // iOS: shareImageToWhatsApp(String filePath) - 이미지만
          await appinioSocialShare.iOS.shareImageToWhatsApp(filePath);
        } else {
          // Android: shareToWhatsapp(String message, String? filePath)
          await appinioSocialShare.android
              .shareToWhatsapp("테스트 메시지입니다!", filePath);
        }

        _showSuccessMessage("WhatsApp 공유 완료!");
      }
    } catch (e) {
      _showErrorMessage("WhatsApp 공유 실패: $e");
    }
  }

  // Facebook 공유
  void shareToFacebook() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: true);

      if (result != null && result.paths.isNotEmpty) {
        List<String> filePaths =
            result.paths.where((path) => path != null).cast<String>().toList();

        if (Platform.isIOS) {
          await appinioSocialShare.iOS
              .shareToFacebook("페이스북 테스트 메시지입니다!", filePaths);
        } else {
          await appinioSocialShare.android
              .shareToFacebook("페이스북 테스트 메시지입니다!", filePaths);
        }

        _showSuccessMessage("Facebook 공유 완료!");
      }
    } catch (e) {
      _showErrorMessage("Facebook 공유 실패: $e");
    }
  }

  // 설치된 앱 확인
  void checkInstalledApps() async {
    try {
      Map<String, bool> installedApps =
          await appinioSocialShare.getInstalledApps();

      if (!mounted) return; // mounted 체크 추가

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("설치된 앱 목록"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: installedApps.entries
                  .map((entry) => ListTile(
                        title: Text(entry.key),
                        trailing: entry.value
                            ? const Icon(Icons.check, color: Colors.green)
                            : const Icon(Icons.close, color: Colors.red),
                      ))
                  .toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("확인"),
            ),
          ],
        ),
      );
    } catch (e) {
      _showErrorMessage("설치된 앱 확인 실패: $e");
    }
  }

  void _showSuccessMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
