import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../viewmodels/search_cubit.dart';

class SearchInputField extends StatefulWidget {
  const SearchInputField({super.key});

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  late final TextEditingController _searchController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 5.h),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_rounded, size: 20.w),
                suffixIcon: ValueListenableBuilder(
                  valueListenable: _searchController,
                  builder: (context, value, child) {
                    if (value.text.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: context.colorScheme.onSurfaceVariant,
                        size: 20.w,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        context.read<SearchCubit>().clearSearch();
                      },
                    );
                  },
                ),
                hintText: context.l10n.searchPropertyPlaceholder,
                border: InputBorder.none,
                hintStyle: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.6,
                  ),
                ),
              ),
              onChanged: (value) {
                if (_debounce?.isActive ?? false) {
                  _debounce?.cancel();
                }
                _debounce = Timer(
                  Duration(milliseconds: value.isEmpty ? 0 : 500),
                  () {
                    if (mounted) {
                      context.read<SearchCubit>().search(value);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
