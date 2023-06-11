// Normal `Stream.periodic` doesn't trigger immediately. This wrapper for it does by default
Stream<T> periodicStream<T>(Duration period,
    [T Function(int)? computation, bool onStart = true]) async* {
  if (onStart) {
    yield computation == null ? null as T : computation(0);
  }
  yield* Stream.periodic(
    period,
    (i) => computation == null ? null as T : computation(onStart ? i + 1 : i),
  );
}
