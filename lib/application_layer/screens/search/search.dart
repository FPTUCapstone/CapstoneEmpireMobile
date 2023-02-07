import 'package:empiregarage_mobile/application_layer/widgets/service_card.dart';
import 'package:empiregarage_mobile/common/colors.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String _searchString = "";
  FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  List<String> _recentSearches = [
    "Thay nhớt",
    "Thay hộp số",
    "Thay lốp",
    "Thay gương"
  ];

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  removeRecentSearch() {
    setState(() {
      _recentSearches = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: AppColors.searchBarColor,
                width: 1.0,
              ),
            ),
            child: IconButton(
                onPressed: () {
                  //TODO
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: AppColors.blackTextColor,
                )),
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Tìm kiếm',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            focusNode: FocusNode(canRequestFocus: true),
            onSubmitted: (value) => {
              setState(() {
                if (value.replaceAll(" ", "").isNotEmpty) {
                  _recentSearches.add(value);
                }
              }),
              _searchString = value,
            },
            controller: _searchController,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.blueTextColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(26))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.unselectedBtn),
                  borderRadius: BorderRadius.all(Radius.circular(26))),
              focusColor: AppColors.searchBarColor,
              prefixIcon: Icon(Icons.search),
              hintText: 'Tìm kiếm...',
            ),
          ),
          _searchString.isEmpty
              ? Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: ListTile(
                            title: const Text(
                              'Tìm kiếm gần đây',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'SFProDisplay',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: _recentSearches.isNotEmpty
                                ? InkWell(
                                    onTap: () => {removeRecentSearch()},
                                    child: const Text(
                                      "Xóa tất cả",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'SFProDisplay',
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: _recentSearches.map((search) {
                            return ListTile(
                              title: Text(
                                search,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'SFProDisplay',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              leading: search.isNotEmpty
                                  ? const Icon(Icons.timer_outlined)
                                  : null,
                              horizontalTitleGap: 0,
                              onTap: () {
                                _searchController.text = search;
                                setState(() {
                                  _searchString = search;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: ListTile(
                          title: RichText(
                            text: TextSpan(
                                text: 'Kết quả cho "',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'SFProDisplay',
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                      text: _searchString,
                                      style: const TextStyle(
                                        color: AppColors.blueTextColor,
                                        fontSize: 16,
                                        fontFamily: 'SFProDisplay',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: const [
                                        TextSpan(
                                          text: '"',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'SFProDisplay',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ])
                                ]),
                          ),
                          trailing: const Text(
                            "3 tìm kiếm",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'SFProDisplay',
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueTextColor),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SerivceCard(
                                    backgroundImage:
                                        "assets/image/service-picture/service-picture1.png",
                                    title: "Bảo dưỡng định kỳ",
                                    price: "20.000",
                                    usageCount: "182",
                                    rating: "4.4",
                                    tag: "Bảo dưỡng"),
                                const SizedBox(
                                  height: 25,
                                )
                              ],
                            );
                          }),
                    ),
                  ]),
                )
        ],
      ),
    );
  }
}
