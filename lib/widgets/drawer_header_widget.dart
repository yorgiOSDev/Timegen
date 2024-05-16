import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(34, 19, 43, 1),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/TG_logo1.svg', width: 144, height: 144,)
              ],
            ),
          ),
        )
    );
  }
}
