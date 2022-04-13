part of 'Home.dart';

class InfiniteItem extends StatefulWidget{

  _infiniteItemState createState()=>_infiniteItemState();

}
class _infiniteItemState extends State<InfiniteItem>{
  ScrollController scrollController;
  @override
  void initState(){
    super.initState();

    scrollController=ScrollController();
    scrollController.addListener(_onScroll);
  }

Widget build(BuildContext context){
  return BlocBuilder<ItemBloc,ItemState>(
      builder:(ctx,state){

        if(state is ItemsLoadSuccess){

          if(state.items.isEmpty){
            return Center(child:Text("No Product"));
          }
          return ListView.builder(

            itemBuilder: (ctx,index){
              if(index>=state.items.length){
                return Center(child:CircularProgressIndicator());
              }else{
                return ItemCard(item:state.items[index],width: 150,);

              }
            },
            itemCount: state.hasReachedMax?state.items.length:state.items.length+1,
            padding: EdgeInsets.all(5.0),
            controller: scrollController,
            scrollDirection: Axis.horizontal,

          );

        }
        if(state is ItemLoading){
          return Center(child:CircularProgressIndicator());
        }
        return Center(child:Column(children:[Text("Failed to load"),OutlinedButton(
        onPressed: (){
          context.read<ItemBloc>().add(ItemLoad());
        },
        )]
        ));

      }

  );




}

  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();

  }
  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= 200.0) {
      context.read<ItemBloc>().add(ItemLoad());
    }
  }

}