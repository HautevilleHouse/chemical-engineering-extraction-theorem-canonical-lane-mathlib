import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractionColumnHydraulicsPackage where
  columnDiameter : ℝ
  holdup : ℝ
  floodingVelocity : ℝ
  pressureDrop : ℝ
  operationalVelocity : ℝ
  floodingMargin : Prop
  hydraulicRegimeStable : Prop
  floodingMarginTerm : floodingMargin
  hydraulicRegimeStableTerm : hydraulicRegimeStable

structure ExtractionColumnHydraulicsEvidence (H : ExtractionColumnHydraulicsPackage) where
  floodingMarginClosed : H.floodingMargin
  hydraulicRegimeStableClosed : H.hydraulicRegimeStable

def ExtractionColumnHydraulicsClosed (H : ExtractionColumnHydraulicsPackage) : Prop :=
  H.floodingMargin ∧ H.hydraulicRegimeStable

theorem extraction_column_hydraulics_closed_from_evidence
    (H : ExtractionColumnHydraulicsPackage) (Ev : ExtractionColumnHydraulicsEvidence H) :
    ExtractionColumnHydraulicsClosed H := by
  exact And.intro Ev.floodingMarginClosed Ev.hydraulicRegimeStableClosed

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse