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

  Future<void> _handleLoadFacilitiesForProjectId(
    FacilityCompositeLoadForProjectEvent event,
    FacilityStateEmitter emit,
  ) async {
    try {
      emit(const FacilityCompositeLoadingState());
      final projectFacilities = await ProjectFacilityRemoteRepository().search(
          ProjectFacilitySearchModel(projectId: [event.projectId]),
          event
              .actionMap); //type '_Map<String, dynamic>' is not a subtype of type 'FutureOr<List<ProjectFacilityModel>>'

      final projectFacility =
          projectFacilities.map((e) => e.facilityId).toList();

      var facilities = await FacilityRemoteRepository()
          .search(FacilitySearchModel(id: projectFacility), event.actionMap);

      // _facilityBloc
      //     .add(FacilityEvent.loadForProjectId(projectId: event.projectId));
      print(facilities);
      if (facilities.isEmpty) {
        emit(const FacilityCompositeEmptyState());
      } else {
        emit(FacilityCompositeFetchedState(
          facilities: facilities,
          // allFacilities: allFacilities,
        ));
      }
    } catch (err) {
      print(err);
      rethrow;
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
