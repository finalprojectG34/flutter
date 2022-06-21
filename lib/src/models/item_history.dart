class ItemHistoryModel {
  String? previousOwner;
  String? transferDate;
  String? previousOwnerName;
  String? action;

  ItemHistoryModel(
      {this.previousOwner,
      this.transferDate,
      this.previousOwnerName,
      this.action});

  factory ItemHistoryModel.fromJson(Map<String, dynamic> json) {
    return ItemHistoryModel(
      previousOwner: json['prevOwner'],
      transferDate: json['transferDate'],
      previousOwnerName: json['prevOwnerName'],
      action: json['actionName'],
    );
  }
}
