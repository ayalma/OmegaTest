import 'package:flutter/foundation.dart';
import 'package:omega_evaluation_project/commons/resource.dart';
import 'package:rxdart/rxdart.dart';

abstract class DataSource<SType, DType, PRType extends IPagedResult<DType>> {
  int _currentPage;
  int _totalPage;

  DataSource() {
    _totalPage = 0;
    _currentPage = 1;
  }

  @protected
  get currentPage => _currentPage;

  final _loadAfterStateSubject = BehaviorSubject<NetworkState>();

  Stream<NetworkState> get networkState => _loadAfterStateSubject.stream;

  var _items = List<DType>(); // it act like cache
  final _itemsSubject = BehaviorSubject<Resource<List<DType>>>();
  Stream<Resource<List<DType>>> get items => _itemsSubject.stream;
  @protected
  List<DType> get itemList => _items;
  @protected
  BehaviorSubject<Resource<List<DType>>> get itemsSubject => _itemsSubject;

  Future<void> loadInitial(SType searchTerm) async {
    _itemsSubject.add(Resource.loading());

    _items.clear();
    _currentPage = 1;

    var result = await load(searchTerm).catchError((error) {
      _itemsSubject.sink.add(Resource.error(error));
    });

    if (result != null) {
      _totalPage = result.totalPage;
      _items.addAll(result.data);
      _itemsSubject.sink.add(Resource.success(_items));

      if (_currentPage < _totalPage) {
        _currentPage++;
        _loadAfterStateSubject.add(NetworkState.loadMore());
      } else {
        _loadAfterStateSubject.add(NetworkState.success());
      }
    }
  }

  Future<void> loadAfter(SType searchTerm) async {
    _loadAfterStateSubject.add(NetworkState.loading());

    var result = await load(searchTerm).catchError((error) {
      _loadAfterStateSubject.add(NetworkState.error(error));
      return;
    });

    if (result != null) {
      _items.addAll(result.data);

      _itemsSubject.sink.add(Resource.success(_items));

      if (_currentPage < _totalPage) {
        _currentPage++;
        _loadAfterStateSubject.add(NetworkState.loadMore());
      } else {
        _loadAfterStateSubject.add(NetworkState.success());
      }
    }
  }

  dispose() async {
    await _loadAfterStateSubject.drain();
    _loadAfterStateSubject.close();
    await _itemsSubject.drain();
    _itemsSubject.close();
  }

  Future<PRType> load(SType searchTerm);
}

abstract class IPagedResult<T> {
  List<T> get data;

  int get page;

  int get totalPage;
}
