part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailData extends DetailEvent {
  final int id;
  const GetDetailData({required this.id});
}
