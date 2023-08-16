part of 'splash_page.dart';

class _SplashUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: FlexibleImage(
            imageAsset: ImageAsset.splash,
            height: 180.h,
          ),
        ),

      ],
    );
  }
}
