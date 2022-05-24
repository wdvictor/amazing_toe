import 'dart:async';
import 'dart:math';

import 'package:amazing_toe/helpers/color_lib.dart';
import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  late Timer _timer;
  int _degrees = 90;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(milliseconds: 300), () {
          _controller.reset();
        });
      }
    });
    _timer =
        Timer.periodic(const Duration(seconds: 1, milliseconds: 500), (timer) {
      if (_degrees == 90) {
        _degrees = 180;
        setRotation(_degrees);
        _controller.forward(from: 0);
      } else {
        _degrees = 90;
        setRotation(_degrees);
        _controller.forward(from: 0);
      }
    });

    setRotation(90);
  }

  void setRotation(int degrees) {
    final angle = degrees * pi / 180;
    _animation = Tween<double>(begin: 0.0, end: angle).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget ticTacToeAnimation(int index) {
    Widget widget(String assetName) => Material(
          color: CupertinoColors.systemGrey5,
          child: AnimatedBuilder(
              animation: _animation,
              child: Image.asset(assetName),
              builder: (context, child) =>
                  Transform.rotate(angle: _animation.value, child: child)),
        );

    switch (index) {
      case 2:
        return widget('assets/o.png');
      case 4:
        return widget('assets/x.png');
      case 6:
        return widget('assets/x.png');
      case 8:
        return widget('assets/o.png');

      default:
        return Container(
          color: Color.fromRGBO(229, 229, 234, 1),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey5,
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: _size.width * 0.2,
                  height: _size.width * 0.2,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.black,
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 1.5,
                            crossAxisSpacing: 1.5,
                            crossAxisCount: 3),
                    itemBuilder: (context, i) => ticTacToeAnimation(i),
                  ),
                ),
              ),
            ),
            Expanded(child: BattleField(size: _size)),
          ],
        ),
      ),
    );
  }
}

class BattleField extends StatelessWidget {
  const BattleField({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size.width * 0.8,
      width: _size.width * 0.8,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 2, crossAxisSpacing: 2, crossAxisCount: 3),
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {},
          child: Container(
            color: ColorLib.secondaryPurple.color,
          ),
        ),
      ),
    );
  }
}
