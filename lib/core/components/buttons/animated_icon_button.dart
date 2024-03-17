import 'package:flutter/material.dart';

// Define a custom widget class that extends StatefulWidget
class AnimatedButtonBottomSheet extends StatefulWidget {
  const AnimatedButtonBottomSheet({Key? key}) : super(key: key);

  @override
  _AnimatedButtonBottomSheetState createState() => _AnimatedButtonBottomSheetState();
}

// Define a custom state class that extends State
class _AnimatedButtonBottomSheetState extends State<AnimatedButtonBottomSheet> with SingleTickerProviderStateMixin {
  // Define an animation controller
  late AnimationController _animationController;

  // Define a method to handle the button press
  void _handleOnPressed() {
    setState(() {
      // Toggle the animation direction
      _animationController.isCompleted ? _animationController.reverse() : _animationController.forward();
      // Show or hide the bottom sheet
      if (_animationController.isCompleted) {
        showModalBottomSheet(
          context: context,
          transitionAnimationController: _animationController,
          builder: (context) {
            return Container(
              height: 200,
              child: Center(
                child: Text('Your bottom sheet'),
              ),
            );
          },
        );
      } else {
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 150,
      splashColor: Colors.greenAccent,
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animationController,
      ),
      onPressed: _handleOnPressed,
    );
  }
}
