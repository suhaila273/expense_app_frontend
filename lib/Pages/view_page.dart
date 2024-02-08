import 'package:expense_app/model/exp_model.dart';
import 'package:expense_app/service/exp_service.dart';
import 'package:flutter/material.dart';

class ViewExpense extends StatefulWidget {
  const ViewExpense({super.key});

  @override
  State<ViewExpense> createState() => _ViewExpenseState();
}

class _ViewExpenseState extends State<ViewExpense> {
  Future<List<Expense>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=ExpenseApiService().getData();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
          title: Text("VIEW EXPENSES",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple,
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Card(
                        color: Colors.deepPurple.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Expense type : "+snapshot.data![index].expType),
                              subtitle: Text("Category : "+snapshot.data![index].category + "\n"
                                  +"Amount: "+ snapshot.data![index].amount
                              ),
                            ),

                          ],
                        ),
                      );
                    });
              }
              else
              {
                return CircularProgressIndicator();
              }
            }),


      ),
    );
  }
}
