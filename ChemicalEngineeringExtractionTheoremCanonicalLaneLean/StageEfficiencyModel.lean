import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure StageEfficiencyModelPackage where
  murphreeEfficiency : Prop
  overallStageEfficiency : Prop
  pointEfficiency : Prop
  liquidFilmEfficiency : Prop
  effectOfViscosity : Prop

structure StageEfficiencyModelEvidence (S : StageEfficiencyModelPackage) where
  murphreeEfficiencyClosed : S.murphreeEfficiency
  overallStageEfficiencyClosed : S.overallStageEfficiency
  pointEfficiencyClosed : S.pointEfficiency
  liquidFilmEfficiencyClosed : S.liquidFilmEfficiency
  effectOfViscosityClosed : S.effectOfViscosity

def StageEfficiencyModelClosed (S : StageEfficiencyModelPackage) : Prop :=
  S.murphreeEfficiency ∧ S.overallStageEfficiency ∧
  S.pointEfficiency ∧ S.liquidFilmEfficiency ∧
  S.effectOfViscosity

theorem stage_efficiency_model_closed_from_evidence (S : StageEfficiencyModelPackage) (Ev : StageEfficiencyModelEvidence S) :
    StageEfficiencyModelClosed S := by
  exact And.intro Ev.murphreeEfficiencyClosed (
    And.intro Ev.overallStageEfficiencyClosed (
    And.intro Ev.pointEfficiencyClosed (
    And.intro Ev.liquidFilmEfficiencyClosed Ev.effectOfViscosityClosed)))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse