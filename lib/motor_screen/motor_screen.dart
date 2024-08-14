import 'package:flutter/material.dart';

//TODO: Import the Motor_service.dart file
import 'package:udemy_motor_gpio/motor_service/motor_service.dart';

class MotorScreen extends StatefulWidget {
  const MotorScreen({super.key});

  @override
  State<MotorScreen> createState() => _MotorScreenState();
}

class _MotorScreenState extends State<MotorScreen> {
  //TODO: Create an instance of the MotorService class
  final MotorService motorService = MotorService();
  //TODO: Call the initGpio16Output method in the initState method
  @override
  void initState() {
    motorService.initGpio16Output();
    super.initState();
  }

  //TODO: Call the disposeGpio method in the dispose method
  @override
  void dispose() {
    motorService.disposeGpio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Create a Scaffold widget
    return Scaffold(
      //TODO: Add an AppBar widget
      appBar: AppBar(
        title: const Text('Udemy Motor GPIO'),
        centerTitle: true,
      ),
      //TODO: Add a Center widget
      body: Center(
        //TODO: Add a Column widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO: Add the getElevatedButtonMotorOn method
            getElevatedButtonMotorOn(),
            const SizedBox(height: 20),
            //TODO: Add the getElevatedButtonMotorOff method
            getElevatedButtonMotorOff(),
          ],
        ),
      ),
    );
  }

//TODO: Create the getElevatedButtonMotorOn method
  Widget getElevatedButtonMotorOn() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          motorService.gpio16OutputLevel(false);
        });
      },
      child: const Text(
        'GPIO16 Low Motor On',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }

//TODO: Create the getElevatedButtonMotorOff method
  Widget getElevatedButtonMotorOff() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          motorService.gpio16OutputLevel(true);
        });
      },
      child: const Text(
        'GPIO16 High Motor Off',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }
}
