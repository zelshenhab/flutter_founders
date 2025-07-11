import 'package:equatable/equatable.dart';

abstract class CreateRequestEvent extends Equatable {
  const CreateRequestEvent();

  @override
  List<Object?> get props => [];
}

class TitleChanged extends CreateRequestEvent {
  final String title;
  const TitleChanged(this.title);

  @override
  List<Object?> get props => [title];
}

class DescriptionChanged extends CreateRequestEvent {
  final String description;
  const DescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

class TagsChanged extends CreateRequestEvent {
  final List<String> tags;
  const TagsChanged(this.tags);

  @override
  List<Object?> get props => [tags];
}

class SubmitRequest extends CreateRequestEvent {}
