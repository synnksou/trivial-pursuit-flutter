// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String answer) setAnswerQuestionState,
    required TResult Function() next,
    required TResult Function(List<FormQuestion> questions) retrieved,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SetAnswer value) setAnswerQuestionState,
    required TResult Function(Next value) next,
    required TResult Function(Retrieved value) retrieved,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'GameState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String answer) setAnswerQuestionState,
    required TResult Function() next,
    required TResult Function(List<FormQuestion> questions) retrieved,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SetAnswer value) setAnswerQuestionState,
    required TResult Function(Next value) next,
    required TResult Function(Retrieved value) retrieved,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements GameState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, (v) => _then(v as _$Loading));

  @override
  _$Loading get _value => super._value as _$Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'GameState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String answer) setAnswerQuestionState,
    required TResult Function() next,
    required TResult Function(List<FormQuestion> questions) retrieved,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SetAnswer value) setAnswerQuestionState,
    required TResult Function(Next value) next,
    required TResult Function(Retrieved value) retrieved,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements GameState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$SetAnswerCopyWith<$Res> {
  factory _$$SetAnswerCopyWith(
          _$SetAnswer value, $Res Function(_$SetAnswer) then) =
      __$$SetAnswerCopyWithImpl<$Res>;
  $Res call({String answer});
}

/// @nodoc
class __$$SetAnswerCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$$SetAnswerCopyWith<$Res> {
  __$$SetAnswerCopyWithImpl(
      _$SetAnswer _value, $Res Function(_$SetAnswer) _then)
      : super(_value, (v) => _then(v as _$SetAnswer));

  @override
  _$SetAnswer get _value => super._value as _$SetAnswer;

  @override
  $Res call({
    Object? answer = freezed,
  }) {
    return _then(_$SetAnswer(
      answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetAnswer implements SetAnswer {
  const _$SetAnswer(this.answer);

  @override
  final String answer;

  @override
  String toString() {
    return 'GameState.setAnswerQuestionState(answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAnswer &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$SetAnswerCopyWith<_$SetAnswer> get copyWith =>
      __$$SetAnswerCopyWithImpl<_$SetAnswer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String answer) setAnswerQuestionState,
    required TResult Function() next,
    required TResult Function(List<FormQuestion> questions) retrieved,
    required TResult Function(String error) error,
  }) {
    return setAnswerQuestionState(answer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
  }) {
    return setAnswerQuestionState?.call(answer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (setAnswerQuestionState != null) {
      return setAnswerQuestionState(answer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SetAnswer value) setAnswerQuestionState,
    required TResult Function(Next value) next,
    required TResult Function(Retrieved value) retrieved,
    required TResult Function(Error value) error,
  }) {
    return setAnswerQuestionState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
  }) {
    return setAnswerQuestionState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (setAnswerQuestionState != null) {
      return setAnswerQuestionState(this);
    }
    return orElse();
  }
}

abstract class SetAnswer implements GameState {
  const factory SetAnswer(final String answer) = _$SetAnswer;

  String get answer => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SetAnswerCopyWith<_$SetAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NextCopyWith<$Res> {
  factory _$$NextCopyWith(_$Next value, $Res Function(_$Next) then) =
      __$$NextCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$$NextCopyWith<$Res> {
  __$$NextCopyWithImpl(_$Next _value, $Res Function(_$Next) _then)
      : super(_value, (v) => _then(v as _$Next));

  @override
  _$Next get _value => super._value as _$Next;
}

/// @nodoc

class _$Next implements Next {
  const _$Next();

  @override
  String toString() {
    return 'GameState.next()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Next);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String answer) setAnswerQuestionState,
    required TResult Function() next,
    required TResult Function(List<FormQuestion> questions) retrieved,
    required TResult Function(String error) error,
  }) {
    return next();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
  }) {
    return next?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SetAnswer value) setAnswerQuestionState,
    required TResult Function(Next value) next,
    required TResult Function(Retrieved value) retrieved,
    required TResult Function(Error value) error,
  }) {
    return next(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
  }) {
    return next?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(this);
    }
    return orElse();
  }
}

abstract class Next implements GameState {
  const factory Next() = _$Next;
}

/// @nodoc
abstract class _$$RetrievedCopyWith<$Res> {
  factory _$$RetrievedCopyWith(
          _$Retrieved value, $Res Function(_$Retrieved) then) =
      __$$RetrievedCopyWithImpl<$Res>;
  $Res call({List<FormQuestion> questions});
}

/// @nodoc
class __$$RetrievedCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$$RetrievedCopyWith<$Res> {
  __$$RetrievedCopyWithImpl(
      _$Retrieved _value, $Res Function(_$Retrieved) _then)
      : super(_value, (v) => _then(v as _$Retrieved));

  @override
  _$Retrieved get _value => super._value as _$Retrieved;

  @override
  $Res call({
    Object? questions = freezed,
  }) {
    return _then(_$Retrieved(
      questions == freezed
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<FormQuestion>,
    ));
  }
}

/// @nodoc

class _$Retrieved implements Retrieved {
  const _$Retrieved(final List<FormQuestion> questions)
      : _questions = questions;

  final List<FormQuestion> _questions;
  @override
  List<FormQuestion> get questions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'GameState.retrieved(questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Retrieved &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  _$$RetrievedCopyWith<_$Retrieved> get copyWith =>
      __$$RetrievedCopyWithImpl<_$Retrieved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String answer) setAnswerQuestionState,
    required TResult Function() next,
    required TResult Function(List<FormQuestion> questions) retrieved,
    required TResult Function(String error) error,
  }) {
    return retrieved(questions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
  }) {
    return retrieved?.call(questions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (retrieved != null) {
      return retrieved(questions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SetAnswer value) setAnswerQuestionState,
    required TResult Function(Next value) next,
    required TResult Function(Retrieved value) retrieved,
    required TResult Function(Error value) error,
  }) {
    return retrieved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
  }) {
    return retrieved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (retrieved != null) {
      return retrieved(this);
    }
    return orElse();
  }
}

abstract class Retrieved implements GameState {
  const factory Retrieved(final List<FormQuestion> questions) = _$Retrieved;

  List<FormQuestion> get questions => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RetrievedCopyWith<_$Retrieved> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, (v) => _then(v as _$Error));

  @override
  _$Error get _value => super._value as _$Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GameState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String answer) setAnswerQuestionState,
    required TResult Function() next,
    required TResult Function(List<FormQuestion> questions) retrieved,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String answer)? setAnswerQuestionState,
    TResult Function()? next,
    TResult Function(List<FormQuestion> questions)? retrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SetAnswer value) setAnswerQuestionState,
    required TResult Function(Next value) next,
    required TResult Function(Retrieved value) retrieved,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SetAnswer value)? setAnswerQuestionState,
    TResult Function(Next value)? next,
    TResult Function(Retrieved value)? retrieved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements GameState {
  const factory Error(final String error) = _$Error;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
