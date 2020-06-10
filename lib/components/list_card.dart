import 'package:confession_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';

class ListCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;

  const ListCard({Key key, this.onTap, this.title, this.subtitle})
      : super(key: key);

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
        highlightColor: Colors.red,
        splashColor: Colors.green,
        onTap: onTap,
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
                    child: AvdPicture.asset(
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
            subtitle: (subtitle != null && subtitle.isNotEmpty)
                ? Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          subtitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                : null,
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0),
          ),
        ),
      ),
    );
  }
}
