part of 'analytics_bloc.dart';

sealed class AnalyticsState extends Equatable {
  const AnalyticsState();
  
  @override
  List<Object> get props => [];
}

final class AnalyticsInitial extends AnalyticsState {}
