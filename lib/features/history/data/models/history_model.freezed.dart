// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryModel {

 TestType get testType; DateTime get saved; int get correctAnswers; int get totalAnswers;
/// Create a copy of HistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryModelCopyWith<HistoryModel> get copyWith => _$HistoryModelCopyWithImpl<HistoryModel>(this as HistoryModel, _$identity);

  /// Serializes this HistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HistoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryModel&&(identical(other.testType, _this.testType) || other.testType == _this.testType)&&(identical(other.saved, _this.saved) || other.saved == _this.saved)&&(identical(other.correctAnswers, _this.correctAnswers) || other.correctAnswers == _this.correctAnswers)&&(identical(other.totalAnswers, _this.totalAnswers) || other.totalAnswers == _this.totalAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HistoryModel;
  return Object.hash(runtimeType,_this.testType,_this.saved,_this.correctAnswers,_this.totalAnswers);
}

@override
String toString() {
  final _this = this as HistoryModel;
  return 'HistoryModel(testType: ${_this.testType}, saved: ${_this.saved}, correctAnswers: ${_this.correctAnswers}, totalAnswers: ${_this.totalAnswers})';
}


}

/// @nodoc
abstract mixin class $HistoryModelCopyWith<$Res>  {
  factory $HistoryModelCopyWith(HistoryModel value, $Res Function(HistoryModel) _then) = _$HistoryModelCopyWithImpl;
@useResult
$Res call({
 TestType testType, DateTime saved, int correctAnswers, int totalAnswers
});




}
/// @nodoc
class _$HistoryModelCopyWithImpl<$Res>
    implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._self, this._then);

  final HistoryModel _self;
  final $Res Function(HistoryModel) _then;

/// Create a copy of HistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? testType = null,Object? saved = null,Object? correctAnswers = null,Object? totalAnswers = null,}) {
  return _then(HistoryModel(
testType: null == testType ? _self.testType : testType // ignore: cast_nullable_to_non_nullable
as TestType,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as DateTime,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,totalAnswers: null == totalAnswers ? _self.totalAnswers : totalAnswers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryModel].
extension HistoryModelPatterns on HistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _HistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TestType testType,  DateTime saved,  int correctAnswers,  int totalAnswers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryModel() when $default != null:
return $default(_that.testType,_that.saved,_that.correctAnswers,_that.totalAnswers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TestType testType,  DateTime saved,  int correctAnswers,  int totalAnswers)  $default,) {final _that = this;
switch (_that) {
case _HistoryModel():
return $default(_that.testType,_that.saved,_that.correctAnswers,_that.totalAnswers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TestType testType,  DateTime saved,  int correctAnswers,  int totalAnswers)?  $default,) {final _that = this;
switch (_that) {
case _HistoryModel() when $default != null:
return $default(_that.testType,_that.saved,_that.correctAnswers,_that.totalAnswers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryModel implements HistoryModel {
  const _HistoryModel({required this.testType, required this.saved, required this.correctAnswers, required this.totalAnswers});
  factory _HistoryModel.fromJson(Map<String, dynamic> json) => _$HistoryModelFromJson(json);

@override final  TestType testType;
@override final  DateTime saved;
@override final  int correctAnswers;
@override final  int totalAnswers;

/// Create a copy of HistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryModelCopyWith<_HistoryModel> get copyWith => __$HistoryModelCopyWithImpl<_HistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryModel&&(identical(other.testType, testType) || other.testType == testType)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.totalAnswers, totalAnswers) || other.totalAnswers == totalAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,testType,saved,correctAnswers,totalAnswers);
}

@override
String toString() {
    return 'HistoryModel(testType: $testType, saved: $saved, correctAnswers: $correctAnswers, totalAnswers: $totalAnswers)';
}


}

/// @nodoc
abstract mixin class _$HistoryModelCopyWith<$Res> implements $HistoryModelCopyWith<$Res> {
  factory _$HistoryModelCopyWith(_HistoryModel value, $Res Function(_HistoryModel) _then) = __$HistoryModelCopyWithImpl;
@override @useResult
$Res call({
 TestType testType, DateTime saved, int correctAnswers, int totalAnswers
});




}
/// @nodoc
class __$HistoryModelCopyWithImpl<$Res>
    implements _$HistoryModelCopyWith<$Res> {
  __$HistoryModelCopyWithImpl(this._self, this._then);

  final _HistoryModel _self;
  final $Res Function(_HistoryModel) _then;

/// Create a copy of HistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? testType = null,Object? saved = null,Object? correctAnswers = null,Object? totalAnswers = null,}) {
  return _then(_HistoryModel(
testType: null == testType ? _self.testType : testType // ignore: cast_nullable_to_non_nullable
as TestType,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as DateTime,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,totalAnswers: null == totalAnswers ? _self.totalAnswers : totalAnswers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
