import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Symbol used to store and retrieve the [CancelToken] from the current [Zone].
const Symbol blocCancelKey = #blocCancelKey;

/// A Cubit that provides emission safety (preventing emission after close)
/// and automatic request cancellation via a [CancelToken] associated with the Cubit's lifetime.
abstract class SafeCubit<State> extends Cubit<State> {
  SafeCubit(super.initialState);

  /// The [CancelToken] associated with this Cubit.
  final CancelToken cancelToken = CancelToken();

  /// Runs an asynchronous [computation] within a [Zone] containing this Cubit's [CancelToken].
  /// Any network request made via [DioClient] within this block will automatically
  /// inherit and use this [CancelToken] if no explicit token is passed.
  Future<T> runSafe<T>(FutureOr<T> Function() computation) => runZoned(
        () async => await computation(),
        zoneValues: {blocCancelKey: cancelToken},
      );

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() {
    cancelToken.cancel('Cubit closed');
    return super.close();
  }
}

/// A Bloc that provides emission safety (preventing emission after close)
/// and automatic request cancellation via a [CancelToken] associated with the Bloc's lifetime.
abstract class SafeBloc<Event, State> extends Bloc<Event, State> {
  SafeBloc(super.initialState);

  /// The [CancelToken] associated with this Bloc.
  final CancelToken cancelToken = CancelToken();

  /// Overrides the event handler registration to automatically run every handler
  /// within a [Zone] containing this Bloc's [CancelToken].
  @override
  void on<E extends Event>(
    EventHandler<E, State> handler, {
    EventTransformer<E>? transformer,
  }) {
    super.on<E>(
      (event, emit) => runZoned(
        () => handler(event, _SafeEmitter(emit, this)),
        zoneValues: {blocCancelKey: cancelToken},
      ),
      transformer: transformer,
    );
  }

  @override
  Future<void> close() {
    cancelToken.cancel('Bloc closed');
    return super.close();
  }
}

/// A wrapper around [Emitter] to ensure that emissions are safe even if the Bloc is closed
/// or the emission is attempted after the handler completes.
class _SafeEmitter<State> implements Emitter<State> {
  _SafeEmitter(this._delegate, this._bloc);

  final Emitter<State> _delegate;
  final Bloc<dynamic, State> _bloc;

  @override
  void call(State state) {
    if (!_bloc.isClosed && !_delegate.isDone) {
      _delegate(state);
    }
  }

  @override
  Future<void> forEach<T>(
    Stream<T> stream, {
    required State Function(T data) onData,
    State Function(Object error, StackTrace stackTrace)? onError,
  }) =>
      _delegate.forEach(
        stream,
        onData: onData,
        onError: onError,
      );

  @override
  Future<void> onEach<T>(
    Stream<T> stream, {
    required void Function(T data) onData,
    void Function(Object error, StackTrace stackTrace)? onError,
  }) =>
      _delegate.onEach(
        stream,
        onData: onData,
        onError: onError,
      );

  @override
  bool get isDone => _delegate.isDone || _bloc.isClosed;
}
