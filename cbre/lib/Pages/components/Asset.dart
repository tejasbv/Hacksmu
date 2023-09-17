import 'package:cbre/data.dart';
import 'package:flutter/material.dart';

class Asset {
  Asset(
      this.id,
      this.type,
      this.installationDate,
      this.manufacturer,
      this.operationalTime,
      this.workOrder,
      this.repairs,
      this.lastServiceDate,
      this.assetAge,
      this.daysSinceService,
      this.assetCriticality,
      this.averageDailyTrips,
      this.waterHardness,
      this.flowRate,
      this.batteryLife,
      this.sensLevel,
      this.previousRepairCost,
      this.predictedRepairCost,
      this.nextRepair);
  final String id;
  final String type;
  final String installationDate;
  final String manufacturer;
  final String operationalTime;
  final String workOrder;
  final String repairs;
  final String lastServiceDate;
  final String assetAge;
  final String daysSinceService;
  final String assetCriticality;
  final String averageDailyTrips;
  final String waterHardness;
  final String flowRate;
  final String batteryLife;
  final String sensLevel;
  final String previousRepairCost;
  final String predictedRepairCost;
  final String nextRepair;

  bool selected = false;
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Asset> _data = data
      .map((e) => Asset(
          e["Asset ID"].toString(),
          e["Asset Type"].toString(),
          e["Installation Date"].toString(),
          e["Manufacturer"].toString(),
          e["Operational Time (hrs)"].toString(),
          e["Work Orders"].toString(),
          e["Repairs"].toString(),
          e["Last Serviced Date"].toString(),
          e["Asset Age (days)"].toString(),
          e["Days Since Last Service"].toString(),
          e["Asset Criticality"].toString(),
          e["Average Daily Trips"].toString(),
          e["Water Hardness"].toString(),
          e["Flow Rate"].toString(),
          e["Battery Life"].toString(),
          e["Sensitivity Level"].toString(),
          e["Previous Cost of Repair"].toString(),
          e["Predicted Cost of Repair"].toString(),
          e["Naïve Prediction of Days"].toString()))
      .toList();

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final Asset data = _data[index];
    return DataRow(cells: [
      DataCell(Text("good")),
      DataCell(Text(data.id.toString())),
      DataCell(Text(data.type)),
      DataCell(Text(data.daysSinceService.toString())),
      DataCell(Text(data.assetCriticality.toString())),
      DataCell(Text(data.predictedRepairCost.toString())),
      DataCell(Text(data.nextRepair.toString())),
    ]);
  }
}
