// RUN: not llvm-mc -triple=amdgcn -mcpu=gfx1200 -mattr=+wavefrontsize64 -show-encoding %s | FileCheck --check-prefix=W64 %s
// RUN: not llvm-mc -triple=amdgcn -mcpu=gfx1200 -mattr=+wavefrontsize32 -show-encoding %s | FileCheck --check-prefix=W32 %s
// RUN: not llvm-mc -triple=amdgcn -mcpu=gfx1200 -mattr=+wavefrontsize64 %s 2>&1 | FileCheck --check-prefix=W64-ERR --implicit-check-not=error: %s
// RUN: not llvm-mc -triple=amdgcn -mcpu=gfx1200 -mattr=+wavefrontsize32 %s 2>&1 | FileCheck --check-prefix=W32-ERR --implicit-check-not=error: %s

global_load_tr_b128 v[1:4], v0, s[0:1] offset:-64
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x00,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x00,0xc0,0xff,0xff]

global_load_tr_b128 v[1:4], v0, s[0:1] offset:64
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x00,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x00,0x40,0x00,0x00]

global_load_tr_b128 v[1:4], v5, s[2:3]
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x02,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x05,0x00,0x00,0x00]

global_load_tr_b128 v[1:4], v[0:1], off offset:-64
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x7c,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x00,0xc0,0xff,0xff]

global_load_tr_b128 v[1:4], v[0:1], off offset:64
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x7c,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x00,0x40,0x00,0x00]

global_load_tr_b128 v[1:4], v[5:6], off
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x7c,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x05,0x00,0x00,0x00]

global_load_tr_b64 v[1:2], v0, s[0:1] offset:-64
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x00,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x00,0xc0,0xff,0xff]

global_load_tr_b64 v[1:2], v0, s[0:1] offset:64
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x00,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x00,0x40,0x00,0x00]

global_load_tr_b64 v[1:2], v3, s[2:3]
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x02,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00]

global_load_tr_b64 v[1:2], v[0:1], off offset:-64
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x7c,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x00,0xc0,0xff,0xff]

global_load_tr_b64 v[1:2], v[0:1], off offset:64
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x7c,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x00,0x40,0x00,0x00]

global_load_tr_b64 v[1:2], v[3:4], off
// W64-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W32: encoding: [0x7c,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00]



global_load_tr_b128 v[1:2], v0, s[0:1] offset:-64
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x00,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x00,0xc0,0xff,0xff]

global_load_tr_b128 v[1:2], v0, s[0:1] offset:64
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x00,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x00,0x40,0x00,0x00]

global_load_tr_b128 v[1:2], v5, s[2:3]
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x02,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x05,0x00,0x00,0x00]

global_load_tr_b128 v[1:2], v[0:1], off offset:-64
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x7c,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x00,0xc0,0xff,0xff]

global_load_tr_b128 v[1:2], v[0:1], off offset:64
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x7c,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x00,0x40,0x00,0x00]

global_load_tr_b128 v[1:2], v[5:6], off
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x7c,0xc0,0x15,0xee,0x01,0x00,0x00,0x00,0x05,0x00,0x00,0x00]

global_load_tr_b64 v1, v0, s[0:1] offset:-64
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x00,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x00,0xc0,0xff,0xff]

global_load_tr_b64 v1, v0, s[0:1] offset:64
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x00,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x00,0x40,0x00,0x00]

global_load_tr_b64 v1, v3, s[2:3]
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x02,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00]

global_load_tr_b64 v1, v[0:1], off offset:-64
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x7c,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x00,0xc0,0xff,0xff]

global_load_tr_b64 v1, v[0:1], off offset:64
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x7c,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x00,0x40,0x00,0x00]

global_load_tr_b64 v1, v[3:4], off
// W32-ERR: :[[@LINE-1]]:{{[0-9]+}}: error: operands are not valid for this GPU or mode
// W64: encoding: [0x7c,0x00,0x16,0xee,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00]

