import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractorDesignHydraulicsPackage where
  dispersedPhaseHoldUp : Prop
  dropSizeDistribution : Prop
  slipVelocity : Prop
  floodingVelocity : Prop
  coalescenceDispersion : Prop

structure ExtractorDesignHydraulicsEvidence (H : ExtractorDesignHydraulicsPackage) where
  dispersedPhaseHoldUpClosed : H.dispersedPhaseHoldUp
  dropSizeDistributionClosed : H.dropSizeDistribution
  slipVelocityClosed : H.slipVelocity
  floodingVelocityClosed : H.floodingVelocity
  coalescenceDispersionClosed : H.coalescenceDispersion

def ExtractorDesignHydraulicsClosed (H : ExtractorDesignHydraulicsPackage) : Prop :=
  H.dispersedPhaseHoldUp ∧ H.dropSizeDistribution ∧
  H.slipVelocity ∧ H.floodingVelocity ∧
  H.coalescenceDispersion

theorem extractor_design_hydraulics_closed_from_evidence (H : ExtractorDesignHydraulicsPackage) (Ev : ExtractorDesignHydraulicsEvidence H) :
    ExtractorDesignHydraulicsClosed H := by
  exact And.intro Ev.dispersedPhaseHoldUpClosed (
    And.intro Ev.dropSizeDistributionClosed (
    And.intro Ev.slipVelocityClosed (
    And.intro Ev.floodingVelocityClosed Ev.coalescenceDispersionClosed)))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse