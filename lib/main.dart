import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Post your question';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {},
            ),
            title: const Text(_title, style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Theme(
            data: ThemeData(
                colorScheme: ColorScheme.light(primary: Colors.green.shade200)),
            child: const Center(
              child: MyStatefulWidget(),
            ),
          )),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;
  final title = TextEditingController();
  final description = TextEditingController();
  var questionLevels = ['PT3', 'SPM', 'UEC', 'IGSCE'];
  String selectedLevel = 'PT3';

  @override
  Widget build(BuildContext context) {
    return Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: _index,

        // when continue button is tapped
        onStepContinue: () {
          final isLastStep = _index == getSteps().length - 1;

          if (isLastStep) {
            // send data to server
          } else {
            setState(() => _index += 1);
          }
        },

        // when step buttom is tapped
        onStepTapped: (step) => setState(() {
              _index = step;
            }),

        // when cancel button is tapped
        onStepCancel: () {
          _index == 0
              ? null
              : setState(() {
                  _index -= 1;
                });
        },
        

        controlsBuilder: (BuildContext context, ControlsDetails details){
            final isLastStep = _index == getSteps().length - 1;   // to get the last step in stepper
          return Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: details.onStepContinue, 
                  child: Text(isLastStep? 'Submit' : 'Next')
                )
              ),

              const SizedBox(width: 12), 

              if(_index != 0)
              Expanded(
                child:ElevatedButton(
                    onPressed: details.onStepCancel,
                    child: const Text("Back")
                )
              ),
            ],
          );
        }
    );
  }

  List<Step> getSteps() => [
        Step(
          state: _index > 0 ? StepState.complete : StepState.indexed,
          isActive: _index >=
              0, //to check if our current step is active (step is coloured)
          title: const Text('description'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: title,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Give your question a short title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  )),
                ),
              ),

              const SizedBox(height: 50),

              TextFormField(
                controller: description,
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Tell us more about your question',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),

              const SizedBox(height: 60), 

              // const Text('Photo'),

              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey)
              //   ),
              // ),
            ],
          ),
        ),
        Step(
          state: _index > 1 ? StepState.complete : StepState.indexed,
          isActive: _index >= 1,
          title: const Text('category'),
          content: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                )),
                // initial value
                value: selectedLevel,

                // arrow icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // array list of items
                items: questionLevels.map((String level) {
                  return DropdownMenuItem(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),

                onChanged: (String? newLevel) => setState(() {
                  selectedLevel = newLevel!;
                }),
              ),
            ],
          ),
        ),
        Step(
          isActive: _index >= 2,
          title: const Text('preference'),
          content: Container(),
        ),
      ];
}
