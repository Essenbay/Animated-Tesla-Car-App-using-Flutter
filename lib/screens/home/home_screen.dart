import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_animated_app/constanins.dart';
import 'package:tesla_animated_app/screens/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, snapshot) => Scaffold(
        body: SafeArea(
            child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.1),
                child: SvgPicture.asset(
                  'assets/icons/Car.svg',
                  width: double.infinity,
                ),
              ),
              Positioned(
                right: constraints.maxWidth * 0.05,
                child: DoorLock(
                  isLock: _controller.isRightDoorLock,
                  onTap: () => _controller.updateRightDoorLock(),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class DoorLock extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLock;

  const DoorLock({Key? key, required this.onTap, required this.isLock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: defaultDuration,
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: isLock
            ? SvgPicture.asset(
                'assets/icons/door_lock.svg',
                key: ValueKey('lock'),
              )
            : SvgPicture.asset(
                'assets/icons/door_unlock.svg',
                key: ValueKey('unlock'),
              ),
      ),
    );
  }
}
