import 'package:flutter/material.dart';
import 'package:nectar_groceries_app/components/category_list.dart';
import 'package:nectar_groceries_app/components/search_bar.dart';
import 'package:nectar_groceries_app/string_extensions.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final TextEditingController _searchController = TextEditingController();
  String? searchText = "";
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "find Products".toCapitalize("find Products"),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: CustomSearchBar(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    isEditing = value.isNotEmpty;
                  });
                },
                onClear: () {
                  setState(() {
                    searchText = null;
                    _searchController.clear();
                  });
                },
                isEditing: isEditing,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: CategoryList(),
            ),
          ],
        ),
      ),
    );
  }
}
