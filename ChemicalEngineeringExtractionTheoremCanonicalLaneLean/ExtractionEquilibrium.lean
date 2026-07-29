import HautevilleHouse.ChemicalEngineeringExtractionTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractionEquilibriumPackage where
  distributionCoefficient : ℝ
  soluteConcentrationFeed : ℝ
  solventFlowRate : ℝ
  numberOfStages : ℕ
  equilibriumCurveAssumed : Prop
  operatingLineConstructed : Prop
  mccabeThieleDiagram : Prop
  equilibriumReached : Prop

structure ExtractionEquilibriumEvidence (E : ExtractionEquilibriumPackage) where
  distributionCoefficientClosed : E.distributionCoefficient > 0
  soluteConcentrationFeedClosed : E.soluteConcentrationFeed > 0
  solventFlowRateClosed : E.solventFlowRate > 0
  numberOfStagesClosed : E.numberOfStages > 0
  equilibriumCurveAssumedClosed : E.equilibriumCurveAssumed
  operatingLineConstructedClosed : E.operatingLineConstructed
  mccabeThieleDiagramClosed : E.mccabeThieleDiagram
  equilibriumReachedClosed : E.equilibriumReached

def ExtractionEquilibriumClosed (E : ExtractionEquilibriumPackage) : Prop :=
  E.distributionCoefficient > 0 ∧
  E.soluteConcentrationFeed > 0 ∧
  E.solventFlowRate > 0 ∧
  E.numberOfStages > 0 ∧
  E.equilibriumCurveAssumed ∧
  E.operatingLineConstructed ∧
  E.mccabeThieleDiagram ∧
  E.equilibriumReached

theorem extraction_equilibrium_closed_from_evidence
    (E : ExtractionEquilibriumPackage) (Ev : ExtractionEquilibriumEvidence E) :
    ExtractionEquilibriumClosed E := by
  exact And.intro Ev.distributionCoefficientClosed
    (And.intro Ev.soluteConcentrationFeedClosed
      (And.intro Ev.solventFlowRateClosed
        (And.intro Ev.numberOfStagesClosed
          (And.intro Ev.equilibriumCurveAssumedClosed
            (And.intro Ev.operatingLineConstructedClosed
              (And.intro Ev.mccabeThieleDiagramClosed
                Ev.equilibriumReachedClosed))))))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse