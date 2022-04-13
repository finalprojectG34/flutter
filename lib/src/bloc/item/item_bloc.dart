import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/packages/repository/repository.dart';
import 'package:sms/src/utils/loger/console_loger.dart';
import 'package:equatable/equatable.dart';
import 'package:sms/src/models/models.dart';

part 'item_state.dart';
part 'item_event.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc({@required this.itemRepository})
      : assert(itemRepository != null),
        super(ItemLoading());

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {


    if (event is ItemLoad) {

      int page=1;
      final currentState=state;

      if(!(currentState is ItemsLoadSuccess)){
        yield ItemLoading();
      }
      if(currentState is ItemsLoadSuccess && currentState.items.length>=5){

        page=((currentState.items.length.toInt()~/5)+1);
      }
      try {
        final items = await itemRepository.getItems(page,event.categoryName);

          if(currentState is ItemsLoadSuccess){
            if(items.isEmpty) {
              logTrace("emptyh",items);
              yield currentState.copyWith(hasReachedMax: true);
            }else{
              logTrace("emptyh",items);

              //concatenate items
              yield ItemsLoadSuccess(false,currentState.items+items);
            }
          }else{


            yield ItemsLoadSuccess(false,items);
          }
      } catch (e) {
        // logTrace("bloc err", e);
        yield ItemOperationFailure();
      }
    }

    if (event is ItemCreate) {
      try {
        await itemRepository.createItem(event.item);

        final item = await itemRepository.getItems(1,null);
        yield ItemsLoadSuccess(_hasReachedMax(state), item);

      } catch (e) {
        logTrace("!create Failure", e);
        yield ItemOperationFailure();
      }
    }

    if (event is ItemUpdate) {
      try {
        await itemRepository.updateItem(event.item);
        final items = await itemRepository.getItems(1, null);
        yield ItemsLoadSuccess(_hasReachedMax(state),items);
      } catch (_) {
        yield ItemOperationFailure();
      }
    }

    if (event is ItemDelete) {
      try {
        await itemRepository.deleteItem(event.item.id);
        final item = await itemRepository.getItems(1,null);
        yield ItemsLoadSuccess(_hasReachedMax(state),item);
      } catch (_) {
        yield ItemOperationFailure();
      }
    }
  }
  bool _hasReachedMax(ItemState state){
    return state is ItemsLoadSuccess && state.hasReachedMax;
  }
}
