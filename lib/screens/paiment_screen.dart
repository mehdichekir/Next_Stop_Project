import 'package:flutter/material.dart';
import 'package:transport_app/screens/Reservation_validated_screen.dart';


class PaimentScreen extends StatefulWidget {
  static const routeName = '/payment_screen';
  const PaimentScreen({super.key});

  @override
  State<PaimentScreen> createState() => _PaimentScreenState();
}

class _PaimentScreenState extends State<PaimentScreen> {
  TextEditingController dateController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  void selectDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    ).then((date) {
      if (date != null) {
        setState(() {
          dateController.text = date.toString().split(" ")[0];
        });
      }
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.only(top: 100),
              color: const  Color.fromARGB(255, 18, 77, 122),
              height: 200,
              width: double.maxFinite,
              child: const Text(
                'Pay your Ticket',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            padding: const EdgeInsets.only(top: 40, left: 40, right: 40,bottom: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 2, color: Colors.black), // Border on top
                left: BorderSide(width: 2, color: Colors.black), // Border on left
                right:
                    BorderSide(width: 2, color: Colors.black), // Border on right
              ),
            ),
            child: Column(
              children: [
               const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Payment',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '6500 DT',
                      style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 18, 77, 122)),
                    )
                  ],
                ),
               const SizedBox( height: 40),
                Form(
                  key: formKey,
                    child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      key: const ValueKey('Card Number'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return 'Please Enter a Valid number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.card_travel),
                          labelText: 'Card Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0))
                              ),
                      onSaved: (value) {},
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      key: const ValueKey('Card Holder'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return 'Name must be at least 4 characters long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Card Holder',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0))),
                      onSaved: (value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value){
                                if(value==null){
                                  return 'Please Pick a Date';
                                }
                              },
                              controller: dateController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.calendar_month),
                                labelText: 'Pick a date',
                                border: OutlineInputBorder(),
                              ),
                              onTap: selectDate,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      key: const ValueKey('Secret Number'),
                      validator: (value) {
                        if(value!.length<3){
                          return 'Please Enter a valid secret Number';
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Secret Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0))),
                      onSaved: (value) {},
                    ),
                  ],
                )),
                const SizedBox(height: 40,),
                TextButton(
                    style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 51, 85),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(240, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rectangle shape with rounded corners
            ),
                ),
                    onPressed: (){
                      final isValid = formKey.currentState!.validate();
                      FocusScope.of(context).unfocus();
                      if(isValid){
                        Navigator.of(context).pushReplacementNamed(ReservationValidatedScreen.routeName);
                      }
        
                      },
                    child:const  Text('Pay Now',style: TextStyle(fontSize: 20, color: Colors.white),
                    ))
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Tranport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ' Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 10, 51, 85),
        unselectedItemColor: Colors.grey.shade600,
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
