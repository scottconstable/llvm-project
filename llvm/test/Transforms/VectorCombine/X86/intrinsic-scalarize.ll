; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 5
; RUN: opt < %s -S -p vector-combine -mtriple=x86_64 -mattr=sse2 | FileCheck %s --check-prefixes=CHECK,SSE2
; RUN: opt < %s -S -p vector-combine -mtriple=x86_64 -mattr=avx2 | FileCheck %s --check-prefixes=CHECK,AVX2

define <2 x float> @maxnum(float %x, float %y) {
; SSE2-LABEL: define <2 x float> @maxnum(
; SSE2-SAME: float [[X:%.*]], float [[Y:%.*]]) #[[ATTR0:[0-9]+]] {
; SSE2-NEXT:    [[X_INSERT:%.*]] = insertelement <2 x float> poison, float [[X]], i32 0
; SSE2-NEXT:    [[Y_INSERT:%.*]] = insertelement <2 x float> poison, float [[Y]], i32 0
; SSE2-NEXT:    [[V:%.*]] = call <2 x float> @llvm.maxnum.v2f32(<2 x float> [[X_INSERT]], <2 x float> [[Y_INSERT]])
; SSE2-NEXT:    ret <2 x float> [[V]]
;
; AVX2-LABEL: define <2 x float> @maxnum(
; AVX2-SAME: float [[X:%.*]], float [[Y:%.*]]) #[[ATTR0:[0-9]+]] {
; AVX2-NEXT:    [[V_SCALAR:%.*]] = call float @llvm.maxnum.f32(float [[X]], float [[Y]])
; AVX2-NEXT:    [[TMP1:%.*]] = call <2 x float> @llvm.maxnum.v2f32(<2 x float> poison, <2 x float> poison)
; AVX2-NEXT:    [[V:%.*]] = insertelement <2 x float> [[TMP1]], float [[V_SCALAR]], i64 0
; AVX2-NEXT:    ret <2 x float> [[V]]
;
  %x.insert = insertelement <2 x float> poison, float %x, i32 0
  %y.insert = insertelement <2 x float> poison, float %y, i32 0
  %v = call <2 x float> @llvm.maxnum(<2 x float> %x.insert, <2 x float> %y.insert)
  ret <2 x float> %v
}
;; NOTE: These prefixes are unused and the list is autogenerated. Do not add tests below this line:
; CHECK: {{.*}}
