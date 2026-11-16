// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextModel {

 int get id; String get title; List<String> get text; int get level;
/// Create a copy of TextModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextModelCopyWith<TextModel> get copyWith => _$TextModelCopyWithImpl<TextModel>(this as TextModel, _$identity);

  /// Serializes this TextModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TextModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.text, _this.text)&&(identical(other.level, _this.level) || other.level == _this.level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TextModel;
  return Object.hash(runtimeType,_this.id,_this.title,const DeepCollectionEquality().hash(_this.text),_this.level);
}

@override
String toString() {
  final _this = this as TextModel;
  return 'TextModel(id: ${_this.id}, title: ${_this.title}, text: ${_this.text}, level: ${_this.level})';
}


}

/// @nodoc
abstract mixin class $TextModelCopyWith<$Res>  {
  factory $TextModelCopyWith(TextModel value, $Res Function(TextModel) _then) = _$TextModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, List<String> text, int level
});




}
/// @nodoc
class _$TextModelCopyWithImpl<$Res>
    implements $TextModelCopyWith<$Res> {
  _$TextModelCopyWithImpl(this._self, this._then);

  final TextModel _self;
  final $Res Function(TextModel) _then;

/// Create a copy of TextModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? text = null,Object? level = null,}) {
  return _then(TextModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as List<String>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TextModel].
extension TextModelPatterns on TextModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextModel value)  $default,){
final _that = this;
switch (_that) {
case _TextModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  List<String> text,  int level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextModel() when $default != null:
return $default(_that.id,_that.title,_that.text,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  List<String> text,  int level)  $default,) {final _that = this;
switch (_that) {
case _TextModel():
return $default(_that.id,_that.title,_that.text,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  List<String> text,  int level)?  $default,) {final _that = this;
switch (_that) {
case _TextModel() when $default != null:
return $default(_that.id,_that.title,_that.text,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextModel extends TextModel {
  const _TextModel({required this.id, required this.title, required  List<String> text, required this.level}): _text = text,super._();
  factory _TextModel.fromJson(Map<String, dynamic> json) => _$TextModelFromJson(json);

@override final  int id;
@override final  String title;
 final  List<String> _text;
@override List<String> get text {
  if (_text is EqualUnmodifiableListView) return _text;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_text);
}

@override final  int level;

/// Create a copy of TextModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextModelCopyWith<_TextModel> get copyWith => __$TextModelCopyWithImpl<_TextModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.text, _text)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_text),level);
}

@override
String toString() {
    return 'TextModel(id: $id, title: $title, text: $text, level: $level)';
}


}

/// @nodoc
abstract mixin class _$TextModelCopyWith<$Res> implements $TextModelCopyWith<$Res> {
  factory _$TextModelCopyWith(_TextModel value, $Res Function(_TextModel) _then) = __$TextModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, List<String> text, int level
});




}
/// @nodoc
class __$TextModelCopyWithImpl<$Res>
    implements _$TextModelCopyWith<$Res> {
  __$TextModelCopyWithImpl(this._self, this._then);

  final _TextModel _self;
  final $Res Function(_TextModel) _then;

/// Create a copy of TextModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? text = null,Object? level = null,}) {
  return _then(_TextModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self._text : text // ignore: cast_nullable_to_non_nullable
as List<String>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
