part of 'base_stateless_widget.dart';

class _NoInternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: DoublePressToExit(
          child: _GetNoInternetPage(),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}

class _GetNoInternetPage extends StatefulWidget {
  @override
  State<_GetNoInternetPage> createState() => _GetNoInternetPageState();
}

class _GetNoInternetPageState extends State<_GetNoInternetPage> {
  bool connectionCheckInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: AppColors.white,
      width: double.infinity,
      height: SizeConfig.safeAreaScreenHeight,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(StringKeys.makeSureInternetIsOn),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    hideKeyboard(context);
    super.didChangeDependencies();
  }
}
