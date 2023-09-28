import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sites_model.dart';
export 'sites_model.dart';

class SitesWidget extends StatefulWidget {
  const SitesWidget({
    Key? key,
    this.departmentId,
    this.displayName,
  }) : super(key: key);

  final int? departmentId;
  final String? displayName;

  @override
  _SitesWidgetState createState() => _SitesWidgetState();
}

class _SitesWidgetState extends State<SitesWidget> {
  late SitesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SitesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.safePop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24.0,
          ),
        ),
        title: Text(
          widget.displayName!,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Playfair Display',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: FutureBuilder<ApiCallResponse>(
              future: YelpGroup.businessesSearchCall.call(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final listViewBusinessesSearchResponse = snapshot.data!;
                return Builder(
                  builder: (context) {
                    final searchResults = (YelpGroup.businessesSearchCall
                                .businessName(
                                  listViewBusinessesSearchResponse.jsonBody,
                                )
                                ?.toList() ??
                            [])
                        .take(10)
                        .toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: searchResults.length,
                      itemBuilder: (context, searchResultsIndex) {
                        final searchResultsItem =
                            searchResults[searchResultsIndex];
                        return Container(
                          height: 90.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: FutureBuilder<ApiCallResponse>(
                            future: UssdApiCall.call(
                              objectID: getJsonField(
                                searchResultsItem,
                                r'''$''',
                              ).toString(),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final containerUssdApiResponse = snapshot.data!;
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'RestaurantPage',
                                    queryParameters: {
                                      'artPiece': serializeParam(
                                        containerUssdApiResponse.jsonBody,
                                        ParamType.JSON,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 90.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'RestaurantPage',
                                        queryParameters: {
                                          'artPiece': serializeParam(
                                            searchResultsItem,
                                            ParamType.JSON,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: YelpGroup.businessesSearchCall
                                              .call(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowBusinessesSearchResponse =
                                                snapshot.data!;
                                            return Builder(
                                              builder: (context) {
                                                final businessName = YelpGroup
                                                        .businessesSearchCall
                                                        .businessName(
                                                          listViewBusinessesSearchResponse
                                                              .jsonBody,
                                                        )
                                                        ?.map((e) => e)
                                                        .toList()
                                                        ?.take(5)
                                                        .toList()
                                                        ?.toList() ??
                                                    [];
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      businessName.length,
                                                      (businessNameIndex) {
                                                    final businessNameItem =
                                                        businessName[
                                                            businessNameIndex];
                                                    return Image.network(
                                                      getJsonField(
                                                        containerUssdApiResponse
                                                            .jsonBody,
                                                        r'''$.primaryImageSmall''',
                                                      ),
                                                      width: 56.0,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    );
                                                  }),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
