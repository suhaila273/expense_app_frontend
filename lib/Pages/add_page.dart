import 'package:expense_app/service/exp_service.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController type1= new TextEditingController();
  TextEditingController catg1= new TextEditingController();
  TextEditingController amt1= new TextEditingController();

  void SendValuesToApi() async {

    final response = await ExpenseApiService().sendData(type1.text, catg1.text, amt1.text);
    if(response["status"]=="success")
    {
      print("successfully added");
    }
    else
    {
      print("Error");
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("ADD EXPENSE",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  controller: type1,
                  decoration: InputDecoration(
                      labelText: "Expense type",
                      hintText: "Enter expense type name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: catg1,
                  decoration: InputDecoration(
                      labelText: "Category",
                      hintText: "Enter expense category",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: amt1,
                  decoration: InputDecoration(
                      labelText: "Amount",
                      hintText: "Enter amount",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: SendValuesToApi, child: Text("ADD"))),

              ],
            ),
          ),
        ),


      ),
    );
  }
}
