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
  "notice", # MIT from expression "MIT"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)


# Unsupported target "async_fn" with type "test" omitted
# Unsupported target "destructuring" with type "test" omitted
# Unsupported target "err" with type "test" omitted
# Unsupported target "fields" with type "test" omitted
# Unsupported target "instrument" with type "test" omitted
# Unsupported target "levels" with type "test" omitted
# Unsupported target "names" with type "test" omitted
# Unsupported target "support" with type "test" omitted
# Unsupported target "targets" with type "test" omitted

rust_library(
    name = "tracing_attributes",
    crate_type = "proc-macro",
    deps = [
        "@raze__proc_macro2__1_0_18//:proc_macro2",
        "@raze__quote__1_0_7//:quote",
        "@raze__syn__1_0_31//:syn",
    ],
    srcs = glob(["**/*.rs"]),
    crate_root = "src/lib.rs",
    edition = "2018",
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.1.11",
    tags = ["cargo-raze"],
    crate_features = [
    ],
)

