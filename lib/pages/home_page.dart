import 'package:amazing_toe/helpers/color_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget ticTacToeAnimation(int index) {
    final widget = (String assetName) => Material(
          color: CupertinoColors.systemGrey5,
          child: Image.asset(assetName),
        );
    switch (index) {
      case 2:
        return widget('assets/o.png');
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
