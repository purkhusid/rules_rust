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


# Unsupported target "buffer" with type "test" omitted

rust_library(
    name = "tower_buffer",
    crate_type = "lib",
    deps = [
        "@raze__futures_core__0_3_5//:futures_core",
        "@raze__pin_project__0_4_23//:pin_project",
        "@raze__tokio__0_2_22//:tokio",
        "@raze__tower_layer__0_3_0//:tower_layer",
        "@raze__tower_service__0_3_0//:tower_service",
        "@raze__tracing__0_1_19//:tracing",
    ],
    srcs = glob(["**/*.rs"]),
    crate_root = "src/lib.rs",
    edition = "2018",
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.3.0",
    tags = ["cargo-raze"],
    crate_features = [
        "log",
    ],
)

