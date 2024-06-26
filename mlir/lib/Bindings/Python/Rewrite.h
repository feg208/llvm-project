//===- Rewrite.h - Rewrite Submodules of pybind module --------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_BINDINGS_PYTHON_REWRITE_H
#define MLIR_BINDINGS_PYTHON_REWRITE_H

#include "PybindUtils.h"

namespace mlir {
namespace python {

void populateRewriteSubmodule(pybind11::module &m);

} // namespace python
} // namespace mlir

#endif // MLIR_BINDINGS_PYTHON_REWRITE_H
