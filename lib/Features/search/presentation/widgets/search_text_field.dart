// ignore_for_file: deprecated_member_use
import 'package:book_app/Features/search/presentation/manger/search_cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<SearchCubit>().searchBooks(value);
      },
      decoration: InputDecoration(
        hintText: 'Search by title...',
        suffixIcon: Icon(
          FontAwesomeIcons.search,
          size: 22,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
