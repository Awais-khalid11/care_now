import 'package:flutter/material.dart';

import '../helpers/constants.dart';


class CustomProgressWidget extends StatefulWidget {
  final bool loading;
  final Widget child;
  final String? text;

  @override
  _CustomProgressWidgetState createState() => _CustomProgressWidgetState();

  CustomProgressWidget({
    required this.loading,
    required this.child,
    this.text,
  });
}

class _CustomProgressWidgetState extends State<CustomProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,

              // decoration: BoxDecoration(
              //   color: Colors.white,
              // ),
              child: widget.child),
          widget.loading
              ? Container(

            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator.adaptive(
                          strokeWidth: 1,
                          backgroundColor: MyColor.redColor2,
                        ),
                        if (widget.text != null && widget.text!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              widget.text.toString(),
                              style: TextStyle(color: Colors.white,fontSize: 14),
                            ),
                          )
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
