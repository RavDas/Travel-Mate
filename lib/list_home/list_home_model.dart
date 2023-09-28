import '/components/mylist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list_home_widget.dart' show ListHomeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListHomeModel extends FlutterFlowModel<ListHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchBar widget.
  TextEditingController? searchBarController;
  String? Function(BuildContext, String?)? searchBarControllerValidator;
  // Model for mylist component.
  late MylistModel mylistModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mylistModel = createModel(context, () => MylistModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchBarController?.dispose();
    mylistModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
