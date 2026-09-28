/-
Copyright (c) 2026 Joris Roos. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Joris Roos
-/

module

public import Mathlib

namespace DiscreteSW

noncomputable section

open ENNReal MeasureTheory

/-- The integer lattice `ℤⁿ`. -/
scoped notation "ℤ^" n:max => Fin n → ℤ

@[inherit_doc EuclideanSpace]
scoped notation "ℝ^" n:max => EuclideanSpace ℝ (Fin n)

variable {n : ℕ}

/-- The notion of homogeneous CZ kernels from arXiv:1907.00405 -/
def IsHomogeneousCZKernel (K : ℝ^n → ℂ) :=
  ∃ Ω : ℝ^n → ℂ,
    ContDiffOn ℝ ∞ Ω {0}ᶜ ∧
    (∀ x, x ≠ 0 → ∀ t : ℝ, 0 < t → Ω (t • x) = Ω x) ∧
    ∫ θ, Ω θ ∂volume.toSphere = 0 ∧
    ∀ x, x ≠ 0 → K x = Ω x / ‖x‖ ^ n

/-- The discrete Carleson operator as defined in arXiv:1907.00405 -/
def discreteCarleson (d : ℕ) (K : ℝ^n → ℂ) (f : ℤ^n → ℂ) (x : ℤ^n) : ℝ≥0∞ :=
  sorry

end

end DiscreteSW
