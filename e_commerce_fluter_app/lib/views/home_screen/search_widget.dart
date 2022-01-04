import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: (value) {
          //! add autocompted search
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(
            Icons.search,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              //! filter product.
            },
            icon: const Icon(
              Icons.filter_alt_outlined,
            ),
          ),
        ),
      ),
    );
  }
}