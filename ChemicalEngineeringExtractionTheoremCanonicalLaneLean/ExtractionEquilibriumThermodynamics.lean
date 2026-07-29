import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractionEquilibriumPackage where
  soluteTransfer : Prop
  massBalanceFugacity : Prop
  equilibriumConstantCorrelation : Prop
  operatingLine : Prop
  drivingForce : Prop

structure ExtractionEquilibriumEvidence (E : ExtractionEquilibriumPackage) where
  soluteTransferClosed : E.soluteTransfer
  massBalanceFugacityClosed : E.massBalanceFugacity
  equilibriumConstantCorrelationClosed : E.equilibriumConstantCorrelation
  operatingLineClosed : E.operatingLine
  drivingForceClosed : E.drivingForce

def ExtractionEquilibriumClosed (E : ExtractionEquilibriumPackage) : Prop :=
  E.soluteTransfer ∧ E.massBalanceFugacity ∧
  E.equilibriumConstantCorrelation ∧ E.operatingLine ∧
  E.drivingForce

theorem extraction_equilibrium_closed_from_evidence (E : ExtractionEquilibriumPackage) (Ev : ExtractionEquilibriumEvidence E) :
    ExtractionEquilibriumClosed E := by
  exact And.intro Ev.soluteTransferClosed (
    And.intro Ev.massBalanceFugacityClosed (
    And.intro Ev.equilibriumConstantCorrelationClosed (
    And.intro Ev.operatingLineClosed Ev.drivingForceClosed)))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse