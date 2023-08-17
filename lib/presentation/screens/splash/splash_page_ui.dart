part of 'splash_page.dart';

class _SplashUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ParentWrapperWidget(
      height: SizeConfig.safeAreaScreenHeightWithoutToolbar,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AppImage(
              imageAsset: ImageAsset.splash,
              height: 180.h,
            ),
          ),
          Gap(32.r),
          AppText.displayLarge(StringKey.potatoTimer),
        ],
      ),
    );
  }
}
