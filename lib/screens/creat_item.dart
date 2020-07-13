import 'package:flutter/material.dart';
import 'package:mini_ads/models/category.dart';
import 'package:mini_ads/provider/search_screen_provider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CreatItem extends StatefulWidget {
  @override
  _CreatItemState createState() => _CreatItemState();
}

class _CreatItemState extends State<CreatItem> {
  List<bool> _selection = List.generate(3, (_) => false);
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _categorty = '';
  String _selectedCategory = SearchScreenProvider().categories[0].name;

  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Ads'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text("Pick images"),
              onPressed: loadAssets,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(images.length, (index) {
                  Asset asset = images[index];
                  return AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  );
                }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Color(0xff3776A6),
              thickness: 3,
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 500,
                  margin: EdgeInsets.only(top: 6),
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    autovalidate: true,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(' choose a Type'),
                        ),
                        ToggleButtons(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Exchange'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Exchange'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Exchange'),
                            ),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              _selection[index] = !_selection[index];
                            });
                          },
                          isSelected: _selection,
                          borderRadius: BorderRadius.circular(30),
                          borderWidth: 4,
                          borderColor: Colors.white,
                          selectedBorderColor: Colors.blue,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.title),
                            hintText: 'Item Name',
                            labelText: 'Title',
                          ),
                        ),
                        new TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.description),
                            hintText: 'Enter a Descreption ',
                            labelText: 'Descreption',
                          ),
                        ),
                        new TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.monetization_on),
                            hintText: 'Enter a Price ',
                            labelText: 'Price ',
                          ),
                        ),
                        new FormField(
                          builder: (FormFieldState state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                icon: const Icon(Icons.category),
//                                labelText: 'Category',
                              ),
                              isEmpty: _categorty == '',
                              child: new DropdownButtonHideUnderline(
                                child: new DropdownButton<String>(
                                  value: _selectedCategory,
                                  onChanged: (String newCategory) {
                                    setState(() {
                                      _selectedCategory = newCategory;
                                    });
                                  },
                                  isDense: true,
                                  items: SearchScreenProvider()
                                      .categories
                                      .map((Category value) {
                                    print("Adding dropdown for ${value.name}");
                                    return new DropdownMenuItem(
                                      value: value.name,
                                      child: new Text(value.name),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                            padding:
                                const EdgeInsets.only(left: 40.0, top: 20.0),
                            child: new RaisedButton(
                              child: const Text('Add'),
                              onPressed: null,
                            )),
                      ],
                    ),
                  ),
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.all(2.5),
//                            width: 24,
//                            height: 24,
//                            decoration: BoxDecoration(
//                              shape: BoxShape.circle,
//                              border: Border.all(color: Colors.grey),
//                            ),
//                            child: DecoratedBox(
//                              decoration: BoxDecoration(
//                                  shape: BoxShape.circle, color: Colors.blue),
//                            ),
//                          ),
//                          SizedBox(
//                            width: 20,
//                          ),
//                          Container(
//                            width: 250,
//                            height: 50,
//                            child: TextField(
//                              onChanged: null,
//                              decoration: InputDecoration(
////                                labelText: 'Number 00201158986647',
//                                contentPadding:
//                                    const EdgeInsets.symmetric(vertical: 10),
//
//                                hintText: 'Title',
//                                enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                    color: Colors.grey,
//                                  ),
//                                  borderRadius: BorderRadius.circular(20.0),
//                                ),
//                                border: OutlineInputBorder(),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.all(2.5),
//                            width: 24,
//                            height: 24,
//                            decoration: BoxDecoration(
//                              shape: BoxShape.circle,
//                              border: Border.all(color: Colors.grey),
//                            ),
//                            child: DecoratedBox(
//                              decoration: BoxDecoration(
//                                  shape: BoxShape.circle, color: Colors.blue),
//                            ),
//                          ),
//                          SizedBox(
//                            width: 20,
//                          ),
//                          Container(
//                            width: 250,
//                            height: 50,
//                            child: TextField(
//                              keyboardType: TextInputType.multiline,
//                              onChanged: null,
//                              decoration: InputDecoration(
//                                contentPadding:
//                                    const EdgeInsets.symmetric(vertical: 10),
////                                labelText: 'Number 00201158986647',
//                                hintText: 'Descreption',
//                                enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                    color: Colors.grey,
//                                  ),
//                                  borderRadius: BorderRadius.circular(20.0),
//                                ),
//                                border: OutlineInputBorder(),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.all(2.5),
//                            width: 24,
//                            height: 24,
//                            decoration: BoxDecoration(
//                              shape: BoxShape.circle,
//                              border: Border.all(color: Colors.grey),
//                            ),
//                            child: DecoratedBox(
//                              decoration: BoxDecoration(
//                                  shape: BoxShape.circle, color: Colors.blue),
//                            ),
//                          ),
//                          SizedBox(
//                            width: 20,
//                          ),
//                          Container(
//                            width: 250,
//                            height: 50,
//                            child: TextField(
//                              onChanged: null,
//                              decoration: InputDecoration(
////                                labelText: 'Number 00201158986647',
//                                contentPadding:
//                                    const EdgeInsets.symmetric(vertical: 10),
//
//                                hintText: 'Descreption',
//
//                                enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                    color: Colors.grey,
//                                  ),
//                                  borderRadius: BorderRadius.circular(20.0),
//                                ),
//                                border: OutlineInputBorder(),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
