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


# Unsupported target "akamai" with type "example" omitted
# Unsupported target "client" with type "example" omitted

rust_library(
    name = "h2",
    crate_type = "lib",
    deps = [
        "@raze__bytes__0_5_6//:bytes",
        "@raze__fnv__1_0_7//:fnv",
        "@raze__futures_core__0_3_5//:futures_core",
        "@raze__futures_sink__0_3_5//:futures_sink",
        "@raze__futures_util__0_3_5//:futures_util",
        "@raze__http__0_2_1//:http",
        "@raze__indexmap__1_6_0//:indexmap",
        "@raze__slab__0_4_2//:slab",
        "@raze__tokio__0_2_22//:tokio",
        "@raze__tokio_util__0_3_1//:tokio_util",
        "@raze__tracing__0_1_19//:tracing",
    ],
    srcs = glob(["**/*.rs"]),
    crate_root = "src/lib.rs",
    edition = "2018",
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.2.6",
    tags = ["cargo-raze"],
    crate_features = [
    ],
)

# Unsupported target "server" with type "example" omitted
