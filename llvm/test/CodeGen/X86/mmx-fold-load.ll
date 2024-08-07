; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -disable-peephole -mtriple=i686-unknown -mattr=+mmx,+sse2 | FileCheck %s --check-prefix=X86
; RUN: llc < %s -disable-peephole -mtriple=x86_64-unknown -mattr=+mmx,+sse2 | FileCheck %s --check-prefix=X64

define i64 @t0(ptr %a, ptr %b) nounwind {
; X86-LABEL: t0:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 12(%ebp), %eax
; X86-NEXT:    movl 8(%ebp), %ecx
; X86-NEXT:    movq (%ecx), %mm0
; X86-NEXT:    movd (%eax), %mm1
; X86-NEXT:    psllq %mm1, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: t0:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    movd (%rsi), %mm1
; X64-NEXT:    psllq %mm1, %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    retq
entry:
  %0 = load x86_mmx, ptr %a, align 8
  %1 = load i32, ptr %b, align 4
  %2 = tail call x86_mmx @llvm.x86.mmx.pslli.q(x86_mmx %0, i32 %1)
  %3 = bitcast x86_mmx %2 to i64
  ret i64 %3
}
declare x86_mmx @llvm.x86.mmx.pslli.q(x86_mmx, i32)

define i64 @t1(ptr %a, ptr %b) nounwind {
; X86-LABEL: t1:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 12(%ebp), %eax
; X86-NEXT:    movl 8(%ebp), %ecx
; X86-NEXT:    movq (%ecx), %mm0
; X86-NEXT:    movd (%eax), %mm1
; X86-NEXT:    psrlq %mm1, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: t1:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    movd (%rsi), %mm1
; X64-NEXT:    psrlq %mm1, %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    retq
entry:
  %0 = load x86_mmx, ptr %a, align 8
  %1 = load i32, ptr %b, align 4
  %2 = tail call x86_mmx @llvm.x86.mmx.psrli.q(x86_mmx %0, i32 %1)
  %3 = bitcast x86_mmx %2 to i64
  ret i64 %3
}
declare x86_mmx @llvm.x86.mmx.psrli.q(x86_mmx, i32)

define i64 @t2(ptr %a, ptr %b) nounwind {
; X86-LABEL: t2:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 12(%ebp), %eax
; X86-NEXT:    movl 8(%ebp), %ecx
; X86-NEXT:    movq (%ecx), %mm0
; X86-NEXT:    movd (%eax), %mm1
; X86-NEXT:    psllw %mm1, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: t2:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    movd (%rsi), %mm1
; X64-NEXT:    psllw %mm1, %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    retq
entry:
  %0 = load x86_mmx, ptr %a, align 8
  %1 = load i32, ptr %b, align 4
  %2 = tail call x86_mmx @llvm.x86.mmx.pslli.w(x86_mmx %0, i32 %1)
  %3 = bitcast x86_mmx %2 to i64
  ret i64 %3
}
declare x86_mmx @llvm.x86.mmx.pslli.w(x86_mmx, i32)

define i64 @t3(ptr %a, ptr %b) nounwind {
; X86-LABEL: t3:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 12(%ebp), %eax
; X86-NEXT:    movl 8(%ebp), %ecx
; X86-NEXT:    movq (%ecx), %mm0
; X86-NEXT:    movd (%eax), %mm1
; X86-NEXT:    psrlw %mm1, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: t3:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    movd (%rsi), %mm1
; X64-NEXT:    psrlw %mm1, %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    retq
entry:
  %0 = load x86_mmx, ptr %a, align 8
  %1 = load i32, ptr %b, align 4
  %2 = tail call x86_mmx @llvm.x86.mmx.psrli.w(x86_mmx %0, i32 %1)
  %3 = bitcast x86_mmx %2 to i64
  ret i64 %3
}
declare x86_mmx @llvm.x86.mmx.psrli.w(x86_mmx, i32)

