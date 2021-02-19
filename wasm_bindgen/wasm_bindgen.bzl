# Copyright 2019 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# buildifier: disable=module-docstring
load("@build_bazel_rules_nodejs//internal/providers:declaration_info.bzl", "DeclarationInfo")
load(
    "@build_bazel_rules_nodejs//internal/providers:js_providers.bzl",
    "JSEcmaScriptModuleInfo",
    "JSModuleInfo",
    "JSNamedModuleInfo",
)

# buildifier: disable=bzl-visibility
load("//rust/private:transitions.bzl", "wasm_bindgen_transition")

_WASM_BINDGEN_DOC = """\
Generates javascript and typescript bindings for a webassembly module.

To use the Rust WebAssembly bindgen rules, add the following to your `WORKSPACE` file to add the
external repositories for the Rust bindgen toolchain (in addition to the Rust rules setup):

```python
load("@rules_rust//wasm_bindgen:repositories.bzl", "rust_wasm_bindgen_repositories")

rust_wasm_bindgen_repositories()
```

An example of this rule in use can be seen at [@rules_rust//examples/wasm/...](../examples/wasm)
"""

_WASM_BINDGEN_TOOLCHAIN_DOC = """\
The tools required for the `rust_wasm_bindgen` rule.

You can also use your own version of wasm-bindgen using the toolchain rules below:

```python
load("@rules_rust//bindgen:bindgen.bzl", "rust_bindgen_toolchain")

rust_bindgen_toolchain(
    bindgen = "//my/raze:cargo_bin_wasm_bindgen",
)

toolchain(
    name = "wasm-bindgen-toolchain",
    toolchain = "wasm-bindgen-toolchain-impl",
    toolchain_type = "@rules_rust//wasm_bindgen:wasm_bindgen_toolchain",
)
```

Now that you have your own toolchain, you need to register it by
inserting the following statement in your `WORKSPACE` file:

```python
register_toolchains("//my/toolchains:wasm-bindgen-toolchain")
```

For additional information, see the [Bazel toolchains documentation](https://docs.bazel.build/versions/master/toolchains.html).
"""

def _rust_wasm_bindgen_impl(ctx):
    toolchain = ctx.toolchains[Label("//wasm_bindgen:wasm_bindgen_toolchain")]
    bindgen_bin = toolchain.bindgen

    args = ctx.actions.args()
    args.add("--out-dir", ctx.outputs.bindgen_wasm_module.dirname)
    args.add("--out-name", ctx.attr.name)
    args.add_all(ctx.attr.bindgen_flags)
    args.add(ctx.file.wasm_file)

    ctx.actions.run(
        executable = bindgen_bin,
        inputs = [ctx.file.wasm_file],
        outputs = [
            ctx.outputs.bindgen_javascript_bindings,
            ctx.outputs.bindgen_typescript_bindings,
            ctx.outputs.bindgen_wasm_module,
            ctx.outputs.javascript_bindings,
            ctx.outputs.typescript_bindings,
        ],
        mnemonic = "RustWasmBindgen",
        progress_message = "Generating WebAssembly bindings for {}..".format(ctx.file.wasm_file.path),
        arguments = [args],
    )

    # Return a structure that is compatible with the deps[] of a ts_library.
    declarations = depset([
        ctx.outputs.typescript_bindings,
        ctx.outputs.bindgen_typescript_bindings,
    ])
    es5_sources = depset([
        ctx.outputs.bindgen_javascript_bindings,
        ctx.outputs.javascript_bindings,
    ])
    es6_sources = depset([
        ctx.outputs.bindgen_javascript_bindings,
        ctx.outputs.javascript_bindings,
    ])

    return [
        DefaultInfo(
            files = depset([
                ctx.outputs.bindgen_javascript_bindings,
                ctx.outputs.bindgen_typescript_bindings,
                ctx.outputs.bindgen_wasm_module,
                ctx.outputs.javascript_bindings,
                ctx.outputs.typescript_bindings,
            ]),
        ),
        DeclarationInfo(
            declarations = declarations,
            transitive_declarations = declarations,
            type_blacklisted_declarations = depset([]),
        ),
        JSModuleInfo(
            direct_sources = es5_sources,
            sources = es5_sources,
        ),
        JSNamedModuleInfo(
            direct_sources = es5_sources,
            sources = es5_sources,
        ),
        JSEcmaScriptModuleInfo(
            direct_sources = es6_sources,
            sources = es6_sources,
        ),
    ]

rust_wasm_bindgen = rule(
    implementation = _rust_wasm_bindgen_impl,
    doc = _WASM_BINDGEN_DOC,
    attrs = {
        "bindgen_flags": attr.string_list(
            doc = "Flags to pass directly to the bindgen executable. See https://github.com/rustwasm/wasm-bindgen/ for details.",
        ),
        "wasm_file": attr.label(
            doc = "The .wasm file to generate bindings for.",
            allow_single_file = True,
            cfg = wasm_bindgen_transition,
        ),
        "_allowlist_function_transition": attr.label(
            default = Label("//tools/allowlists/function_transition_allowlist"),
        ),
    },
    outputs = {
        "bindgen_javascript_bindings": "%{name}_bg.js",
        "bindgen_typescript_bindings": "%{name}_bg.wasm.d.ts",
        "bindgen_wasm_module": "%{name}_bg.wasm",
        "javascript_bindings": "%{name}.js",
        "typescript_bindings": "%{name}.d.ts",
    },
    toolchains = [
        str(Label("//wasm_bindgen:wasm_bindgen_toolchain")),
    ],
)

def _rust_wasm_bindgen_toolchain_impl(ctx):
    return platform_common.ToolchainInfo(
        bindgen = ctx.executable.bindgen,
    )

rust_wasm_bindgen_toolchain = rule(
    implementation = _rust_wasm_bindgen_toolchain_impl,
    doc = _WASM_BINDGEN_TOOLCHAIN_DOC,
    attrs = {
        "bindgen": attr.label(
            doc = "The label of a `wasm-bindgen` executable.",
            executable = True,
            cfg = "exec",
        ),
    },
)
