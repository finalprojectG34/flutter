import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

class CategoryList extends StatelessWidget {
  static const pathName = '/category_list';

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(CategoryLoad());
    return Scaffold(
      appBar: AppBar(
        title: Text("Category list"),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryOperationFailure) {
            return Text('Could not do category operation');
          }

          if (state is CategoryLoadSuccess) {
            final category = state.categories;

            return ListView.builder(
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return SingleCategory(
                    index: index,
                    category: Category(
                      id: category[index].id,
                      name: category[index].name,
                      // image: category[index].image,
                      description: category[index].description,
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).pushNamed(
            AddCategory.pathName,
          )
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//  ==============---------   Widget _listProduct ----------============
class SingleCategory extends StatelessWidget {
  final int index;
  final Category category;

  SingleCategory({this.index, this.category});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(category.name),
      background: Container(
        color: Colors.red,
      ),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content: const Text("Are you sure you wish to delete this item?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      logTrace("category", category);
                      final CategoryEvent event = CategoryDelete(category.id);
                      BlocProvider.of<CategoryBloc>(context).add(event);
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("DELETE")),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("CANCEL"),
                ),
              ],
            );
          },
        );
      },
      child: Column(
        children: [
          ListTile(
            // leading: CircleAvatar(
            //   backgroundImage: NetworkImage(category.image),
            // ),
            title: Text(category.name),
            subtitle: Text(category.description),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditCategory.pathName,
                  arguments: category,
                );
              },
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
