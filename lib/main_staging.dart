import 'package:cathering_mobile/app/app.dart';
import 'package:cathering_mobile/bootstrap.dart';
import 'package:flutter/widgets.dart';
import 'package:cathering_mobile/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  bootstrap(() => const App());
}
