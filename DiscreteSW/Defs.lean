/-
Copyright (c) 2026 Joris Roos. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Joris Roos
-/

module

public import Mathlib

/-!

Definition of discrete Carleson operator of Stein-Wainger type

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

/-- The notion of homogeneous CZ kernels from arXiv:1907.00405.

**Implementation note:** In line with Mathlib's junk value conventions
this definition forces the junk value `K 0 = 0` when `n ≥ 1`.
-/
def IsHomogeneousCZKernel (K : ℝ^n → ℂ) : Prop :=
  ∃ Ω : ℝ^n → ℂ,
    ContDiffOn ℝ ∞ Ω {0}ᶜ ∧
    (∀ x, x ≠ 0 → ∀ t : ℝ, 0 < t → Ω (t • x) = Ω x) ∧
    ∫ θ : Metric.sphere (0 : ℝ^n) 1, Ω θ ∂volume.toSphere = 0 ∧
    ∀ x, K x = Ω x / ‖x‖ ^ n

/-- Summand in the discrete Carleson operator -/
def discreteCarlesonSummand (d : ℕ) (K : ℝ^n → ℂ) (f : ℤ^n → ℂ) (x : ℤ^n) (t : ℝ) (y : ℤ^n) : ℂ :=
  cexp (2 * π * I * t * ‖(y : ℝ^n)‖ ^ (2 * d)) * K y * f (x - y)

/-- The discrete Carleson operator of Stein-Wainger type as defined in arXiv:1907.00405.

**Implementation note:** We let the sum extend over all `y : ℤ^n` with the understanding
that the summand takes the junk value `0` at `0` if `K` is a homogeneous CZ kernel and `n ≥ 1`.
-/
def discreteCarleson (d : ℕ) (K : ℝ^n → ℂ) (f : ℤ^n → ℂ) (x : ℤ^n) : ℝ≥0∞ :=
  ⨆ t : ℝ, ‖∑' y, discreteCarlesonSummand d K f x t y‖ₑ

end DiscreteSW

end
