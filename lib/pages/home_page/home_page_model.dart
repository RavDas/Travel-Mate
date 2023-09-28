import '/components/mylist_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for mylist component.
  late MylistModel mylistModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mylistModel = createModel(context, () => MylistModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
    mylistModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