define i64 @t4(ptr %a, ptr %b) nounwind {
; X86-LABEL: t4:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 12(%ebp), %eax
; X86-NEXT:    movl 8(%ebp), %ecx
; X86-NEXT:    movq (%ecx), %mm0
; X86-NEXT:    movd (%eax), %mm1
; X86-NEXT:    pslld %mm1, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: t4:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    movd (%rsi), %mm1
; X64-NEXT:    pslld %mm1, %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    retq
entry:
  %0 = load x86_mmx, ptr %a, align 8
  %1 = load i32, ptr %b, align 4
  %2 = tail call x86_mmx @llvm.x86.mmx.pslli.d(x86_mmx %0, i32 %1)
  %3 = bitcast x86_mmx %2 to i64
  ret i64 %3
}
declare x86_mmx @llvm.x86.mmx.pslli.d(x86_mmx, i32)

define i64 @t5(ptr %a, ptr %b) nounwind {
; X86-LABEL: t5:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 12(%ebp), %eax
; X86-NEXT:    movl 8(%ebp), %ecx
; X86-NEXT:    movq (%ecx), %mm0
; X86-NEXT:    movd (%eax), %mm1
; X86-NEXT:    psrld %mm1, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: t5:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    movd (%rsi), %mm1
; X64-NEXT:    psrld %mm1, %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    retq
entry:
  %0 = load x86_mmx, ptr %a, align 8
  %1 = load i32, ptr %b, align 4
  %2 = tail call x86_mmx @llvm.x86.mmx.psrli.d(x86_mmx %0, i32 %1)
  %3 = bitcast x86_mmx %2 to i64
  ret i64 %3
}
declare x86_mmx @llvm.x86.mmx.psrli.d(x86_mmx, i32)

define i64 @t6(ptr %a, ptr %b) nounwind {
; X86-LABEL: t6:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 12(%ebp), %eax
; X86-NEXT:    movl 8(%ebp), %ecx
; X86-NEXT:    movq (%ecx), %mm0
; X86-NEXT:    movd (%eax), %mm1
; X86-NEXT:    psraw %mm1, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: t6:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    movd (%rsi), %mm1
; X64-NEXT:    psraw %mm1, %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    retq
entry:
  %0 = load x86_mmx, ptr %a, align 8
  %1 = load i32, ptr %b, align 4
  %2 = tail call x86_mmx @llvm.x86.mmx.psrai.w(x86_mmx %0, i32 %1)
  %3 = bitcast x86_mmx %2 to i64
  ret i64 %3
}
declare x86_mmx @llvm.x86.mmx.psrai.w(x86_mmx, i32)

define i64 @t7(ptr %a, ptr %b) nounwind {
; X86-LABEL: t7:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 12(%ebp), %eax
; X86-NEXT:    movl 8(%ebp), %ecx
; X86-NEXT:    movq (%ecx), %mm0
; X86-NEXT:    movd (%eax), %mm1
; X86-NEXT:    psrad %mm1, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: t7:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    movd (%rsi), %mm1
; X64-NEXT:    psrad %mm1, %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    retq
entry:
  %0 = load x86_mmx, ptr %a, align 8
  %1 = load i32, ptr %b, align 4
  %2 = tail call x86_mmx @llvm.x86.mmx.psrai.d(x86_mmx %0, i32 %1)
  %3 = bitcast x86_mmx %2 to i64
  ret i64 %3
}
declare x86_mmx @llvm.x86.mmx.psrai.d(x86_mmx, i32)

