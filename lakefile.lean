import Lake
open Lake DSL

package «verification» {
  description := "Lean 4 formalization of Cairo VM semantics and selected libfunc verification proofs."
  homepage := "https://github.com/fraware/formal-proofs"
  keywords := #["lean4", "formal-verification", "cairo", "stark"]
  license := "Apache-2.0"
  readmeFile := "README.md"
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «Verification» {
  -- add any library configuration options here
}
