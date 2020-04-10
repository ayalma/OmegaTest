class Resource<T> {
  final T data;
  final Object message;
  final Status status;
  bool isHandled = false;

  Resource(this.data, this.message, this.status);

  factory Resource.success(T data) {
    return Resource(data, null, Status.Success);
  }

  factory Resource.loading({T data}) {
    return Resource(data, null, Status.Loading);
  }

  factory Resource.error(Object message, {T data}) {
    return Resource(data, message, Status.Error);
  }
}

class Event<EId, DT> extends Resource<DT> {
  final EId eventId;

  Event(this.eventId, DT data, Object message, Status status)
      : super(data, message, status);
  factory Event.success(DT data, EId id) {
    return Event(id, data, null, Status.Success);
  }

  factory Event.loading(EId id, {DT data}) {
    return Event(id, data, null, Status.Loading);
  }

  factory Event.error(EId id, Object message, {DT data}) {
    return Event(id, data, message, Status.Error);
  }
}

class NetworkState {
  bool loadMore;
  Object message;
  Status status;

  NetworkState(this.status, this.message, this.loadMore);

  factory NetworkState.loadMore() {
    return NetworkState(null, null, true);
  }

  factory NetworkState.success() {
    return NetworkState(Status.Success, null, false);
  }

  factory NetworkState.loading() {
    return NetworkState(Status.Loading, null, false);
  }

  factory NetworkState.error(Object message) {
    return NetworkState(Status.Loading, message, false);
  }
}

enum Status { Loading, Error, Success }

///
/// this class contains code for resource class but just provide list of errors
///
class ErrorListResource<T> {
  final T data;
  final List<Object> message;
  final Status status;
  bool isHandled = false;

  ErrorListResource(this.data, this.message, this.status);

  factory ErrorListResource.success(T data) {
    return ErrorListResource(data, null, Status.Success);
  }

  factory ErrorListResource.loading({T data}) {
    return ErrorListResource(data, null, Status.Loading);
  }

  factory ErrorListResource.error(Object message, {T data}) {
    return ErrorListResource(data, message, Status.Error);
  }
}