define i64 @tt0(x86_mmx %t, ptr %q) nounwind {
; X86-LABEL: tt0:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movl 12(%ebp), %ecx
; X86-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; X86-NEXT:    movl %eax, {{[0-9]+}}(%esp)
; X86-NEXT:    movl 16(%ebp), %eax
; X86-NEXT:    movq {{[0-9]+}}(%esp), %mm0
; X86-NEXT:    paddb (%eax), %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    emms
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: tt0:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq %rdi, %mm0
; X64-NEXT:    paddb (%rsi), %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    emms
; X64-NEXT:    retq
entry:
  %v = load x86_mmx, ptr %q
  %u = tail call x86_mmx @llvm.x86.mmx.padd.b(x86_mmx %t, x86_mmx %v)
  %s = bitcast x86_mmx %u to i64
  call void @llvm.x86.mmx.emms()
  ret i64 %s
}
declare x86_mmx @llvm.x86.mmx.padd.b(x86_mmx, x86_mmx)
declare void @llvm.x86.mmx.emms()

define i64 @tt1(x86_mmx %t, ptr %q) nounwind {
; X86-LABEL: tt1:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movl 12(%ebp), %ecx
; X86-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; X86-NEXT:    movl %eax, {{[0-9]+}}(%esp)
; X86-NEXT:    movl 16(%ebp), %eax
; X86-NEXT:    movq {{[0-9]+}}(%esp), %mm0
; X86-NEXT:    paddw (%eax), %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    emms
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: tt1:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq %rdi, %mm0
; X64-NEXT:    paddw (%rsi), %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    emms
; X64-NEXT:    retq
entry:
  %v = load x86_mmx, ptr %q
  %u = tail call x86_mmx @llvm.x86.mmx.padd.w(x86_mmx %t, x86_mmx %v)
  %s = bitcast x86_mmx %u to i64
  call void @llvm.x86.mmx.emms()
  ret i64 %s
}
declare x86_mmx @llvm.x86.mmx.padd.w(x86_mmx, x86_mmx)

define i64 @tt2(x86_mmx %t, ptr %q) nounwind {
; X86-LABEL: tt2:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movl 12(%ebp), %ecx
; X86-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; X86-NEXT:    movl %eax, {{[0-9]+}}(%esp)
; X86-NEXT:    movl 16(%ebp), %eax
; X86-NEXT:    movq {{[0-9]+}}(%esp), %mm0
; X86-NEXT:    paddd (%eax), %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    emms
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: tt2:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq %rdi, %mm0
; X64-NEXT:    paddd (%rsi), %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    emms
; X64-NEXT:    retq
entry:
  %v = load x86_mmx, ptr %q
  %u = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %t, x86_mmx %v)
  %s = bitcast x86_mmx %u to i64
  call void @llvm.x86.mmx.emms()
  ret i64 %s
}
declare x86_mmx @llvm.x86.mmx.padd.d(x86_mmx, x86_mmx)

define i64 @tt3(x86_mmx %t, ptr %q) nounwind {
; X86-LABEL: tt3:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movl 12(%ebp), %ecx
; X86-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; X86-NEXT:    movl %eax, {{[0-9]+}}(%esp)
; X86-NEXT:    movl 16(%ebp), %eax
; X86-NEXT:    movq {{[0-9]+}}(%esp), %mm0
; X86-NEXT:    paddq (%eax), %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    emms
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: tt3:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq %rdi, %mm0
; X64-NEXT:    paddq (%rsi), %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    emms
; X64-NEXT:    retq
entry:
  %v = load x86_mmx, ptr %q
  %u = tail call x86_mmx @llvm.x86.mmx.padd.q(x86_mmx %t, x86_mmx %v)
  %s = bitcast x86_mmx %u to i64
  call void @llvm.x86.mmx.emms()
  ret i64 %s
}
declare x86_mmx @llvm.x86.mmx.padd.q(x86_mmx, x86_mmx)

