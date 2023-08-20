part of 'base_stateless_widget.dart';

class _BaseStatefulWidget extends StatefulWidget {
  const _BaseStatefulWidget({
    Key? key,
    required this.baseStore,
    required this.builder,
    required this.onStart,
    required this.onDestroy,
    required this.onConnectivityChange,
    this.args,
  }) : super(key: key);

  final WidgetBuilderCallback builder;
  final BuildContextCallback onStart;
  final BuildContextCallback onDestroy;
  final Function onConnectivityChange;
  final Map<String, dynamic>? args;
  final BaseStore baseStore;

  @override
  State<_BaseStatefulWidget> createState() => _BaseStatefulWidgetState();
}

class _BaseStatefulWidgetState extends State<_BaseStatefulWidget> {
  @override
  void initState() {
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
    widget.onDestroy.call(context);
    super.dispose();
  }
}
