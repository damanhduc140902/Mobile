import 'package:flutter/material.dart';

enum Options { edit, hide, delete }

const Color boldBlue = Color.fromARGB(255, 125, 171, 245);
const Color lightBlue = Color.fromARGB(255, 224, 238, 253);
const Color boldBoldBlue = Color.fromARGB(255, 46, 138, 237);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'To-do List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: ManageCategories(
        categories: [
          Category(description: 'Work', counter: 0),
          Category(description: 'Personal', counter: 0),
          Category(description: 'Wishlist', counter: 0),
          Category(description: 'Birthday', counter: 0)
        ],
      ),
      theme: ThemeData(
          //Brightness and colors
          brightness: Brightness.light,

          //Font family
          fontFamily: 'Roboto',

          //Scaffold theme
          scaffoldBackgroundColor: const Color.fromARGB(255, 249, 255, 255),

          //Appbar theme
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 249, 255, 255),
              iconTheme: IconThemeData(color: Colors.black, size: 30),
              titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),

      //Text themes
      // textTheme: const TextTheme(

      //     ),
    );
  }
}

class ManageCategories extends StatefulWidget {
  ManageCategories({super.key, required this.categories});

  List<Category> categories;

  @override
  State<ManageCategories> createState() => ManageCategoriesState();
}

class ManageCategoriesState extends State<ManageCategories> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  void newCategory() {
    setState(() {
      if ((widget.categories
              .where((element) => element.description == controller.text))
          .isEmpty) {
        widget.categories
            .add(Category(description: controller.text, counter: 0));
        Navigator.pop(context);
        controller.clear();
      }
    });
  }

  Future<void> addCategory() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Create new category'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                    child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Input here'),
                  key: formKey,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  maxLength: 50,
                  controller: controller,
                ))
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => {Navigator.pop(context), controller.clear()},
                child: const Text('CANCEL'),
              ),
              TextButton(
                  onPressed: () => newCategory(), child: const Text('SAVE'))
            ],
          );
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text('Manage Categories')),
        ),
        body: Column(
          children: [
            Container(
                color: lightBlue,
                child: ListTile(
                  title: Center(
                    child: Text(
                      'Categories display on homepage',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                )),
            ReorderableListView(
                shrinkWrap: true,
                buildDefaultDragHandles: true,
                onReorder: ((oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final Category item = widget.categories.removeAt(oldIndex);
                    widget.categories.insert(newIndex, item);
                  });
                }),
                children: widget.categories.map((category) {
                  return Categories(
                      category: category);
                }).toList()),
            GestureDetector(
                onTap: () => addCategory(),
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 0, 20),
                      child: Icon(Icons.add, color: boldBoldBlue, size: 25),
                    ),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Create New',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: boldBoldBlue))))
                  ],
                ))
          ],
        ));
  }
}

class Categories extends StatefulWidget {
  Categories(
      {required this.category})
      : super(key: ObjectKey(category));

  Category category;

  @override
  State<Categories> createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  bool deleted = false;
  bool visible = true;
  String text = 'Hide';

  void newCategory() {
    setState(() {
      widget.category.description = controller.text;
      Navigator.pop(context);
      controller.clear();
    });
  }

  Future<void> editCategory() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Create new category'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                    child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Input here.',
                    // border: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         width: 0, style: BorderStyle.none)),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  maxLength: 50,
                  controller: controller,
                ))
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => {Navigator.pop(context), controller.clear()},
                  child: const Text('CANCEL')),
              TextButton(
                  onPressed: () => newCategory(), child: const Text('SAVE'))
            ],
          );
        });
  }

  Future<void> deleteCategory() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete the category?'),
            content: const Text('All tasks in this category will be deleted'),
            actions: <Widget>[
              TextButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: const Text('CANCEL')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      deleted = true;
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('DELETE'))
            ],
          );
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!deleted) {
      return Row(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: boldBlue))),
          Expanded(
              child: Text(widget.category.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20))),
          if (!visible)
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.visibility_off)),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(widget.category.counter.toString())),
          PopupMenuButton<Options>(
              tooltip: '',
              onSelected: (Options item) {
                if (item == Options.delete) {
                  deleteCategory();
                } else if (item == Options.hide) {
                  setState(() {
                    visible = !visible;
                    text = !visible ? 'Show' : 'Hide';
                  });
                } else {
                  editCategory();
                }
              },
              itemBuilder: ((context) => [
                    const PopupMenuItem<Options>(
                      value: Options.edit,
                      child: Text('Edit'),
                    ),
                    PopupMenuItem<Options>(
                      value: Options.hide,
                      child: Text(text),
                    ),
                    const PopupMenuItem<Options>(
                      value: Options.delete,
                      child: Text('Delete'),
                    )
                  ]))
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class Category {
  Category({required this.description, required this.counter});

  String description;
  int counter;
}
