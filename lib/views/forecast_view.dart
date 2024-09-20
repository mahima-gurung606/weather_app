import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../constants/contant.dart';
import '../view_model/forecast_vm.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({super.key});

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  ForecastVM cs = Get.find<ForecastVM>();

  @override
  void initState() {
    super.initState();
    cs.vmGetForecastData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forecast"),
        centerTitle: true,
      ),
      body: GetBuilder<ForecastVM>(builder: (_) {
        return customWidget();
      }),
    );
  }

  Widget customWidget() {
    if (cs.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (cs.forecastData.isEmpty) {
      return Center(
        child: Text("No data found"),
      );
    } else {
      return ListView.builder(
        itemCount: cs.forecastData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final forecast = cs.forecastData[index];
          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.green,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "${iconStartPoint}${forecast.icon}${iconEndPoint}"),
              ),
              title: Text("Temperature: ${forecast.temperature}"),
              subtitle: Text(Jiffy.parse("${forecast.dateTime}")
                  .format(pattern: 'MMMM do yyyy')),
              trailing: Text(Jiffy.parse("${forecast.dateTime}")
                  .format(pattern: 'h:mm:ss a')),
            ),
          );
        },
      );
    }
  }
}
