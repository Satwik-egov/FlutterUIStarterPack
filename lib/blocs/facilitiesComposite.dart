import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/blocs/facility.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/entities/project_facility.dart';
import 'package:new_digit_app/model/facilities/facility.dart';
import 'package:new_digit_app/repositories/facility_repo.dart';
import 'package:new_digit_app/repositories/project_facility_repo.dart';

part 'facilitiesComposite.freezed.dart';

typedef FacilityStateEmitter = Emitter<FacilityCompositeState>;

class FacilityCompositeBloc
    extends Bloc<FacilityCompositeEvent, FacilityCompositeState> {
  FacilityCompositeBloc() : super(const FacilityCompositeEmptyState()) {
    on(_handleLoadFacilitiesForProjectId);
  }

  final _facilityBloc = FacilityBloc(const FacilityEmptyState());

  Future<void> _handleLoadFacilitiesForProjectId(
    FacilityCompositeLoadForProjectEvent event,
    FacilityStateEmitter emit,
  ) async {
    final facilityRemoteRepository = FacilityRemoteRepository();
    final projectFacilityRemoteRepository = ProjectFacilityRemoteRepository();
    emit(const FacilityCompositeLoadingState());

    final projectFacilities = await projectFacilityRemoteRepository.search(
        ProjectFacilitySearchModel(projectId: [event.projectId]),
        event.actionMap);

    List<FacilityModel> facilities = [];

    for (final projectFacility in projectFacilities) {
      var results = await facilityRemoteRepository.search(
          FacilitySearchModel(id: [projectFacility.facilityId]),
          event.actionMap);

      facilities.addAll(results);
    }

    _facilityBloc
        .add(FacilityEvent.loadForProjectId(projectId: event.projectId));

    if (facilities.isEmpty) {
      emit(const FacilityCompositeEmptyState());
    } else {
      emit(FacilityCompositeFetchedState(
        facilities: facilities,
        // allFacilities: allFacilities,
      ));
    }
  }
}

@freezed
class FacilityCompositeEvent with _$FacilityCompositeEvent {
  const factory FacilityCompositeEvent.loadForProjectId(
          {required String projectId,
          // @Default(true) bool loadAllProjects,
          required Map<DataModelType, Map<ApiOperation, String>>? actionMap}) =
      FacilityCompositeLoadForProjectEvent;
}

@freezed
class FacilityCompositeState with _$FacilityCompositeState {
  const factory FacilityCompositeState.empty() = FacilityCompositeEmptyState;

  const factory FacilityCompositeState.loading() =
      FacilityCompositeLoadingState;

  const factory FacilityCompositeState.fetched({
    required List<FacilityModel> facilities,
    // @Default([]) List<FacilityModel> allFacilities,
  }) = FacilityCompositeFetchedState;
}
