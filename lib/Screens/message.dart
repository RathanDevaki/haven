import 'package:flutter/material.dart';
import 'package:haven/Screens/appbar.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
class Message extends  StatefulWidget {
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {

  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:CommonAppBar(),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Send Message to all users',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                SizedBox(height: 50,),
                TextField(
                  controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  decoration: InputDecoration(
                      hintText: "Your Message...",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.redAccent)
                      )
                  ),

                ),
            SizedBox(height: 20),
            ProgressButton.icon(iconedButtons: {
              ButtonState.idle:
              IconedButton(
                  text: "Send",
                  icon: Icon(Icons.send,color: Colors.white),
                  color: Colors.orange),
              ButtonState.loading:
              IconedButton(
                  text: "Loading",
                  color: Colors.deepPurple.shade700),
              ButtonState.fail:
              IconedButton(
                  text: "Failed",
                  icon: Icon(Icons.cancel,color: Colors.white),
                  color: Colors.red.shade300),
              ButtonState.success:
              IconedButton(
                  text: "Success",
                  icon: Icon(Icons.check_circle,color: Colors.white,),
                  color: Colors.green.shade400)
            },
                onPressed:(){},
                state: ButtonState.idle),
              ],
            ),
          ),
        )
    );
  }
}