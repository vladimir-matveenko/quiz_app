// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mistake_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MistakeModel {

 String get word; String get suggestion; String get reason;
/// Create a copy of MistakeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MistakeModelCopyWith<MistakeModel> get copyWith => _$MistakeModelCopyWithImpl<MistakeModel>(this as MistakeModel, _$identity);

  /// Serializes this MistakeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MistakeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MistakeModel&&(identical(other.word, _this.word) || other.word == _this.word)&&(identical(other.suggestion, _this.suggestion) || other.suggestion == _this.suggestion)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MistakeModel;
  return Object.hash(runtimeType,_this.word,_this.suggestion,_this.reason);
}

@override
String toString() {
  final _this = this as MistakeModel;
  return 'MistakeModel(word: ${_this.word}, suggestion: ${_this.suggestion}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $MistakeModelCopyWith<$Res>  {
  factory $MistakeModelCopyWith(MistakeModel value, $Res Function(MistakeModel) _then) = _$MistakeModelCopyWithImpl;
@useResult
$Res call({
 String word, String suggestion, String reason
});




}
/// @nodoc
class _$MistakeModelCopyWithImpl<$Res>
    implements $MistakeModelCopyWith<$Res> {
  _$MistakeModelCopyWithImpl(this._self, this._then);

  final MistakeModel _self;
  final $Res Function(MistakeModel) _then;

/// Create a copy of MistakeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? suggestion = null,Object? reason = null,}) {
  return _then(MistakeModel(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,suggestion: null == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MistakeModel].
extension MistakeModelPatterns on MistakeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MistakeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MistakeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MistakeModel value)  $default,){
final _that = this;
switch (_that) {
case _MistakeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MistakeModel value)?  $default,){
final _that = this;
switch (_that) {
case _MistakeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  String suggestion,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MistakeModel() when $default != null:
return $default(_that.word,_that.suggestion,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  String suggestion,  String reason)  $default,) {final _that = this;
switch (_that) {
case _MistakeModel():
return $default(_that.word,_that.suggestion,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  String suggestion,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _MistakeModel() when $default != null:
return $default(_that.word,_that.suggestion,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MistakeModel implements MistakeModel {
  const _MistakeModel({required this.word, required this.suggestion, required this.reason});
  factory _MistakeModel.fromJson(Map<String, dynamic> json) => _$MistakeModelFromJson(json);

@override final  String word;
@override final  String suggestion;
@override final  String reason;

/// Create a copy of MistakeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MistakeModelCopyWith<_MistakeModel> get copyWith => __$MistakeModelCopyWithImpl<_MistakeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MistakeModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MistakeModel&&(identical(other.word, word) || other.word == word)&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,word,suggestion,reason);
}

@override
String toString() {
    return 'MistakeModel(word: $word, suggestion: $suggestion, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$MistakeModelCopyWith<$Res> implements $MistakeModelCopyWith<$Res> {
  factory _$MistakeModelCopyWith(_MistakeModel value, $Res Function(_MistakeModel) _then) = __$MistakeModelCopyWithImpl;
@override @useResult
$Res call({
 String word, String suggestion, String reason
});




}
/// @nodoc
class __$MistakeModelCopyWithImpl<$Res>
    implements _$MistakeModelCopyWith<$Res> {
  __$MistakeModelCopyWithImpl(this._self, this._then);

  final _MistakeModel _self;
  final $Res Function(_MistakeModel) _then;

/// Create a copy of MistakeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? suggestion = null,Object? reason = null,}) {
  return _then(_MistakeModel(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,suggestion: null == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
