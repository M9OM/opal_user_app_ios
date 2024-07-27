import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/utils/helper/text_helper.dart';
import 'package:opal_user_app/views/screens/search/search_list_map.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

Widget buildLocationRow(
  BuildContext context,
  GoogleMapProvider googleMapProvider,
  bool isFrom,
  String title,
  String iconPath,
  Color iconColor,
  bool confirmed,
  VoidCallback onConfirm,
) {
  return GestureDetector(
    onLongPress: () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: const SearchListMap(),
          );
        },
      );
    },
    onTap: () {
      googleMapProvider.updateFrom(isFrom);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconWidget(
                                      isbgColor: true,

                  bgColor: iconColor,
                  iconPath: iconPath,
                ),
              ),
              Expanded(
                child: Text(
                  title.isEmpty
                      ? (isFrom ? 'From?' : 'Where to?')
                      : TextProcessing.truncateWithEllipsis(title, 100),
                  style: TextStyle(
                    color: title.isEmpty
                        ? Colors.black.withOpacity(0.4)
                        : Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                googleMapProvider.updateFrom(isFrom);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: const SearchListMap(),
                    );
                  },
                );
              },
              icon: const Icon(Icons.search),
            ),
            if (title.isNotEmpty && isFrom)
              IconButton(
                onPressed: () {
                  onConfirm();
                  googleMapProvider.updateFrom(!isFrom);
                },
                icon: Icon(
                  Icons.check_circle,
                  color: confirmed ? Colors.green : Colors.grey,
                ),
              ),
          ],
        ),
      ],
    ),
  );
}
