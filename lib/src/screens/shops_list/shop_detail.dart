import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../app.dart';
import '../../models/item_search_filter.dart';
import '../../models/shop.dart';
import '../category_page/category_detial_ctx.dart';
import '../components/category_item.dart';
import '../components/error_page.dart';
import '../items/item_mini_view/item_mini_detail.dart';

class ShopDetail extends StatefulWidget {
  final Shop shop;

  const ShopDetail({Key? key, required this.shop}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShopDetailState();
  }
}

class _ShopDetailState extends State<ShopDetail> {
  final CategoryDetailController ctx = Get.find();
  static const _pageSize = 20;
  late ItemSearchFilter _itemSearchFilter;

  final PagingController<int, Item> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  initState() {
    if (widget.shop.sellingCategories != null &&
        widget.shop.sellingCategories!.isNotEmpty) {
      _itemSearchFilter = ItemSearchFilter(
          categoryId: widget.shop.sellingCategories![0].id,
          ownerId: widget.shop.ownerId,
          reqPagInfo: ReqPagInfo());

      _pagingController.addPageRequestListener((pageKey) {
        _itemSearchFilter =
            _itemSearchFilter.copyWith(reqPagInfo: ReqPagInfo(pageNo: pageKey));
        _fetchPage(_itemSearchFilter);
      });
      _fetchPage(_itemSearchFilter);
    }

    super.initState();
  }

  Future<void> _fetchPage(ItemSearchFilter _searchFilter) async {
    try {
      final newItems = await ctx.getItemsByCatID(_searchFilter);
      if (newItems != null) {
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = _searchFilter.reqPagInfo.pageNo + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.shop.name}')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      // backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            '${widget.shop.image?.imagePath.toString()}'),
                        radius: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.shop.name}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Official store',
                          style: TextStyle(fontSize: 16),
                        ),
                        if (widget.shop.haveLicense != null &&
                            widget.shop.haveLicense!)
                          const Icon(Icons.verified)
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                            '${widget.shop.address?.addressName},${widget.shop.address?.city}, ${widget.shop.address?.country}')),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Total product',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${widget.shop.count}item',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          'Joined date',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '20 oct 2021',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                if (widget.shop.sellingCategories != null &&
                    widget.shop.sellingCategories!.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Sub Category',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () {
                            _itemSearchFilter = _itemSearchFilter.copyWith(
                                categoryId:
                                    widget.shop.sellingCategories![index].id,
                                reqPagInfo: ReqPagInfo());
                            _fetchPage(_itemSearchFilter);
                          },
                          child: CategoryItem(
                              category: widget.shop.sellingCategories![index]),
                        );
                      },
                      itemCount: widget.shop.sellingCategories!.length,
                    ),
                  ),
                  Obx(() {
                    if (ctx.isLoading.isTrue) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (ctx.itemList.value != null) {
                      if (ctx.itemList.value!.isEmpty) {
                        return const Center(
                          child: Text("No item"),
                        );
                      }
                      return PagedGridView<int, Item>(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .65,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        pagingController: _pagingController,
                        showNewPageProgressIndicatorAsGridChild: false,
                        builderDelegate: PagedChildBuilderDelegate<Item>(
                          itemBuilder: (context, item, index) => ItemMiniDetail(
                            item: item,
                          ),
                        ),
                      );
                    }
                    return errorPage(onTryAgain: () {
                      _fetchPage(_itemSearchFilter);
                    });
                  })
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
