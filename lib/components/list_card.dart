import 'package:confession_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Function(LongPressStartDetails)? onLongPress;
  final String title;
  final String? subtitle;
  final Widget? trailing;

  const ListCard({
    Key? key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: InkWell(
        onTap: onTap,
        child: GestureDetector(
          onLongPressStart: onLongPress,
          child: Container(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24),
                      ),
                    ),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'assets/vectors/ic_cross.xml',
                        color: iconColorActive,
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: (subtitle != null)
                  ? Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            subtitle!,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )
                  : null,
              trailing: trailing ??
                  Icon(Icons.keyboard_arrow_right,
                      color: Colors.white, size: 30.0),
            ),
          ),
        ),
      ),
    );
  }
}
