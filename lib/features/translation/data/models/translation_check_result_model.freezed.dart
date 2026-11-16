// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_check_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslationCheckResultModel {

 String get correctTranslation; int get score; List<MistakeModel> get mistakes;
/// Create a copy of TranslationCheckResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationCheckResultModelCopyWith<TranslationCheckResultModel> get copyWith => _$TranslationCheckResultModelCopyWithImpl<TranslationCheckResultModel>(this as TranslationCheckResultModel, _$identity);

  /// Serializes this TranslationCheckResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TranslationCheckResultModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationCheckResultModel&&(identical(other.correctTranslation, _this.correctTranslation) || other.correctTranslation == _this.correctTranslation)&&(identical(other.score, _this.score) || other.score == _this.score)&&const DeepCollectionEquality().equals(other.mistakes, _this.mistakes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TranslationCheckResultModel;
  return Object.hash(runtimeType,_this.correctTranslation,_this.score,const DeepCollectionEquality().hash(_this.mistakes));
}

@override
String toString() {
  final _this = this as TranslationCheckResultModel;
  return 'TranslationCheckResultModel(correctTranslation: ${_this.correctTranslation}, score: ${_this.score}, mistakes: ${_this.mistakes})';
}


}

/// @nodoc
abstract mixin class $TranslationCheckResultModelCopyWith<$Res>  {
  factory $TranslationCheckResultModelCopyWith(TranslationCheckResultModel value, $Res Function(TranslationCheckResultModel) _then) = _$TranslationCheckResultModelCopyWithImpl;
@useResult
$Res call({
 String correctTranslation, int score, List<MistakeModel> mistakes
});




}
/// @nodoc
class _$TranslationCheckResultModelCopyWithImpl<$Res>
    implements $TranslationCheckResultModelCopyWith<$Res> {
  _$TranslationCheckResultModelCopyWithImpl(this._self, this._then);

  final TranslationCheckResultModel _self;
  final $Res Function(TranslationCheckResultModel) _then;

/// Create a copy of TranslationCheckResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? correctTranslation = null,Object? score = null,Object? mistakes = null,}) {
  return _then(TranslationCheckResultModel(
correctTranslation: null == correctTranslation ? _self.correctTranslation : correctTranslation // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,mistakes: null == mistakes ? _self.mistakes : mistakes // ignore: cast_nullable_to_non_nullable
as List<MistakeModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TranslationCheckResultModel].
extension TranslationCheckResultModelPatterns on TranslationCheckResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslationCheckResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslationCheckResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslationCheckResultModel value)  $default,){
final _that = this;
switch (_that) {
case _TranslationCheckResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslationCheckResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _TranslationCheckResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String correctTranslation,  int score,  List<MistakeModel> mistakes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslationCheckResultModel() when $default != null:
return $default(_that.correctTranslation,_that.score,_that.mistakes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String correctTranslation,  int score,  List<MistakeModel> mistakes)  $default,) {final _that = this;
switch (_that) {
case _TranslationCheckResultModel():
return $default(_that.correctTranslation,_that.score,_that.mistakes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String correctTranslation,  int score,  List<MistakeModel> mistakes)?  $default,) {final _that = this;
switch (_that) {
case _TranslationCheckResultModel() when $default != null:
return $default(_that.correctTranslation,_that.score,_that.mistakes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslationCheckResultModel implements TranslationCheckResultModel {
  const _TranslationCheckResultModel({required this.correctTranslation, required this.score, required  List<MistakeModel> mistakes}): _mistakes = mistakes;
  factory _TranslationCheckResultModel.fromJson(Map<String, dynamic> json) => _$TranslationCheckResultModelFromJson(json);

@override final  String correctTranslation;
@override final  int score;
 final  List<MistakeModel> _mistakes;
@override List<MistakeModel> get mistakes {
  if (_mistakes is EqualUnmodifiableListView) return _mistakes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mistakes);
}


/// Create a copy of TranslationCheckResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationCheckResultModelCopyWith<_TranslationCheckResultModel> get copyWith => __$TranslationCheckResultModelCopyWithImpl<_TranslationCheckResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslationCheckResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslationCheckResultModel&&(identical(other.correctTranslation, correctTranslation) || other.correctTranslation == correctTranslation)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.mistakes, _mistakes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,correctTranslation,score,const DeepCollectionEquality().hash(_mistakes));
}

@override
String toString() {
    return 'TranslationCheckResultModel(correctTranslation: $correctTranslation, score: $score, mistakes: $mistakes)';
}


}

/// @nodoc
abstract mixin class _$TranslationCheckResultModelCopyWith<$Res> implements $TranslationCheckResultModelCopyWith<$Res> {
  factory _$TranslationCheckResultModelCopyWith(_TranslationCheckResultModel value, $Res Function(_TranslationCheckResultModel) _then) = __$TranslationCheckResultModelCopyWithImpl;
@override @useResult
$Res call({
 String correctTranslation, int score, List<MistakeModel> mistakes
});




}
/// @nodoc
class __$TranslationCheckResultModelCopyWithImpl<$Res>
    implements _$TranslationCheckResultModelCopyWith<$Res> {
  __$TranslationCheckResultModelCopyWithImpl(this._self, this._then);

  final _TranslationCheckResultModel _self;
  final $Res Function(_TranslationCheckResultModel) _then;

/// Create a copy of TranslationCheckResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? correctTranslation = null,Object? score = null,Object? mistakes = null,}) {
  return _then(_TranslationCheckResultModel(
correctTranslation: null == correctTranslation ? _self.correctTranslation : correctTranslation // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,mistakes: null == mistakes ? _self._mistakes : mistakes // ignore: cast_nullable_to_non_nullable
as List<MistakeModel>,
  ));
}


}

// dart format on
