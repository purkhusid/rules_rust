"""
@generated
cargo-raze crate build file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""
package(default_visibility = [
  # Public for visibility by "@raze__crate__version//" targets.
  #
  # Prefer access through "//proto/prostgen/raze", which limits external
  # visibility to explicit Cargo.toml dependencies.
  "//visibility:public",
])

licenses([
  "notice", # MIT from expression "MIT OR Apache-2.0"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)



rust_library(
    name = "wasm_bindgen_macro_support",
    crate_type = "lib",
    deps = [
        "@raze__proc_macro2__1_0_18//:proc_macro2",
        "@raze__quote__1_0_7//:quote",
        "@raze__syn__1_0_31//:syn",
        "@raze__wasm_bindgen_backend__0_2_68//:wasm_bindgen_backend",
        "@raze__wasm_bindgen_shared__0_2_68//:wasm_bindgen_shared",
    ],
    srcs = glob(["**/*.rs"]),
    crate_root = "src/lib.rs",
    edition = "2018",
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.2.68",
    tags = ["cargo-raze"],
    crate_features = [
        "spans",
    ],
)

