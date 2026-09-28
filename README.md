# Formalization of the discrete Stein-Wainger theorem

This is a formalization in Lean 4 of the main results from 
[https://arxiv.org/abs/1907.00405](arXiv:1907.00405) and 
[https://arxiv.org/abs/2107.14616](arXiv:2107.14616) on $\ell^p$ bounds for 
a discrete maximally modulated singular oscillatory operator of Stein-Wainger type.

### Autoformalization

First a blueprint was generated consolidating the arguments in both papers to prove
the main theorem and fill in dependencies down to approximate Mathlib equivalence.
This step was completed using `GPT 6 Astra Pro`.
In the next step, the machine-generated blueprint was used to autoformalize the
proof using `Claude Opus 5.5 Medium`.

