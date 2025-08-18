import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';
part 'request_state.g.dart';

@freezed
class RequestState with _$RequestState {
  factory RequestState() = _RequestState;
  const factory RequestState.initial() = REQUEST_INITIAL;
  const factory RequestState.loading() = REQUEST_LOADING;
  const factory RequestState.success() = REQUEST_SUCCESS;
  factory RequestState.fromJson(Map<String, dynamic> json) =>
      _$RequestStateFromJson(json);
}
