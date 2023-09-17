import 'dart:convert';
import 'package:proyek_sub_mission_id_camp_2023/model/produk_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HalamanProduk extends StatefulWidget {
  const HalamanProduk({super.key});

  @override
  State<HalamanProduk> createState() => _HalamanProdukState();
}

class _HalamanProdukState extends State<HalamanProduk> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DataModel? dataFromAPI;
  _getData() async {
    try {
      String url = "https://khadafizubaidi.my.id/api/produks";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produk"),
        backgroundColor: Colors.black,
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
      : ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                    Image.network(
                      dataFromAPI!.produks[index].urlFotoProduk,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(dataFromAPI!.produks[index].namaProduk.toString(),textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(dataFromAPI!.produks[index].deskripsiProduk.toString(), textAlign: TextAlign.justify, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),),
                  ),
                //Text("\$${dataFromAPI!.products[index].price.toString()}"),
                ],
              ),
            ),
          );
        },
        itemCount: dataFromAPI!.produks.length,
      ),
    );
  }
}