define i64 @tt4(x86_mmx %t, ptr %q) nounwind {
; X86-LABEL: tt4:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movl 12(%ebp), %ecx
; X86-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; X86-NEXT:    movl %eax, {{[0-9]+}}(%esp)
; X86-NEXT:    movl 16(%ebp), %eax
; X86-NEXT:    movq {{[0-9]+}}(%esp), %mm0
; X86-NEXT:    paddusb (%eax), %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    emms
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: tt4:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq %rdi, %mm0
; X64-NEXT:    paddusb (%rsi), %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    emms
; X64-NEXT:    retq
entry:
  %v = load x86_mmx, ptr %q
  %u = tail call x86_mmx @llvm.x86.mmx.paddus.b(x86_mmx %t, x86_mmx %v)
  %s = bitcast x86_mmx %u to i64
  call void @llvm.x86.mmx.emms()
  ret i64 %s
}
declare x86_mmx @llvm.x86.mmx.paddus.b(x86_mmx, x86_mmx)

define i64 @tt5(x86_mmx %t, ptr %q) nounwind {
; X86-LABEL: tt5:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movl 12(%ebp), %ecx
; X86-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; X86-NEXT:    movl %eax, {{[0-9]+}}(%esp)
; X86-NEXT:    movl 16(%ebp), %eax
; X86-NEXT:    movq {{[0-9]+}}(%esp), %mm0
; X86-NEXT:    paddusw (%eax), %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    emms
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: tt5:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq %rdi, %mm0
; X64-NEXT:    paddusw (%rsi), %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    emms
; X64-NEXT:    retq
entry:
  %v = load x86_mmx, ptr %q
  %u = tail call x86_mmx @llvm.x86.mmx.paddus.w(x86_mmx %t, x86_mmx %v)
  %s = bitcast x86_mmx %u to i64
  call void @llvm.x86.mmx.emms()
  ret i64 %s
}
declare x86_mmx @llvm.x86.mmx.paddus.w(x86_mmx, x86_mmx)

define i64 @tt6(x86_mmx %t, ptr %q) nounwind {
; X86-LABEL: tt6:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movl 12(%ebp), %ecx
; X86-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; X86-NEXT:    movl %eax, {{[0-9]+}}(%esp)
; X86-NEXT:    movl 16(%ebp), %eax
; X86-NEXT:    movq {{[0-9]+}}(%esp), %mm0
; X86-NEXT:    psrlw (%eax), %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    emms
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: tt6:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq %rdi, %mm0
; X64-NEXT:    psrlw (%rsi), %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    emms
; X64-NEXT:    retq
entry:
  %v = load x86_mmx, ptr %q
  %u = tail call x86_mmx @llvm.x86.mmx.psrl.w(x86_mmx %t, x86_mmx %v)
  %s = bitcast x86_mmx %u to i64
  call void @llvm.x86.mmx.emms()
  ret i64 %s
}
declare x86_mmx @llvm.x86.mmx.psrl.w(x86_mmx, x86_mmx)

define i64 @tt7(x86_mmx %t, ptr %q) nounwind {
; X86-LABEL: tt7:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movl 12(%ebp), %ecx
; X86-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; X86-NEXT:    movl %eax, {{[0-9]+}}(%esp)
; X86-NEXT:    movl 16(%ebp), %eax
; X86-NEXT:    movq {{[0-9]+}}(%esp), %mm0
; X86-NEXT:    psrld (%eax), %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    emms
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: tt7:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq %rdi, %mm0
; X64-NEXT:    psrld (%rsi), %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    emms
; X64-NEXT:    retq
entry:
  %v = load x86_mmx, ptr %q
  %u = tail call x86_mmx @llvm.x86.mmx.psrl.d(x86_mmx %t, x86_mmx %v)
  %s = bitcast x86_mmx %u to i64
  call void @llvm.x86.mmx.emms()
  ret i64 %s
}
declare x86_mmx @llvm.x86.mmx.psrl.d(x86_mmx, x86_mmx)

