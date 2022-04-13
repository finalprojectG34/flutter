import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/bloc/item/item_bloc.dart';

import 'package:sms/src/app.dart';
import 'package:sms/src/utils/Constants.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

class UsersList extends StatelessWidget {
  static const routeName = '/adminUsers';

  @override
  Widget build(BuildContext context) {
    // context.read<UserBloc>().add(UserLoad());
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserOperationFailure) {
            return Text('Could not do operation');
          }

          if (state is UsersLoadSuccess) {
            final items = state.user;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return SingleProduct(
                    index: index,
                    item: User(
                      id: items[index].id,
                      email: items[index].email,
                      name: items[index].name,
                      phone: items[index].phone,
                      // price: items[index].price,
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          PageRoutes.add_edit_users,
          arguments: PageArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

//  ==============---------   Widget _listProduct ----------============
class SingleProduct extends StatelessWidget {
  final int index;
  final User item;

  SingleProduct({this.index, this.item});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.name),
      background: Container(
        color: Colors.red,
      ),

//      ---------------- ===  onDismissed Function ===== -------------------
      confirmDismiss: (DismissDirection direction) async{

        return await  _showWarningDialog(context, index);

      },

      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(Constants.watchImagePath),
            ),
            title: Text(item.name),
            subtitle: Text('\$${item.email}'),
            trailing: _editButton(context, index),
          ),
          Divider()
        ],
      ),
    );
  }

//========================= Widget EditButton ====================
  Widget _editButton(BuildContext context, int index) {
    // logTrace("thisitem", this.item);
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).pushNamed(
          PageRoutes.add_edit_users,
          arguments: PageArgument(item: this.item, edit: true),
        );


      },
    );
  }

//  ----------------==== waring dialogue ========-----------
  _showWarningDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm '),
          content: Text('this action cant be undone'),
          actions: <Widget>[
            FlatButton(
              child: Text('Discard'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('Delete'),
              onPressed: () {
                final UserEvent event = UserDelete(item);
                BlocProvider.of<UserBloc>(context).add(event);
                Navigator.of(context).pop(true);
//                  Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}
