import HautevilleHouse.ChemicalEngineeringExtractionTheoremCanonicalLaneLean.ExtractionEquilibrium

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure MassTransferKineticsPackage where
  massTransferCoefficient : ℝ
  interfacialArea : ℝ
  concentrationDrivingForce : ℝ
  filmModelAssumed : Prop
  penetrationModelAssumed : Prop
  overallMassTransferCoefficient : ℝ
  heightOfTransferUnit : ℝ
  numberOfTransferUnits : ℝ

structure MassTransferKineticsEvidence (K : MassTransferKineticsPackage) where
  massTransferCoefficientClosed : K.massTransferCoefficient > 0
  interfacialAreaClosed : K.interfacialArea > 0
  concentrationDrivingForceClosed : K.concentrationDrivingForce > 0
  filmModelAssumedClosed : K.filmModelAssumed
  penetrationModelAssumedClosed : K.penetrationModelAssumed
  overallMassTransferCoefficientClosed : K.overallMassTransferCoefficient > 0
  heightOfTransferUnitClosed : K.heightOfTransferUnit > 0
  numberOfTransferUnitsClosed : K.numberOfTransferUnits > 0

def MassTransferKineticsClosed (K : MassTransferKineticsPackage) : Prop :=
  K.massTransferCoefficient > 0 ∧
  K.interfacialArea > 0 ∧
  K.concentrationDrivingForce > 0 ∧
  K.filmModelAssumed ∧
  K.penetrationModelAssumed ∧
  K.overallMassTransferCoefficient > 0 ∧
  K.heightOfTransferUnit > 0 ∧
  K.numberOfTransferUnits > 0

theorem mass_transfer_kinetics_closed_from_evidence
    (K : MassTransferKineticsPackage) (Ev : MassTransferKineticsEvidence K) :
    MassTransferKineticsClosed K := by
  exact And.intro Ev.massTransferCoefficientClosed
    (And.intro Ev.interfacialAreaClosed
      (And.intro Ev.concentrationDrivingForceClosed
        (And.intro Ev.filmModelAssumedClosed
          (And.intro Ev.penetrationModelAssumedClosed
            (And.intro Ev.overallMassTransferCoefficientClosed
              (And.intro Ev.heightOfTransferUnitClosed
                Ev.numberOfTransferUnitsClosed))))))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse