/-
Copyright (c) 2026 Joris Roos. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
This file was assembled by Claude from the human-written files `Defs.lean`, `Theorems.lean`.
No comments were added by Claude.
-/

module

public import Mathlib

/-!
# Challenge file for Comparator
-/

@[expose] public noncomputable section

namespace DiscreteSW

open ENNReal MeasureTheory Complex Real
open scoped ContDiff

/-- The integer lattice `ℤⁿ`. -/
scoped notation "ℤ^" n:max => Fin n → ℤ

@[inherit_doc EuclideanSpace]
scoped notation "ℝ^" n:max => EuclideanSpace ℝ (Fin n)

variable {n : ℕ}

/-- Coercion from `ℤ^n` to `ℝ^n` -/
@[coe] def toEucl (y : ℤ^n) : ℝ^n := WithLp.toLp 2 (y ·)

scoped instance : Coe (ℤ^n) (ℝ^n) := ⟨toEucl⟩

/-- The notion of homogeneous CZ kernels from arXiv:1907.00405. -/
def IsHomogeneousCZKernel (K : ℝ^n → ℂ) : Prop :=
  ∃ Ω : ℝ^n → ℂ,
    ContDiffOn ℝ ∞ Ω {0}ᶜ ∧
    (∀ x, x ≠ 0 → ∀ t : ℝ, 0 < t → Ω (t • x) = Ω x) ∧
    ∫ θ : Metric.sphere (0 : ℝ^n) 1, Ω θ ∂volume.toSphere = 0 ∧
    ∀ x, K x = Ω x / ‖x‖ ^ n

/-- Summand in the discrete Carleson operator -/
def discreteCarlesonSummand (d : ℕ) (K : ℝ^n → ℂ) (f : ℤ^n → ℂ) (x : ℤ^n) (t : ℝ) (y : ℤ^n) : ℂ :=
  cexp (2 * π * I * t * ‖(y : ℝ^n)‖ ^ (2 * d)) * K y * f (x - y)

/-- The discrete Carleson operator of Stein-Wainger type as defined in arXiv:1907.00405. -/
def discreteCarleson (d : ℕ) (K : ℝ^n → ℂ) (f : ℤ^n → ℂ) (x : ℤ^n) : ℝ≥0∞ :=
  ⨆ t : ℝ, ‖∑' y, discreteCarlesonSummand d K f x t y‖ₑ

end DiscreteSW

end

public section

open DiscreteSW
open ENNReal MeasureTheory

variable {n d : ℕ}

/-- **Theorem 1 of arXiv:2107.14616.** The discrete Carleson operator of Stein-Wainger type
is bounded on `ℓ^p` for all `1 < p < ∞`. -/
theorem discrete_carleson_stein_wainger (hn : 1 ≤ n) (hd : 1 ≤ d) {K : ℝ^n → ℂ}
    (hK : IsHomogeneousCZKernel K) {p : ℝ≥0∞} (hp : 1 < p) (hp' : p < ∞) :
    ∃ C : ℝ, ∀ f : ℤ^n → ℂ, MemLp f p .count →
      (∀ t x, Summable (discreteCarlesonSummand d K f x t)) ∧
        eLpNorm (discreteCarleson d K f) p .count ≤ ENNReal.ofReal C * eLpNorm f p .count := by
  sorry

end
