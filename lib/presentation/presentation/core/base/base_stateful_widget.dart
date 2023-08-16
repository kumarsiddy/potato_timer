part of 'base_stateless_widget.dart';

class _BaseStatefulWidget extends StatefulWidget {
  final WidgetBuilderCallback builder;
  final BuildContextCallback onStart;
  final BuildContextCallback onResume;
  final BuildContextCallback onSuspend;
  final BuildContextCallback onDestroy;
  final Function onConnectivityChange;
  final Map<String, dynamic>? args;
  final BaseStore baseStore;

  const _BaseStatefulWidget({
    Key? key,
    required this.baseStore,
    required this.builder,
    required this.onStart,
    required this.onResume,
    required this.onSuspend,
    required this.onDestroy,
    required this.onConnectivityChange,
    this.args,
  }) : super(key: key);

  @override
  State<_BaseStatefulWidget> createState() => _BaseStatefulWidgetState();
}

class _BaseStatefulWidgetState extends State<_BaseStatefulWidget> {
  late final AppLifeCycleObserver _appLifeCycleObserver;

  @override
  void initState() {
    _appLifeCycleObserver = AppLifeCycleObserver(
      suspendingCallBack: () async {
        widget.onSuspend.call(context);
      },
      resumeCallBack: () async {
        if (!mounted) return;
        widget.onResume.call(context);
      },
    );

    WidgetsBinding.instance.addObserver(
      _appLifeCycleObserver,
    );

    widget.onStart.call(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (ctx) {
        return Stack(
          alignment: Alignment.center,
          children: [
            widget.builder(context),
            if (widget.baseStore.loading == true) const SpinkitLoader(),
            if (widget.baseStore.connectionStatus?.working == false)
              _NoInternetPage(),
          ],
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    // Initializing SizeConfig for the first time
    SizeConfig.init(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(
      _appLifeCycleObserver,
    );
    widget.onDestroy.call(context);
    super.dispose();
  }
}
