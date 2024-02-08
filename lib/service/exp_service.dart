import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:expense_app/model/exp_model.dart';


class ExpenseApiService {
  Future<dynamic> sendData(String expType, String category, String amount) async
  {
    var client = http.Client();
    var apiUrl = Uri.parse("http://localhost:3001/api/exp/entry");

    var response = await client.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "expType": expType,
          "category": category,
          "amount": amount,
        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("failed to add");
    }
  }

  Future<List<Expense>> getData() async{
    var client= http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/exp/view");

    var response= await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return expenseFromJson(response.body);
    }
    else
    {
      return [];
    }

  }

}