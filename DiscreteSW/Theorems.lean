/-
Copyright (c) 2026 Joris Roos. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Joris Roos
-/

module

public import DiscreteSW.Defs
import DiscreteSW.Auto.DiscreteSteinWainger

/-!
Statement of the main theorem from the papers
arXiv:1907.00405 and arXiv:2107.14616:
The discrete Carleson operator of Stein-Wainger type
is bounded on `ℓ^p` for all `1 < p < ∞`.
-/

public section

open DiscreteSW
open ENNReal MeasureTheory

variable {n d : ℕ}

/-- Theorem 1 of arXiv:2107.14616: The discrete Carleson operator of Stein-Wainger type
is bounded on `ℓ^p` for all `1 < p < ∞`.

**Implementation note:** The discrete Carleson operator is implemented using
Mathlib's infinite sums which are defined to be zero when the summand is not summable.
Thus, we have included the assertion that the summand is summable for all parameter values.
-/
theorem discrete_carleson_stein_wainger (hn : 1 ≤ n) (hd : 1 ≤ d) {K : ℝ^n → ℂ}
    (hK : IsHomogeneousCZKernel K) {p : ℝ≥0∞} (hp : 1 < p) (hp' : p < ∞) :
    ∃ C : ℝ, ∀ f : ℤ^n → ℂ, MemLp f p .count →
      (∀ t x, Summable (discreteCarlesonSummand d K f x t)) ∧
        eLpNorm (discreteCarleson d K f) p .count ≤ ENNReal.ofReal C * eLpNorm f p .count :=
  Auto.discrete_carleson_stein_wainger hn hd hK hp hp'

end
