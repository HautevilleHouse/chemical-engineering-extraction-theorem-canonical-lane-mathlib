import ChemicalEngineeringExtractionTheoremCanonicalLaneLean.MassTransfer

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractionKineticsPackage (M : MassTransferPackage) where
  filmModel : Prop
  penetrationModel : Prop
  surfaceRenewalModel : Prop
  overallMassTransferCoefficient : Prop
  diffusivity : Prop
  filmModelClosed : filmModel
  penetrationModelClosed : penetrationModel
  surfaceRenewalModelClosed : surfaceRenewalModel
  overallMassTransferCoefficientClosed : overallMassTransferCoefficient
  diffusivityClosed : diffusivity

structure ExtractionKineticsEvidence {M : MassTransferPackage}
    (K : ExtractionKineticsPackage M) where
  filmModelClosed : K.filmModel
  penetrationModelClosed : K.penetrationModel
  surfaceRenewalModelClosed : K.surfaceRenewalModel
  overallMassTransferCoefficientClosed : K.overallMassTransferCoefficient
  diffusivityClosed : K.diffusivity

def ExtractionKineticsClosed {M : MassTransferPackage}
    (K : ExtractionKineticsPackage M) : Prop :=
  K.filmModel ∧ K.penetrationModel ∧ K.surfaceRenewalModel ∧
  K.overallMassTransferCoefficient ∧ K.diffusivity

theorem extraction_kinetics_closed_from_evidence
    {M : MassTransferPackage} (K : ExtractionKineticsPackage M)
    (E : ExtractionKineticsEvidence K) : ExtractionKineticsClosed K := by
  exact And.intro E.filmModelClosed
    (And.intro E.penetrationModelClosed
      (And.intro E.surfaceRenewalModelClosed
        (And.intro E.overallMassTransferCoefficientClosed E.diffusivityClosed)))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse
