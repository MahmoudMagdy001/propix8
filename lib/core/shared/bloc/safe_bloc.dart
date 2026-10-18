import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

/// Symbol used to store and retrieve the [CancelToken] from the current [Zone].
const Symbol blocCancelKey = #blocCancelKey;


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
  }) => _delegate.forEach(stream, onData: onData, onError: onError);

  @override
  Future<void> onEach<T>(
    Stream<T> stream, {
    required void Function(T data) onData,
    void Function(Object error, StackTrace stackTrace)? onError,
  }) => _delegate.onEach(stream, onData: onData, onError: onError);

  @override
  bool get isDone => _delegate.isDone || _bloc.isClosed;
}
