class ItemSearchFilter {
  String? categoryId;
  String? searchTerm;
  double minPrice;
  double maxPrice;
  List<FilterAttributes>? attributes;
  ReqPagInfo reqPagInfo;
  String? ownerId;

  ItemSearchFilter(
      {this.categoryId,
      this.searchTerm,
      this.ownerId,
      this.minPrice = 0,
      this.maxPrice = 3000,
      this.attributes,
      required this.reqPagInfo});

  ItemSearchFilter copyWith(
      {String? categoryId,
      String? searchTerm,
      double? minPrice,
      double? maxPrice,
      String? ownerId,
      List<FilterAttributes>? attributes,
      ReqPagInfo? reqPagInfo}) {
    return ItemSearchFilter(
        searchTerm: searchTerm ?? this.searchTerm,
        ownerId: ownerId ?? this.ownerId,
        attributes: attributes ?? this.attributes,
        categoryId: categoryId ?? this.categoryId,
        maxPrice: maxPrice ?? this.maxPrice,
        minPrice: minPrice ?? this.minPrice,
        reqPagInfo: reqPagInfo ?? this.reqPagInfo);
  }
}

class FilterAttributes {
  String? name;
  List<String>? values;

  FilterAttributes({this.name, this.values});
}

class ReqPagInfo {
  int pageNo;
  int limit;

  ReqPagInfo({this.pageNo = 1, this.limit = 20});
}
