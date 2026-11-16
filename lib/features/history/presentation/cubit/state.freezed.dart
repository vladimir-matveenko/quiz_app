// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryState {

 List<HistoryEntity> get history; List<DateTime> get trainingDays; String? get error; bool get isLoading; bool get isShowLoader; bool get success; bool get initialized;
/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryStateCopyWith<HistoryState> get copyWith => _$HistoryStateCopyWithImpl<HistoryState>(this as HistoryState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HistoryState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryState&&const DeepCollectionEquality().equals(other.history, _this.history)&&const DeepCollectionEquality().equals(other.trainingDays, _this.trainingDays)&&(identical(other.error, _this.error) || other.error == _this.error)&&(identical(other.isLoading, _this.isLoading) || other.isLoading == _this.isLoading)&&(identical(other.isShowLoader, _this.isShowLoader) || other.isShowLoader == _this.isShowLoader)&&(identical(other.success, _this.success) || other.success == _this.success)&&(identical(other.initialized, _this.initialized) || other.initialized == _this.initialized));
}


@override
int get hashCode {
  final _this = this as HistoryState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.history),const DeepCollectionEquality().hash(_this.trainingDays),_this.error,_this.isLoading,_this.isShowLoader,_this.success,_this.initialized);
}

@override
String toString() {
  final _this = this as HistoryState;
  return 'HistoryState(history: ${_this.history}, trainingDays: ${_this.trainingDays}, error: ${_this.error}, isLoading: ${_this.isLoading}, isShowLoader: ${_this.isShowLoader}, success: ${_this.success}, initialized: ${_this.initialized})';
}


}

/// @nodoc
abstract mixin class $HistoryStateCopyWith<$Res>  {
  factory $HistoryStateCopyWith(HistoryState value, $Res Function(HistoryState) _then) = _$HistoryStateCopyWithImpl;
@useResult
$Res call({
 List<HistoryEntity> history, List<DateTime> trainingDays, String? error, bool isLoading, bool isShowLoader, bool success, bool initialized
});




}
/// @nodoc
class _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._self, this._then);

  final HistoryState _self;
  final $Res Function(HistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? history = null,Object? trainingDays = null,Object? error = freezed,Object? isLoading = null,Object? isShowLoader = null,Object? success = null,Object? initialized = null,}) {
  return _then(HistoryState(
history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<HistoryEntity>,trainingDays: null == trainingDays ? _self.trainingDays : trainingDays // ignore: cast_nullable_to_non_nullable
as List<DateTime>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isShowLoader: null == isShowLoader ? _self.isShowLoader : isShowLoader // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryState].
extension HistoryStatePatterns on HistoryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HistoryEntity> history,  List<DateTime> trainingDays,  String? error,  bool isLoading,  bool isShowLoader,  bool success,  bool initialized)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that.history,_that.trainingDays,_that.error,_that.isLoading,_that.isShowLoader,_that.success,_that.initialized);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HistoryEntity> history,  List<DateTime> trainingDays,  String? error,  bool isLoading,  bool isShowLoader,  bool success,  bool initialized)  $default,) {final _that = this;
switch (_that) {
case _HistoryState():
return $default(_that.history,_that.trainingDays,_that.error,_that.isLoading,_that.isShowLoader,_that.success,_that.initialized);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HistoryEntity> history,  List<DateTime> trainingDays,  String? error,  bool isLoading,  bool isShowLoader,  bool success,  bool initialized)?  $default,) {final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that.history,_that.trainingDays,_that.error,_that.isLoading,_that.isShowLoader,_that.success,_that.initialized);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryState implements HistoryState {
  const _HistoryState({ List<HistoryEntity> history = const [],  List<DateTime> trainingDays = const [], this.error, this.isLoading = false, this.isShowLoader = false, this.success = false, this.initialized = false}): _history = history,_trainingDays = trainingDays;
  

 final  List<HistoryEntity> _history;
@override@JsonKey() List<HistoryEntity> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

 final  List<DateTime> _trainingDays;
@override@JsonKey() List<DateTime> get trainingDays {
  if (_trainingDays is EqualUnmodifiableListView) return _trainingDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainingDays);
}

@override final  String? error;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isShowLoader;
@override@JsonKey() final  bool success;
@override@JsonKey() final  bool initialized;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryStateCopyWith<_HistoryState> get copyWith => __$HistoryStateCopyWithImpl<_HistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryState&&const DeepCollectionEquality().equals(other.history, _history)&&const DeepCollectionEquality().equals(other.trainingDays, _trainingDays)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isShowLoader, isShowLoader) || other.isShowLoader == isShowLoader)&&(identical(other.success, success) || other.success == success)&&(identical(other.initialized, initialized) || other.initialized == initialized));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_history),const DeepCollectionEquality().hash(_trainingDays),error,isLoading,isShowLoader,success,initialized);
}

@override
String toString() {
    return 'HistoryState(history: $history, trainingDays: $trainingDays, error: $error, isLoading: $isLoading, isShowLoader: $isShowLoader, success: $success, initialized: $initialized)';
}


}

/// @nodoc
abstract mixin class _$HistoryStateCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory _$HistoryStateCopyWith(_HistoryState value, $Res Function(_HistoryState) _then) = __$HistoryStateCopyWithImpl;
@override @useResult
$Res call({
 List<HistoryEntity> history, List<DateTime> trainingDays, String? error, bool isLoading, bool isShowLoader, bool success, bool initialized
});




}
/// @nodoc
class __$HistoryStateCopyWithImpl<$Res>
    implements _$HistoryStateCopyWith<$Res> {
  __$HistoryStateCopyWithImpl(this._self, this._then);

  final _HistoryState _self;
  final $Res Function(_HistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? history = null,Object? trainingDays = null,Object? error = freezed,Object? isLoading = null,Object? isShowLoader = null,Object? success = null,Object? initialized = null,}) {
  return _then(_HistoryState(
history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<HistoryEntity>,trainingDays: null == trainingDays ? _self._trainingDays : trainingDays // ignore: cast_nullable_to_non_nullable
as List<DateTime>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isShowLoader: null == isShowLoader ? _self.isShowLoader : isShowLoader // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
