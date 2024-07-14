import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/search_controller.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/screens/search/reslte_search.dart';
import 'package:opal_user_app/views/screens/search/search_field.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/models/prediction.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchListMap extends StatefulWidget {
  const SearchListMap({Key? key}) : super(key: key);

  @override
  _SearchListMapState createState() => _SearchListMapState();
}

class _SearchListMapState extends State<SearchListMap> {
  final TextEditingController searchControllerField = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final SearchControllerMap searchController = SearchControllerMap();

  List<Prediction> searchPredictions = [];
  Timer? _debounce;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _getPredictions(String input) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    setState(() {
      isLoading = true;
    });
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      if (input.isEmpty) {
        setState(() {
          searchPredictions = [];
          isLoading = false;
        });
        return;
      }

      final predictions = await searchController.getPlacePredictions(input);
      setState(() {
        searchPredictions = predictions;
        isLoading = false;
      });
    });
  }

  void _onPredictionSelected(Prediction prediction) async {
    setState(() {
      searchControllerField.text = prediction.description;
      searchPredictions = [];
    });

    final googleMapProvider =
        Provider.of<GoogleMapProvider>(context, listen: false);
    final LatLng position = LatLng(prediction.latitude, prediction.longitude);
    final GoogleMapController? mapController = googleMapProvider.mapController;

    if (mapController != null) {
      mapController.animateCamera(CameraUpdate.newLatLng(position));
    }
  }

  @override
  void dispose() {
    searchControllerField.dispose();
    searchFocusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SearchField(
                    controller: searchControllerField,
                    label: 'Search',
                    predictions: searchPredictions,
                    onChanged: (value) => _getPredictions(value),
                    onPredictionSelected: (prediction) {
                      _onPredictionSelected(prediction);
                    },
                    focusNode: searchFocusNode,
                  ),
                ],
              ),
            ),
            if (searchFocusNode.hasFocus)
              Skeletonizer(
                enabled: isLoading,
                child: ResultSearchList(
                  predictions: searchPredictions,
                  onPredictionSelected: (prediction) {
                    _onPredictionSelected(prediction);
                    Navigator.pop(context);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
