import 'package:empiregarage_mobile/models/response/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class TagEditor extends StatefulWidget {
  final List<SymptonResponseModel> options;
  final void Function(List<SymptonResponseModel>) onChanged;
  final void Function(bool) emptySymptom;

  const TagEditor(
      {super.key,
      required this.onChanged,
      required this.options,
      required this.emptySymptom});

  @override
  // ignore: library_private_types_in_public_api
  _TagEditorState createState() => _TagEditorState();
}

class _TagEditorState extends State<TagEditor> {
  final TextEditingController _controller = TextEditingController();
  List<SymptonResponseModel> _selectedTags = [];
  List<SymptonResponseModel> _suggestedTags = [];

  @override
  void initState() {
    super.initState();
    _selectedTags = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          decoration:  InputDecoration(
            hintText: 'Chọn tình trạng xe',
             hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightTextColor,
                                ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffixIcon: const Icon(Icons.arrow_drop_down_rounded),
          ),
          onTap: () {
            setState(() {
              _suggestedTags = widget.options;
            });
            widget.emptySymptom(false);
          },
          onChanged: (value) async {
            setState(() {
              // You'll need to replace this with your own logic for
              // generating tag suggestions based on the user's input.
              _suggestedTags = widget.options.where((tag) {
                return tag.name!.toLowerCase().contains(value.toLowerCase());
              }).toList();
            });
          },
          onFieldSubmitted: (value) {
            if (value.isNotEmpty) {
              setState(() {
                _controller.clear();
                var result = widget.options.where((tag) {
                  return tag.name!.toLowerCase().contains(value.toLowerCase());
                });
                if (result.toList().isNotEmpty) {
                  if (_selectedTags
                      .where((element) => element.id == result.first.id)
                      .isEmpty) {
                    _selectedTags.add(result.first);
                    widget.onChanged(_selectedTags);
                  }
                } else {
                  // _selectedTags.add(widget.options.where((element) => element.name!.contains(value)).first);
                }
                _suggestedTags.clear();
              });
            }
          },
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: _selectedTags.map((tag) {
            return Chip(
              label: Text(tag.name.toString()),
              onDeleted: () {
                setState(() {
                  _selectedTags.remove(tag);
                  widget.onChanged(_selectedTags);
                });
              },
            );
          }).toList(),
        ),
        if (_suggestedTags.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _suggestedTags.length,
            itemBuilder: (context, index) {
              final tag = _suggestedTags[index];
              return ListTile(
                title: Text(tag.name.toString()),
                onTap: () {
                  setState(() {
                    _controller.clear();
                    if (_selectedTags
                        .where((element) => element.id == tag.id)
                        .isEmpty) {
                      _selectedTags.add(tag);
                      widget.onChanged(_selectedTags);
                    }
                    _suggestedTags = [];
                  });
                },
              );
            },
          ),
      ],
    );
  }
}
