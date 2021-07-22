import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message;
  final double size;
  final bool visible;

  Progress(
      {this.message = 'Loading...', this.size = 16.0, this.visible = true});

  @override
  Widget build(BuildContext context) => Center(
        child: Visibility(
          visible: visible,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: size),
                ),
              ),
            ],
          ),
        ),
      );
}
