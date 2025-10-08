import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsn/app/core/constants/app_colors.dart';

class EmailChipInputField extends StatefulWidget {
  final List<String> initialEmails;
  final Function(List<String>)? onChanged;
  final String? label;

  const EmailChipInputField({
    super.key,
    this.initialEmails = const [],
    this.onChanged,
    this.label,
  });

  @override
  State<EmailChipInputField> createState() => _EmailChipInputFieldState();
}

class _EmailChipInputFieldState extends State<EmailChipInputField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _emails = [];

  @override
  void initState() {
    super.initState();
    _emails = List.from(widget.initialEmails);
  }

  void _addEmail(String email) {
    final trimmedEmail = email.trim();
    if (trimmedEmail.isNotEmpty && _isValidEmail(trimmedEmail)) {
      if (!_emails.contains(trimmedEmail)) {
        setState(() {
          _emails.add(trimmedEmail);
          _controller.clear();
        });
        widget.onChanged?.call(_emails);
      }
    }
  }

  void _removeEmail(int index) {
    setState(() {
      _emails.removeAt(index);
    });
    widget.onChanged?.call(_emails);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              widget.label!,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.blackText,
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
          ),
          child: Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              ..._emails.asMap().entries.map((entry) {
                return _buildEmailChip(entry.value, entry.key);
              }),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 120.w),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: _emails.isEmpty ? 'Enter email address' : '',
                    hintStyle: TextStyle(color: AppColors.hintTextColor),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 8.h,
                    ),
                  ),
                  onSubmitted: (value) {
                    _addEmail(value);
                    _focusNode.requestFocus();
                  },
                  onChanged: (value) {
                    if (value.endsWith(' ') || value.endsWith(',')) {
                      _addEmail(value.replaceAll(',', '').trim());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmailChip(String email, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Color(0xFF1B5E3F), // Dark green background
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            email,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () => _removeEmail(index),
            child: Container(
              padding: EdgeInsets.all(2.sp),
              child: Icon(Icons.close, size: 16.sp, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

// Example usage:
class ShareMyListPage extends StatefulWidget {
  const ShareMyListPage({super.key});

  @override
  State<ShareMyListPage> createState() => _ShareMyListPageState();
}

class _ShareMyListPageState extends State<ShareMyListPage> {
  List<String> shareWithEmails = [];
  List<String> sharedListEmails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share my list'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'List Name',
                hintText: 'My List 01',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            EmailChipInputField(
              label: 'Share With',
              initialEmails: shareWithEmails,
              onChanged: (emails) {
                setState(() {
                  shareWithEmails = emails;
                });
              },
            ),
            SizedBox(height: 24.h),
            EmailChipInputField(
              label: 'Shared List',
              initialEmails: sharedListEmails,
              onChanged: (emails) {
                setState(() {
                  sharedListEmails = emails;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
