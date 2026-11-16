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
mixin _$QuizState {

 QuizStatus get status; List<Word> get words; List<String> get additionalWords; List<String> get answers; int get currentIndex; int get correctCount; String? get errorMessage; String? get userAnswer; bool get answered; bool get correct;
/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizStateCopyWith<QuizState> get copyWith => _$QuizStateCopyWithImpl<QuizState>(this as QuizState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuizState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.words, _this.words)&&const DeepCollectionEquality().equals(other.additionalWords, _this.additionalWords)&&const DeepCollectionEquality().equals(other.answers, _this.answers)&&(identical(other.currentIndex, _this.currentIndex) || other.currentIndex == _this.currentIndex)&&(identical(other.correctCount, _this.correctCount) || other.correctCount == _this.correctCount)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.userAnswer, _this.userAnswer) || other.userAnswer == _this.userAnswer)&&(identical(other.answered, _this.answered) || other.answered == _this.answered)&&(identical(other.correct, _this.correct) || other.correct == _this.correct));
}


@override
int get hashCode {
  final _this = this as QuizState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.words),const DeepCollectionEquality().hash(_this.additionalWords),const DeepCollectionEquality().hash(_this.answers),_this.currentIndex,_this.correctCount,_this.errorMessage,_this.userAnswer,_this.answered,_this.correct);
}

@override
String toString() {
  final _this = this as QuizState;
  return 'QuizState(status: ${_this.status}, words: ${_this.words}, additionalWords: ${_this.additionalWords}, answers: ${_this.answers}, currentIndex: ${_this.currentIndex}, correctCount: ${_this.correctCount}, errorMessage: ${_this.errorMessage}, userAnswer: ${_this.userAnswer}, answered: ${_this.answered}, correct: ${_this.correct})';
}


}

/// @nodoc
abstract mixin class $QuizStateCopyWith<$Res>  {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) _then) = _$QuizStateCopyWithImpl;
@useResult
$Res call({
 QuizStatus status, List<Word> words, List<String> additionalWords, List<String> answers, int currentIndex, int correctCount, String? errorMessage, String? userAnswer, bool answered, bool correct
});




}
/// @nodoc
class _$QuizStateCopyWithImpl<$Res>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._self, this._then);

  final QuizState _self;
  final $Res Function(QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? words = null,Object? additionalWords = null,Object? answers = null,Object? currentIndex = null,Object? correctCount = null,Object? errorMessage = freezed,Object? userAnswer = freezed,Object? answered = null,Object? correct = null,}) {
  return _then(QuizState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuizStatus,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<Word>,additionalWords: null == additionalWords ? _self.additionalWords : additionalWords // ignore: cast_nullable_to_non_nullable
as List<String>,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,userAnswer: freezed == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String?,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizState].
extension QuizStatePatterns on QuizState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizState value)  $default,){
final _that = this;
switch (_that) {
case _QuizState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuizStatus status,  List<Word> words,  List<String> additionalWords,  List<String> answers,  int currentIndex,  int correctCount,  String? errorMessage,  String? userAnswer,  bool answered,  bool correct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.status,_that.words,_that.additionalWords,_that.answers,_that.currentIndex,_that.correctCount,_that.errorMessage,_that.userAnswer,_that.answered,_that.correct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuizStatus status,  List<Word> words,  List<String> additionalWords,  List<String> answers,  int currentIndex,  int correctCount,  String? errorMessage,  String? userAnswer,  bool answered,  bool correct)  $default,) {final _that = this;
switch (_that) {
case _QuizState():
return $default(_that.status,_that.words,_that.additionalWords,_that.answers,_that.currentIndex,_that.correctCount,_that.errorMessage,_that.userAnswer,_that.answered,_that.correct);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuizStatus status,  List<Word> words,  List<String> additionalWords,  List<String> answers,  int currentIndex,  int correctCount,  String? errorMessage,  String? userAnswer,  bool answered,  bool correct)?  $default,) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.status,_that.words,_that.additionalWords,_that.answers,_that.currentIndex,_that.correctCount,_that.errorMessage,_that.userAnswer,_that.answered,_that.correct);case _:
  return null;

}
}

}

/// @nodoc


class _QuizState implements QuizState {
  const _QuizState({this.status = QuizStatus.initial,  List<Word> words = const [],  List<String> additionalWords = const [],  List<String> answers = const [], this.currentIndex = 0, this.correctCount = 0, this.errorMessage, this.userAnswer, this.answered = false, this.correct = false}): _words = words,_additionalWords = additionalWords,_answers = answers;
  

@override@JsonKey() final  QuizStatus status;
 final  List<Word> _words;
@override@JsonKey() List<Word> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}

 final  List<String> _additionalWords;
@override@JsonKey() List<String> get additionalWords {
  if (_additionalWords is EqualUnmodifiableListView) return _additionalWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_additionalWords);
}

 final  List<String> _answers;
@override@JsonKey() List<String> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override@JsonKey() final  int currentIndex;
@override@JsonKey() final  int correctCount;
@override final  String? errorMessage;
@override final  String? userAnswer;
@override@JsonKey() final  bool answered;
@override@JsonKey() final  bool correct;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizStateCopyWith<_QuizState> get copyWith => __$QuizStateCopyWithImpl<_QuizState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.words, _words)&&const DeepCollectionEquality().equals(other.additionalWords, _additionalWords)&&const DeepCollectionEquality().equals(other.answers, _answers)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&(identical(other.answered, answered) || other.answered == answered)&&(identical(other.correct, correct) || other.correct == correct));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_words),const DeepCollectionEquality().hash(_additionalWords),const DeepCollectionEquality().hash(_answers),currentIndex,correctCount,errorMessage,userAnswer,answered,correct);
}

@override
String toString() {
    return 'QuizState(status: $status, words: $words, additionalWords: $additionalWords, answers: $answers, currentIndex: $currentIndex, correctCount: $correctCount, errorMessage: $errorMessage, userAnswer: $userAnswer, answered: $answered, correct: $correct)';
}


}

/// @nodoc
abstract mixin class _$QuizStateCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$QuizStateCopyWith(_QuizState value, $Res Function(_QuizState) _then) = __$QuizStateCopyWithImpl;
@override @useResult
$Res call({
 QuizStatus status, List<Word> words, List<String> additionalWords, List<String> answers, int currentIndex, int correctCount, String? errorMessage, String? userAnswer, bool answered, bool correct
});




}
/// @nodoc
class __$QuizStateCopyWithImpl<$Res>
    implements _$QuizStateCopyWith<$Res> {
  __$QuizStateCopyWithImpl(this._self, this._then);

  final _QuizState _self;
  final $Res Function(_QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? words = null,Object? additionalWords = null,Object? answers = null,Object? currentIndex = null,Object? correctCount = null,Object? errorMessage = freezed,Object? userAnswer = freezed,Object? answered = null,Object? correct = null,}) {
  return _then(_QuizState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuizStatus,words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<Word>,additionalWords: null == additionalWords ? _self._additionalWords : additionalWords // ignore: cast_nullable_to_non_nullable
as List<String>,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,userAnswer: freezed == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String?,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
