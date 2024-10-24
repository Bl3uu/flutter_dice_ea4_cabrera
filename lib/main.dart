import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1, right = 1, llock = 0, rlock = 0;
  Color lcolor = Colors.black, rcolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        ChangeValue();
                      });
                      print('Left');
                    },
                    child: Image.asset('images/dice$left.png')),
              )),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        ChangeValue();
                      });
                      print('Right');
                    },
                    child: Image.asset('images/dice$right.png')),
              )),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'The total roll is ${left+right}',
            style: const TextStyle(
                fontSize: 30.0,
                color: Colors.white
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
              () {
                if (left > right){
                  return 'Left dice rolls higher';
                }else if (left < right){
                  return 'Right dice rolls higher';
                }else{
                  return 'Both dice are equal';
                }
              }(),
            style: const TextStyle(
              fontSize: 30.0,
              color: Colors.white
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                left = 1;
                right = 1;
                llock = 0;
                rlock = 0;
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black
            ),
            child: const Text(
              'Reset',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (llock == 0){
                      llock = 1;
                      lcolor = Colors.grey;
                    }else{
                      llock = 0;
                      lcolor = Colors.black;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: lcolor
                ),
                child: const Text(
                  'Left',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      if (rlock == 0) {
                        rlock = 1;
                        rcolor = Colors.grey;
                      }else{
                        rlock = 0;
                        rcolor = Colors.black;
                      }
                    });
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: rcolor
                ),
                child: const Text(
                  'Right',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  void ChangeValue(){
    if (llock == 0){
      left = 1 + Random().nextInt(6);
    }else{
    }
    if (rlock == 0){
      right = 1 + Random().nextInt(6);
    }else{
    }
  }
}
