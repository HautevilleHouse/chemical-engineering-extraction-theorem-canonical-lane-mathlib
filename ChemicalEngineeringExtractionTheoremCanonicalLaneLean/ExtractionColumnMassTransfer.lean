import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure MassTransferColumnPackage where
  liquidPhaseConcentration : Type u₀
  vaporPhaseConcentration : Type u₁
  columnHeight : Type u₂
  overallMassTransferCoefficient : Type u₃
  murphreeEfficiency : Prop
  heightEquivalentTheoreticalPlate : Prop
  concentrationProfileAdmissible : Prop
  efficiencyClosed : Prop

structure MassTransferColumnEvidence (C : MassTransferColumnPackage) where
  murphreeEfficiencyClosed : C.murphreeEfficiency
  heightEquivalentTheoreticalPlateClosed : C.heightEquivalentTheoreticalPlate
  concentrationProfileAdmissibleClosed : C.concentrationProfileAdmissible
  efficiencyClosed : C.efficiencyClosed

def MassTransferColumnClosed (C : MassTransferColumnPackage) : Prop :=
  C.murphreeEfficiency ∧ C.heightEquivalentTheoreticalPlate ∧
  C.concentrationProfileAdmissible ∧ C.efficiencyClosed

theorem mass_transfer_column_closed_from_evidence (C : MassTransferColumnPackage)
    (E : MassTransferColumnEvidence C) : MassTransferColumnClosed C := by
  exact And.intro E.murphreeEfficiencyClosed
    (And.intro E.heightEquivalentTheoreticalPlateClosed
      (And.intro E.concentrationProfileAdmissibleClosed E.efficiencyClosed))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse
