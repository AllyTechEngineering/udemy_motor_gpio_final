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

  //TODO: Set initial state of GPIO16
  bool _myLed16 = false;

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
            //TODO: Add the ElevatedButtonMotor method
            ElevatedButtonMotor(
              //TODO: Add name for ElevatedButtonMotor
              motorName: 'GPIO16 Motor',
              onPressed: () {
                //TODO: Set the state of the button and the GPIO pin
                setState(() {
                  _myLed16 = !_myLed16;
                  motorService.gpio16OutputLevel(_myLed16);
                });
              },
              //TODO: Passe the state of the button
              motorStatus: _myLed16,
            )
          ],
        ),
      ),
    );
  }
}

class ElevatedButtonMotor extends StatefulWidget {
  const ElevatedButtonMotor(
      {super.key,
      required this.motorName,
      required this.onPressed,
      required this.motorStatus});
//TODO: The name of the button
  final String motorName;
//TODO: The controll of the state
  final VoidCallback? onPressed;
//TODO: The state of the butto and GPIO
  final bool motorStatus;

  @override
  State<ElevatedButtonMotor> createState() => _ElevatedButtonMotorState();
}

class _ElevatedButtonMotorState extends State<ElevatedButtonMotor> {
  @override
  Widget build(BuildContext context) {

    late Color motorStateColorButton;
    late String motorState;
    //TODO: Checks the state of the button and set the color and the stet it is in
    if (!widget.motorStatus) {
      motorStateColorButton = Colors.red;
      motorState = 'Off';
    } else {
      motorStateColorButton = Colors.green;
      motorState = 'On ';
    }
    return ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(
          '${widget.motorName}: $motorState',
          style: TextStyle(
              color: motorStateColorButton,
              fontWeight: FontWeight.w900,
              fontSize: 50.0),
        ));
  }
}

