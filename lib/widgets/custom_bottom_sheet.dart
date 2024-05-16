import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants.dart';
import 'package:flutter_template/widgets/map_screen.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, this.onPressed, required this.bottomSheetType});

  final void Function()? onPressed;
  final BottomSheetType bottomSheetType;

  @override
  Widget build(BuildContext context) {
    IconData icon  = Icons.cancel;
    String texto = "";
    MaterialStateProperty<Color?>? color;
    switch (bottomSheetType) {
      case BottomSheetType.takeABreak:
           icon = Icons.timer_off_outlined;
           texto = "Take a break";
           color = MaterialStateProperty.all<Color>(AppThemeColors.failure);
      break;
      case BottomSheetType.backToWork:
           icon = Icons.timer_outlined;
           texto = "Back to Work";
      break;
      case BottomSheetType.startWorking:
           icon = Icons.timer_outlined;
           texto = "Start Working";
      break;
      case BottomSheetType.finishSheet:
           icon = Icons.check;
           texto = "Finish Sheet";
      break;
      default:
    }
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        color: Color.fromRGBO(241,245,249, 1),
        child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Color.fromRGBO(228, 231, 235, 1)), // Define el borde superior
                    )
                ),
              ),
              Container(
                child: Flexible(child: MapScreen()),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
                decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color.fromRGBO(228, 231, 235, 1)), // Define el borde superior
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: SizedBox(
                          height: 48,
                          child: FilledButton(
                            style: ButtonStyle(
                                backgroundColor:color??null,
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0)
                                    )
                                )
                            ),
                            onPressed: onPressed,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(icon, color: Colors.white, size: 24,),
                                SizedBox(width: 8),
                                Text(texto, style: TextStyle(color: Colors.white, fontSize: 18)),
                              ],
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              )
            ]));
  }
}
