import 'package:flutter/material.dart';

class ForgetPwBtnWidget extends StatelessWidget {
  const ForgetPwBtnWidget({
    super.key,
    required this.iconBtn,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final IconData iconBtn;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        child: Row(
          children: [
            Icon(
              iconBtn,
              size: 60,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
