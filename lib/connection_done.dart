import 'dart:math';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:sunnydays/call.dart';
import 'package:sunnydays/constants/constants.dart';
import 'package:sunnydays/logic/models/weather_model.dart';
import 'package:universal_html/js.dart';

if (snapshot.connectionState == ConnectionState.done) {
  // if error encountered
  // ignore: prefer_typing_uninitialized_variables
  var snapshot;
  if (snapshot.hasError) {
    return Center(
      child: Text(
        '${snapshot.error.toString()} occurred',
        style: const TextStyle(fontSize: 18),
      ),
    );
  } 
  // if data has no error
  else if (snapshot.hasData) {
   // Extracting data from snapshot object
              final data = snapshot.data as WeatherModel;
              // ignore: prefer_typing_uninitialized_variables
              var textController;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: <Color>[
                      Color.fromARGB(255, 65, 89, 224),
                      Color.fromARGB(255, 83, 92, 215),
                      Color.fromARGB(255, 86, 88, 177),
                      Color(0xfff39060),
                      Color(0xffffb56b),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: SafeArea(
                  child: Column(
                    children: [
                      AnimSearchBar(
                        rtl: true,
                        width: 400,
                        color: const Color(0xffffb56b),
                        textController: textController,
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 26,
                        ),
                        onSuffixTap: () async {
                          textController.text == ""
                              ? log("No city entered" as num)
                              : setState(() {
                                  _myData = getData(false, textController.text);
                                });

                          FocusScope.of(context as BuildContext).unfocus();
                          textController.clear();
                        },
                        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        style: f14RblackLetterSpacing2, onSubmitted: (String ) {  },
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Text(
                                  data.city,
                                  style: f24Rwhitebold,
                                ),
                              ],
                            ),
                            height25,
                            Text(
                              data.desc,
                              style: f16PW,
                            ),
                            height25,
                            Text(
                              "${data.temp}°C",
                              style: f42Rwhitebold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}

// ignore: camel_case_types
class _myData {
}

setState(Null Function() param0) {
}