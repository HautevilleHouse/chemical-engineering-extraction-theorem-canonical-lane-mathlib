import HautevilleHouse.ChemicalEngineeringExtractionTheoremCanonicalLaneLean.MassTransferKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure StageEfficiencyPackage where
  murphreeEfficiency : ℝ
  actualStages : ℕ
  idealStages : ℕ
  stageCalculationMethod : String
  overallEfficiency : ℝ
  operatingConditionsValid : Prop
  efficiencyCorrelationValid : Prop

structure StageEfficiencyEvidence (S : StageEfficiencyPackage) where
  murphreeEfficiencyClosed : S.murphreeEfficiency > 0 ∧ S.murphreeEfficiency ≤ 1
  actualStagesClosed : S.actualStages ≥ S.idealStages
  idealStagesClosed : S.idealStages > 0
  stageCalculationMethodClosed : S.stageCalculationMethod = "McCabe-Thiele" ∨ S.stageCalculationMethod = "Kremser"
  overallEfficiencyClosed : S.overallEfficiency > 0 ∧ S.overallEfficiency ≤ 1
  operatingConditionsValidClosed : S.operatingConditionsValid
  efficiencyCorrelationValidClosed : S.efficiencyCorrelationValid

def StageEfficiencyClosed (S : StageEfficiencyPackage) : Prop :=
  (S.murphreeEfficiency > 0 ∧ S.murphreeEfficiency ≤ 1) ∧
  S.actualStages ≥ S.idealStages ∧
  S.idealStages > 0 ∧
  (S.stageCalculationMethod = "McCabe-Thiele" ∨ S.stageCalculationMethod = "Kremser") ∧
  (S.overallEfficiency > 0 ∧ S.overallEfficiency ≤ 1) ∧
  S.operatingConditionsValid ∧
  S.efficiencyCorrelationValid

theorem stage_efficiency_closed_from_evidence
    (S : StageEfficiencyPackage) (Ev : StageEfficiencyEvidence S) :
    StageEfficiencyClosed S := by
  exact And.intro Ev.murphreeEfficiencyClosed
    (And.intro Ev.actualStagesClosed
      (And.intro Ev.idealStagesClosed
        (And.intro Ev.stageCalculationMethodClosed
          (And.intro Ev.overallEfficiencyClosed
            (And.intro Ev.operatingConditionsValidClosed
              Ev.efficiencyCorrelationValidClosed)))))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse