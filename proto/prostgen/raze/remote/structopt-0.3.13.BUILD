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
  "notice", # Apache-2.0 from expression "Apache-2.0 OR MIT"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)


# Unsupported target "after_help" with type "example" omitted
# Unsupported target "argument_naming" with type "test" omitted
# Unsupported target "arguments" with type "test" omitted
# Unsupported target "at_least_two" with type "example" omitted
# Unsupported target "author_version_about" with type "test" omitted
# Unsupported target "basic" with type "example" omitted
# Unsupported target "custom-string-parsers" with type "test" omitted
# Unsupported target "default_value" with type "test" omitted
# Unsupported target "deny-warnings" with type "test" omitted
# Unsupported target "deny_missing_docs" with type "example" omitted
# Unsupported target "doc-comments-help" with type "test" omitted
# Unsupported target "doc_comments" with type "example" omitted
# Unsupported target "enum_in_args" with type "example" omitted
# Unsupported target "enum_tuple" with type "example" omitted
# Unsupported target "env" with type "example" omitted
# Unsupported target "example" with type "example" omitted
# Unsupported target "explicit_name_no_renaming" with type "test" omitted
# Unsupported target "flags" with type "test" omitted
# Unsupported target "flatten" with type "example" omitted
# Unsupported target "flatten" with type "test" omitted
# Unsupported target "gen_completions" with type "example" omitted
# Unsupported target "git" with type "example" omitted
# Unsupported target "group" with type "example" omitted
# Unsupported target "issues" with type "test" omitted
# Unsupported target "keyvalue" with type "example" omitted
# Unsupported target "macro-errors" with type "test" omitted
# Unsupported target "negative_flag" with type "example" omitted
# Unsupported target "nested-subcommands" with type "test" omitted
# Unsupported target "no_version" with type "example" omitted
# Unsupported target "non_literal_attributes" with type "test" omitted
# Unsupported target "options" with type "test" omitted
# Unsupported target "privacy" with type "test" omitted
# Unsupported target "raw_bool_literal" with type "test" omitted
# Unsupported target "raw_idents" with type "test" omitted
# Unsupported target "rename_all" with type "example" omitted
# Unsupported target "rename_all_env" with type "test" omitted
# Unsupported target "skip" with type "example" omitted
# Unsupported target "skip" with type "test" omitted
# Unsupported target "special_types" with type "test" omitted

rust_library(
    name = "structopt",
    crate_type = "lib",
    deps = [
        "@raze__clap__2_33_3//:clap",
        "@raze__lazy_static__1_4_0//:lazy_static",
    ],
    srcs = glob(["**/*.rs"]),
    crate_root = "src/lib.rs",
    edition = "2018",
    proc_macro_deps = [
        "@raze__structopt_derive__0_4_6//:structopt_derive",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.3.13",
    tags = ["cargo-raze"],
    crate_features = [
    ],
)

# Unsupported target "subcommand_aliases" with type "example" omitted
# Unsupported target "subcommands" with type "test" omitted
# Unsupported target "true_or_false" with type "example" omitted
# Unsupported target "utils" with type "test" omitted
# Unsupported target "we_need_syn_full" with type "test" omitted
