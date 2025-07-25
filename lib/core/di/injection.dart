import 'package:auther/core/di/data_di.dart';
import 'package:auther/core/di/presentation_di.dart';
import 'package:get_it/get_it.dart';

import 'domain_di.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  await setupDataDi();
  await setupDomainDi();
  await setupPresentationDi();
}