define i64 @tt8(x86_mmx %t, ptr %q) nounwind {
; X86-LABEL: tt8:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movl 12(%ebp), %ecx
; X86-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; X86-NEXT:    movl %eax, {{[0-9]+}}(%esp)
; X86-NEXT:    movl 16(%ebp), %eax
; X86-NEXT:    movq {{[0-9]+}}(%esp), %mm0
; X86-NEXT:    psrlq (%eax), %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    emms
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: tt8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movq %rdi, %mm0
; X64-NEXT:    psrlq (%rsi), %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    emms
; X64-NEXT:    retq
entry:
  %v = load x86_mmx, ptr %q
  %u = tail call x86_mmx @llvm.x86.mmx.psrl.q(x86_mmx %t, x86_mmx %v)
  %s = bitcast x86_mmx %u to i64
  call void @llvm.x86.mmx.emms()
  ret i64 %s
}
declare x86_mmx @llvm.x86.mmx.psrl.q(x86_mmx, x86_mmx)

define void @test_psrlq_by_volatile_shift_amount(ptr %t) nounwind {
; X86-LABEL: test_psrlq_by_volatile_shift_amount:
; X86:       # %bb.0: # %entry
; X86-NEXT:    pushl %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl $1, (%esp)
; X86-NEXT:    movl $255, %ecx
; X86-NEXT:    movd %ecx, %mm0
; X86-NEXT:    movd (%esp), %mm1
; X86-NEXT:    psrlq %mm1, %mm0
; X86-NEXT:    movq %mm0, (%eax)
; X86-NEXT:    popl %eax
; X86-NEXT:    retl
;
; X64-LABEL: test_psrlq_by_volatile_shift_amount:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movl $1, -{{[0-9]+}}(%rsp)
; X64-NEXT:    movl $255, %eax
; X64-NEXT:    movd %eax, %mm0
; X64-NEXT:    movd -{{[0-9]+}}(%rsp), %mm1
; X64-NEXT:    psrlq %mm1, %mm0
; X64-NEXT:    movq %mm0, (%rdi)
; X64-NEXT:    retq
entry:
  %0 = alloca i32, align 4
  call void @llvm.lifetime.start(i64 4, ptr nonnull %0)
  store volatile i32 1, ptr %0, align 4
  %1 = load volatile i32, ptr %0, align 4
  %2 = tail call x86_mmx @llvm.x86.mmx.psrli.q(x86_mmx bitcast (<1 x i64> <i64 255> to x86_mmx), i32 %1)
  store x86_mmx %2, ptr %t, align 8
  call void @llvm.lifetime.end(i64 4, ptr nonnull %0)
  ret void
}

declare void @llvm.lifetime.start(i64, ptr nocapture)
declare void @llvm.lifetime.end(i64, ptr nocapture)

; Make sure we shrink this vector load and fold it.
define x86_mmx @vec_load(ptr %x) {
; X86-LABEL: vec_load:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    .cfi_def_cfa_offset 8
; X86-NEXT:    .cfi_offset %ebp, -8
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    .cfi_def_cfa_register %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    pshufw $68, (%eax), %mm0 # mm0 = mem[0,1,0,1]
; X86-NEXT:    paddsb %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    .cfi_def_cfa %esp, 4
; X86-NEXT:    retl
;
; X64-LABEL: vec_load:
; X64:       # %bb.0:
; X64-NEXT:    pshufw $68, (%rdi), %mm0 # mm0 = mem[0,1,0,1]
; X64-NEXT:    paddsb %mm0, %mm0
; X64-NEXT:    movq %mm0, %rax
; X64-NEXT:    retq
  %z = load <4 x float>, ptr %x
  %y = extractelement <4 x float> %z, i32 0
  %a = insertelement <2 x float> undef, float %y, i32 0
  %b = insertelement <2 x float> %a, float %y, i32 1
  %c = bitcast <2 x float> %b to x86_mmx
  %d = tail call x86_mmx @llvm.x86.mmx.padds.b(x86_mmx %c, x86_mmx %c)
  ret x86_mmx %d
}

declare x86_mmx @llvm.x86.mmx.padds.b(x86_mmx, x86_mmx)

