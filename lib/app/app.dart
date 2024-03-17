import 'package:ostello_assignment/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:ostello_assignment/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ostello_assignment/ui/views/signup/signup_view.dart';
import 'package:ostello_assignment/services/local_storage_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: SignupView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocalStorageService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}

// flutter pub run build_runner build --delete-conflicting-outputs
