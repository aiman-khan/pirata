import 'package:flutter/material.dart';

class AppPopUps {
  bool isDialogShowing = true;

  showProgressDialog(
      {BuildContext? context, bool? barrierDismissal, Color? color}) {
    isDialogShowing = true;
    showDialog(
        useRootNavigator: false,
        useSafeArea: false,
        barrierDismissible: barrierDismissal ?? false,
        context: context!,
        builder: (context) => Center(
              child: Container(
                decoration: BoxDecoration(
                  //color: AppColors(..blackcardsBackground,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      //  color: AppColors().shadowColor,
                      color: Colors.transparent,
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(3, 5), // changes position of shadow
                    ),
                  ],
                ),
                height: 120,
                width: 120,
                //  child: Lottie.asset(AssetsNames().loader),
                child: spinner(color: color),
              ),
            )).then((value) {
      isDialogShowing = false;
    });
  }

  dissmissDialog(context) {
    if (isDialogShowing) {
      // navigatorKey.currentState!.pop();
      Navigator.pop(context);
    }
  }
}

Center spinner({Color? color}) {
  return Center(
    child: CircularProgressIndicator(
      color: Colors.black,
    ),
  );
}
