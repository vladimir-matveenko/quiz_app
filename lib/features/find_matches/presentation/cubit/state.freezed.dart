// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FindMatchesState {

 FindMatchesStatus get status; List<Word> get leftWords; List<Word> get rightWords; Word? get left; Word? get right; int get errorsCount; int get totalCount; bool get correct; bool get answered; String? get errorMessage;
/// Create a copy of FindMatchesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FindMatchesStateCopyWith<FindMatchesState> get copyWith => _$FindMatchesStateCopyWithImpl<FindMatchesState>(this as FindMatchesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FindMatchesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.leftWords, leftWords)&&const DeepCollectionEquality().equals(other.rightWords, rightWords)&&const DeepCollectionEquality().equals(other.left, left)&&const DeepCollectionEquality().equals(other.right, right)&&(identical(other.errorsCount, errorsCount) || other.errorsCount == errorsCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.correct, correct) || other.correct == correct)&&(identical(other.answered, answered) || other.answered == answered)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(leftWords),const DeepCollectionEquality().hash(rightWords),const DeepCollectionEquality().hash(left),const DeepCollectionEquality().hash(right),errorsCount,totalCount,correct,answered,errorMessage);

@override
String toString() {
  return 'FindMatchesState(status: $status, leftWords: $leftWords, rightWords: $rightWords, left: $left, right: $right, errorsCount: $errorsCount, totalCount: $totalCount, correct: $correct, answered: $answered, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $FindMatchesStateCopyWith<$Res>  {
  factory $FindMatchesStateCopyWith(FindMatchesState value, $Res Function(FindMatchesState) _then) = _$FindMatchesStateCopyWithImpl;
@useResult
$Res call({
 FindMatchesStatus status, List<Word> leftWords, List<Word> rightWords, Word? left, Word? right, int errorsCount, int totalCount, bool correct, bool answered, String? errorMessage
});




}
/// @nodoc
class _$FindMatchesStateCopyWithImpl<$Res>
    implements $FindMatchesStateCopyWith<$Res> {
  _$FindMatchesStateCopyWithImpl(this._self, this._then);

  final FindMatchesState _self;
  final $Res Function(FindMatchesState) _then;

/// Create a copy of FindMatchesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? leftWords = null,Object? rightWords = null,Object? left = freezed,Object? right = freezed,Object? errorsCount = null,Object? totalCount = null,Object? correct = null,Object? answered = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FindMatchesStatus,leftWords: null == leftWords ? _self.leftWords : leftWords // ignore: cast_nullable_to_non_nullable
as List<Word>,rightWords: null == rightWords ? _self.rightWords : rightWords // ignore: cast_nullable_to_non_nullable
as List<Word>,left: freezed == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as Word?,right: freezed == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as Word?,errorsCount: null == errorsCount ? _self.errorsCount : errorsCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FindMatchesState].
extension FindMatchesStatePatterns on FindMatchesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FindMatchesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FindMatchesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FindMatchesState value)  $default,){
final _that = this;
switch (_that) {
case _FindMatchesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FindMatchesState value)?  $default,){
final _that = this;
switch (_that) {
case _FindMatchesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FindMatchesStatus status,  List<Word> leftWords,  List<Word> rightWords,  Word? left,  Word? right,  int errorsCount,  int totalCount,  bool correct,  bool answered,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FindMatchesState() when $default != null:
return $default(_that.status,_that.leftWords,_that.rightWords,_that.left,_that.right,_that.errorsCount,_that.totalCount,_that.correct,_that.answered,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FindMatchesStatus status,  List<Word> leftWords,  List<Word> rightWords,  Word? left,  Word? right,  int errorsCount,  int totalCount,  bool correct,  bool answered,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _FindMatchesState():
return $default(_that.status,_that.leftWords,_that.rightWords,_that.left,_that.right,_that.errorsCount,_that.totalCount,_that.correct,_that.answered,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FindMatchesStatus status,  List<Word> leftWords,  List<Word> rightWords,  Word? left,  Word? right,  int errorsCount,  int totalCount,  bool correct,  bool answered,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _FindMatchesState() when $default != null:
return $default(_that.status,_that.leftWords,_that.rightWords,_that.left,_that.right,_that.errorsCount,_that.totalCount,_that.correct,_that.answered,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _FindMatchesState implements FindMatchesState {
  const _FindMatchesState({this.status = FindMatchesStatus.initial, final  List<Word> leftWords = const [], final  List<Word> rightWords = const [], this.left, this.right, this.errorsCount = 0, this.totalCount = 0, this.correct = false, this.answered = false, this.errorMessage}): _leftWords = leftWords,_rightWords = rightWords;
  

@override@JsonKey() final  FindMatchesStatus status;
 final  List<Word> _leftWords;
@override@JsonKey() List<Word> get leftWords {
  if (_leftWords is EqualUnmodifiableListView) return _leftWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leftWords);
}

 final  List<Word> _rightWords;
@override@JsonKey() List<Word> get rightWords {
  if (_rightWords is EqualUnmodifiableListView) return _rightWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rightWords);
}

@override final  Word? left;
@override final  Word? right;
@override@JsonKey() final  int errorsCount;
@override@JsonKey() final  int totalCount;
@override@JsonKey() final  bool correct;
@override@JsonKey() final  bool answered;
@override final  String? errorMessage;

/// Create a copy of FindMatchesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FindMatchesStateCopyWith<_FindMatchesState> get copyWith => __$FindMatchesStateCopyWithImpl<_FindMatchesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FindMatchesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._leftWords, _leftWords)&&const DeepCollectionEquality().equals(other._rightWords, _rightWords)&&const DeepCollectionEquality().equals(other.left, left)&&const DeepCollectionEquality().equals(other.right, right)&&(identical(other.errorsCount, errorsCount) || other.errorsCount == errorsCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.correct, correct) || other.correct == correct)&&(identical(other.answered, answered) || other.answered == answered)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_leftWords),const DeepCollectionEquality().hash(_rightWords),const DeepCollectionEquality().hash(left),const DeepCollectionEquality().hash(right),errorsCount,totalCount,correct,answered,errorMessage);

@override
String toString() {
  return 'FindMatchesState(status: $status, leftWords: $leftWords, rightWords: $rightWords, left: $left, right: $right, errorsCount: $errorsCount, totalCount: $totalCount, correct: $correct, answered: $answered, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$FindMatchesStateCopyWith<$Res> implements $FindMatchesStateCopyWith<$Res> {
  factory _$FindMatchesStateCopyWith(_FindMatchesState value, $Res Function(_FindMatchesState) _then) = __$FindMatchesStateCopyWithImpl;
@override @useResult
$Res call({
 FindMatchesStatus status, List<Word> leftWords, List<Word> rightWords, Word? left, Word? right, int errorsCount, int totalCount, bool correct, bool answered, String? errorMessage
});




}
/// @nodoc
class __$FindMatchesStateCopyWithImpl<$Res>
    implements _$FindMatchesStateCopyWith<$Res> {
  __$FindMatchesStateCopyWithImpl(this._self, this._then);

  final _FindMatchesState _self;
  final $Res Function(_FindMatchesState) _then;

/// Create a copy of FindMatchesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? leftWords = null,Object? rightWords = null,Object? left = freezed,Object? right = freezed,Object? errorsCount = null,Object? totalCount = null,Object? correct = null,Object? answered = null,Object? errorMessage = freezed,}) {
  return _then(_FindMatchesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FindMatchesStatus,leftWords: null == leftWords ? _self._leftWords : leftWords // ignore: cast_nullable_to_non_nullable
as List<Word>,rightWords: null == rightWords ? _self._rightWords : rightWords // ignore: cast_nullable_to_non_nullable
as List<Word>,left: freezed == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as Word?,right: freezed == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as Word?,errorsCount: null == errorsCount ? _self.errorsCount : errorsCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
