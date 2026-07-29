import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractionProcessControlPackage where
  feedPretreatment : Prop
  solventSelection : Prop
  temperaturePressureControl : Prop
  phaseRatioControl : Prop
  solventRecovery : Prop

structure ExtractionProcessControlEvidence (C : ExtractionProcessControlPackage) where
  feedPretreatmentClosed : C.feedPretreatment
  solventSelectionClosed : C.solventSelection
  temperaturePressureControlClosed : C.temperaturePressureControl
  phaseRatioControlClosed : C.phaseRatioControl
  solventRecoveryClosed : C.solventRecovery

def ExtractionProcessControlClosed (C : ExtractionProcessControlPackage) : Prop :=
  C.feedPretreatment ∧ C.solventSelection ∧
  C.temperaturePressureControl ∧ C.phaseRatioControl ∧
  C.solventRecovery

theorem extraction_process_control_closed_from_evidence (C : ExtractionProcessControlPackage) (Ev : ExtractionProcessControlEvidence C) :
    ExtractionProcessControlClosed C := by
  exact And.intro Ev.feedPretreatmentClosed (
    And.intro Ev.solventSelectionClosed (
    And.intro Ev.temperaturePressureControlClosed (
    And.intro Ev.phaseRatioControlClosed Ev.solventRecoveryClosed)))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse