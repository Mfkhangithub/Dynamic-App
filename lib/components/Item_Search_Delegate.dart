import 'package:flutter/material.dart';
import 'package:saloonstore/model/Items_model.dart';
import 'package:saloonstore/model/Store_Model.dart';
import 'package:saloonstore/views/Mobile/Category/Category_Detail_page.dart.dart';

class ItemSearchDelegate extends SearchDelegate<String> {
  final List<Items_data> itemList;
  

  ItemSearchDelegate({
    required this.itemList,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  // @override
  // Widget buildLeading(BuildContext context) {
  //   return IconButton(
  //     icon: const Icon(Icons.arrow_back),
  //     onPressed: () {
  //       Navigator.pop(context);
  //       // close(context,  null);
  //     },
  //   );
  // }

   @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }


  // @override
  // Widget buildResults(BuildContext context) {
  //   return buildSearchResults(itemList);
  // }

   @override
  Widget buildResults(BuildContext context) {
    // Implement how to display the search results
    return Container(); // Placeholder, replace with actual result widget
  }

  @override
 Widget buildSuggestions(BuildContext context) {
  final suggestionList = query.isEmpty
      ? []
      : itemList
          .where((item) =>
              item.itemType!.toLowerCase().contains(query.toLowerCase()))
          .toList();

  // Implement the UI for displaying search results
  return ListView.builder(
    itemCount: suggestionList.length,
    itemBuilder: (context, index) {
      return ListTile(
         title: Text(suggestionList[index].itemName ?? ""),
        subtitle: Text(suggestionList[index].itemType ?? ""),
        // Handle tapping on the search result item
        onTap: () {
          // Implement the action when a search result is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Category_details_page(
                // Pass the selected item
                selectedItem: suggestionList[index],
                itemList: itemList,
                store: Stores(),
              ),
            ),
          );
        },
      );
    },
  );
}
}
