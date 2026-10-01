# Formalization of a discrete Carleson operator of Stein-Wainger type

This is a formalization in Lean 4 of the main result on $\ell^p$ bounds for 
a discrete maximal singular oscillatory operator (also called a discrete Carleson operator) of Stein-Wainger type, proved in the following two papers (the first paper concerns the $p = 2$ case):

- B. Krause, J. Roos, *Discrete analogues of maximally modulated singular integrals of Stein–Wainger type*,
  J. Eur. Math. Soc. (JEMS) **24** (2022), no. 9, 3183–3213.
  [doi:10.4171/JEMS/1160](https://doi.org/10.4171/JEMS/1160), [arXiv:1907.00405](https://arxiv.org/abs/1907.00405).
- B. Krause, J. Roos, *Discrete analogues of maximally modulated singular integrals of Stein–Wainger type:*
  $\ell^p$ *bounds for* $p > 1$, J. Funct. Anal. **285** (2023), no. 10, Paper No. 110123.
  [doi:10.1016/j.jfa.2023.110123](https://doi.org/10.1016/j.jfa.2023.110123), [arXiv:2107.14616](https://arxiv.org/abs/2107.14616).

### Palomar registration

The formalization is registered in the Palomar Registry as
[PALOMAR-2026-09-30-000034](https://palomar-registry.org/entry?id=PALOMAR-2026-09-30-000034).

[Palomar](https://palomar-registry.org/about) is a public registry of Lean formalizations, each verified at a pinned commit by Lean's kernel and independent kernels, screened by an automated review of its statements and disclosures, and recorded with a durable identifier.

### Autoformalization

First a blueprint was generated consolidating the arguments in both papers to prove
the main theorem and fill in dependencies down to approximate Mathlib equivalence.
This step was completed using `GPT 6 Astra Pro`.
In the next step, the machine-generated blueprint was used to autoformalize the
proof using `Claude Opus 5.5 Medium`.

Finally, human Lean statements for the main theorem and the required definitions were added in [`Defs.lean`](DiscreteSW/Defs.lean) and [`Theorems.lean`](DiscreteSW/Theorems.lean). All machine-generated code lives in the `Auto` folder, and the `Auto` namespace in Lean.
