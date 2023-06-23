import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
        child: TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Serach For Products',
            border: const OutlineInputBorder(
              borderSide: BorderSide.none
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset('assets/icons/search.svg', width: 10,),
            ),
            ),
        ),
      ),
    );
  }
}
