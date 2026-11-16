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
mixin _$TranslationState {

 TranslationStatus get status; TranslationCheckResultEntity? get result; List<String> get russianText; int get currentIndex; int get totalScore; String? get error;
/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationStateCopyWith<TranslationState> get copyWith => _$TranslationStateCopyWithImpl<TranslationState>(this as TranslationState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TranslationState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.result, _this.result) || other.result == _this.result)&&const DeepCollectionEquality().equals(other.russianText, _this.russianText)&&(identical(other.currentIndex, _this.currentIndex) || other.currentIndex == _this.currentIndex)&&(identical(other.totalScore, _this.totalScore) || other.totalScore == _this.totalScore)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as TranslationState;
  return Object.hash(runtimeType,_this.status,_this.result,const DeepCollectionEquality().hash(_this.russianText),_this.currentIndex,_this.totalScore,_this.error);
}

@override
String toString() {
  final _this = this as TranslationState;
  return 'TranslationState(status: ${_this.status}, result: ${_this.result}, russianText: ${_this.russianText}, currentIndex: ${_this.currentIndex}, totalScore: ${_this.totalScore}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $TranslationStateCopyWith<$Res>  {
  factory $TranslationStateCopyWith(TranslationState value, $Res Function(TranslationState) _then) = _$TranslationStateCopyWithImpl;
@useResult
$Res call({
 TranslationStatus status, TranslationCheckResultEntity? result, List<String> russianText, int currentIndex, int totalScore, String? error
});




}
/// @nodoc
class _$TranslationStateCopyWithImpl<$Res>
    implements $TranslationStateCopyWith<$Res> {
  _$TranslationStateCopyWithImpl(this._self, this._then);

  final TranslationState _self;
  final $Res Function(TranslationState) _then;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? result = freezed,Object? russianText = null,Object? currentIndex = null,Object? totalScore = null,Object? error = freezed,}) {
  return _then(TranslationState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TranslationStatus,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as TranslationCheckResultEntity?,russianText: null == russianText ? _self.russianText : russianText // ignore: cast_nullable_to_non_nullable
as List<String>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TranslationState].
extension TranslationStatePatterns on TranslationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslationState value)  $default,){
final _that = this;
switch (_that) {
case _TranslationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslationState value)?  $default,){
final _that = this;
switch (_that) {
case _TranslationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TranslationStatus status,  TranslationCheckResultEntity? result,  List<String> russianText,  int currentIndex,  int totalScore,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslationState() when $default != null:
return $default(_that.status,_that.result,_that.russianText,_that.currentIndex,_that.totalScore,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TranslationStatus status,  TranslationCheckResultEntity? result,  List<String> russianText,  int currentIndex,  int totalScore,  String? error)  $default,) {final _that = this;
switch (_that) {
case _TranslationState():
return $default(_that.status,_that.result,_that.russianText,_that.currentIndex,_that.totalScore,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TranslationStatus status,  TranslationCheckResultEntity? result,  List<String> russianText,  int currentIndex,  int totalScore,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _TranslationState() when $default != null:
return $default(_that.status,_that.result,_that.russianText,_that.currentIndex,_that.totalScore,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TranslationState implements TranslationState {
  const _TranslationState({this.status = TranslationStatus.initial, this.result,  List<String> russianText = const [], this.currentIndex = 0, this.totalScore = 0, this.error}): _russianText = russianText;
  

@override@JsonKey() final  TranslationStatus status;
@override final  TranslationCheckResultEntity? result;
 final  List<String> _russianText;
@override@JsonKey() List<String> get russianText {
  if (_russianText is EqualUnmodifiableListView) return _russianText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_russianText);
}

@override@JsonKey() final  int currentIndex;
@override@JsonKey() final  int totalScore;
@override final  String? error;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationStateCopyWith<_TranslationState> get copyWith => __$TranslationStateCopyWithImpl<_TranslationState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslationState&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result)&&const DeepCollectionEquality().equals(other.russianText, _russianText)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,result,const DeepCollectionEquality().hash(_russianText),currentIndex,totalScore,error);
}

@override
String toString() {
    return 'TranslationState(status: $status, result: $result, russianText: $russianText, currentIndex: $currentIndex, totalScore: $totalScore, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TranslationStateCopyWith<$Res> implements $TranslationStateCopyWith<$Res> {
  factory _$TranslationStateCopyWith(_TranslationState value, $Res Function(_TranslationState) _then) = __$TranslationStateCopyWithImpl;
@override @useResult
$Res call({
 TranslationStatus status, TranslationCheckResultEntity? result, List<String> russianText, int currentIndex, int totalScore, String? error
});




}
/// @nodoc
class __$TranslationStateCopyWithImpl<$Res>
    implements _$TranslationStateCopyWith<$Res> {
  __$TranslationStateCopyWithImpl(this._self, this._then);

  final _TranslationState _self;
  final $Res Function(_TranslationState) _then;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? result = freezed,Object? russianText = null,Object? currentIndex = null,Object? totalScore = null,Object? error = freezed,}) {
  return _then(_TranslationState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TranslationStatus,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as TranslationCheckResultEntity?,russianText: null == russianText ? _self._russianText : russianText // ignore: cast_nullable_to_non_nullable
as List<String>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
