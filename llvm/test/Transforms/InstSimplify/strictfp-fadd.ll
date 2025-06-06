; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instsimplify -S | FileCheck %s

;
; constrained fadd
;

;
; fadd X, -0 ==> X
;

define float @fadd_x_n0_defaultenv(float %a) #0 {
; CHECK-LABEL: @fadd_x_n0_defaultenv(
; CHECK-NEXT:    ret float [[A:%.*]]
;
  %ret = call float @llvm.experimental.constrained.fadd.f32(float %a, float -0.0, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret float %ret
}

define <2 x float> @fadd_vec_x_n0_defaultenv(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_x_n0_defaultenv(
; CHECK-NEXT:    ret <2 x float> [[A:%.*]]
;
  %ret = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float><float -0.0, float -0.0>, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret <2 x float> %ret
}

define float @fadd_x_n0_ebmaytrap(float %a) #0 {
; CHECK-LABEL: @fadd_x_n0_ebmaytrap(
; CHECK-NEXT:    [[RET:%.*]] = call float @llvm.experimental.constrained.fadd.f32(float [[A:%.*]], float -0.000000e+00, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #[[ATTR0:[0-9]+]]
; CHECK-NEXT:    ret float [[RET]]
;
  %ret = call float @llvm.experimental.constrained.fadd.f32(float %a, float -0.0, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret float %ret
}

define <2 x float> @fadd_vec_x_n0_ebmaytrap(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_x_n0_ebmaytrap(
; CHECK-NEXT:    [[RET:%.*]] = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> [[A:%.*]], <2 x float> splat (float -0.000000e+00), metadata !"round.tonearest", metadata !"fpexcept.maytrap") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[RET]]
;
  %ret = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float><float -0.0, float -0.0>, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret <2 x float> %ret
}

define float @fadd_x_n0_ebstrict(float %a) #0 {
; CHECK-LABEL: @fadd_x_n0_ebstrict(
; CHECK-NEXT:    [[RET:%.*]] = call float @llvm.experimental.constrained.fadd.f32(float [[A:%.*]], float -0.000000e+00, metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret float [[RET]]
;
  %ret = call float @llvm.experimental.constrained.fadd.f32(float %a, float -0.0, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret float %ret
}

define <2 x float> @fadd_vec_x_n0_ebstrict(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_x_n0_ebstrict(
; CHECK-NEXT:    [[RET:%.*]] = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> [[A:%.*]], <2 x float> splat (float -0.000000e+00), metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[RET]]
;
  %ret = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float><float -0.0, float -0.0>, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret <2 x float> %ret
}

define float @fadd_x_n0_neginf(float %a) #0 {
; CHECK-LABEL: @fadd_x_n0_neginf(
; CHECK-NEXT:    [[RET:%.*]] = call float @llvm.experimental.constrained.fadd.f32(float [[A:%.*]], float -0.000000e+00, metadata !"round.downward", metadata !"fpexcept.ignore") #[[ATTR0]]
; CHECK-NEXT:    ret float [[RET]]
;
  %ret = call float @llvm.experimental.constrained.fadd.f32(float %a, float -0.0, metadata !"round.downward", metadata !"fpexcept.ignore") #0
  ret float %ret
}

define <2 x float> @fadd_vec_x_n0_neginf(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_x_n0_neginf(
; CHECK-NEXT:    [[RET:%.*]] = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> [[A:%.*]], <2 x float> splat (float -0.000000e+00), metadata !"round.downward", metadata !"fpexcept.ignore") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[RET]]
;
  %ret = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float><float -0.0, float -0.0>, metadata !"round.downward", metadata !"fpexcept.ignore") #0
  ret <2 x float> %ret
}

define float @fadd_x_n0_dynamic(float %a) #0 {
; CHECK-LABEL: @fadd_x_n0_dynamic(
; CHECK-NEXT:    [[RET:%.*]] = call float @llvm.experimental.constrained.fadd.f32(float [[A:%.*]], float -0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #[[ATTR0]]
; CHECK-NEXT:    ret float [[RET]]
;
  %ret = call float @llvm.experimental.constrained.fadd.f32(float %a, float -0.0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #0
  ret float %ret
}

define <2 x float> @fadd_vec_x_n0_dynamic(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_x_n0_dynamic(
; CHECK-NEXT:    [[RET:%.*]] = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> [[A:%.*]], <2 x float> splat (float -0.000000e+00), metadata !"round.dynamic", metadata !"fpexcept.ignore") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[RET]]
;
  %ret = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float><float -0.0, float -0.0>, metadata !"round.dynamic", metadata !"fpexcept.ignore") #0
  ret <2 x float> %ret
}

; The rounding mode here needs to not be { tonearest, downward, dynamic }.
; Test one of the remaining rounding modes and the rest will be fine.
define float @fadd_x_n0_towardzero(float %a) #0 {
; CHECK-LABEL: @fadd_x_n0_towardzero(
; CHECK-NEXT:    ret float [[A:%.*]]
;
  %ret = call float @llvm.experimental.constrained.fadd.f32(float %a, float -0.0, metadata !"round.towardzero", metadata !"fpexcept.ignore") #0
  ret float %ret
}

; The rounding mode here needs to not be { tonearest, downward, dynamic }.
; Test one of the remaining rounding modes and the rest will be fine.
define <2 x float> @fadd_vec_x_n0_towardzero(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_x_n0_towardzero(
; CHECK-NEXT:    ret <2 x float> [[A:%.*]]
;
  %ret = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float><float -0.0, float -0.0>, metadata !"round.towardzero", metadata !"fpexcept.ignore") #0
  ret <2 x float> %ret
}

define float @fadd_nnan_x_n0_ebmaytrap(float %a) #0 {
; CHECK-LABEL: @fadd_nnan_x_n0_ebmaytrap(
; CHECK-NEXT:    ret float [[A:%.*]]
;
  %ret = call nnan float @llvm.experimental.constrained.fadd.f32(float %a, float -0.0, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret float %ret
}

define <2 x float> @fadd_vec_nnan_x_n0_ebmaytrap(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_nnan_x_n0_ebmaytrap(
; CHECK-NEXT:    ret <2 x float> [[A:%.*]]
;
  %ret = call nnan <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float><float -0.0, float -0.0>, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret <2 x float> %ret
}

define float @fadd_nnan_x_n0_ebstrict(float %a) #0 {
; CHECK-LABEL: @fadd_nnan_x_n0_ebstrict(
; CHECK-NEXT:    [[RET:%.*]] = call nnan float @llvm.experimental.constrained.fadd.f32(float [[A:%.*]], float -0.000000e+00, metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret float [[A]]
;
  %ret = call nnan float @llvm.experimental.constrained.fadd.f32(float %a, float -0.0, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret float %ret
}

define <2 x float> @fadd_vec_nnan_x_n0_ebstrict(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_nnan_x_n0_ebstrict(
; CHECK-NEXT:    [[RET:%.*]] = call nnan <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> [[A:%.*]], <2 x float> splat (float -0.000000e+00), metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[A]]
;
  %ret = call nnan <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float><float -0.0, float -0.0>, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret <2 x float> %ret
}

; Test with a fast math flag set but that flag is not "nnan".
define float @fadd_ninf_x_n0_ebstrict(float %a) #0 {
; CHECK-LABEL: @fadd_ninf_x_n0_ebstrict(
; CHECK-NEXT:    [[RET:%.*]] = call ninf float @llvm.experimental.constrained.fadd.f32(float [[A:%.*]], float -0.000000e+00, metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret float [[RET]]
;
  %ret = call ninf float @llvm.experimental.constrained.fadd.f32(float %a, float -0.0, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret float %ret
}

; Test with a fast math flag set but that flag is not "nnan".
define <2 x float> @fadd_vec_ninf_x_n0_ebstrict(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_ninf_x_n0_ebstrict(
; CHECK-NEXT:    [[RET:%.*]] = call ninf <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> [[A:%.*]], <2 x float> splat (float -0.000000e+00), metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[RET]]
;
  %ret = call ninf <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float><float -0.0, float -0.0>, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret <2 x float> %ret
}

define float @fadd_n0_x_defaultenv(float %a) #0 {
; CHECK-LABEL: @fadd_n0_x_defaultenv(
; CHECK-NEXT:    ret float [[A:%.*]]
;
  %ret = call float @llvm.experimental.constrained.fadd.f32(float -0.0, float %a, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret float %ret
}

define <2 x float> @fadd_vec_n0_x_defaultenv(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_n0_x_defaultenv(
; CHECK-NEXT:    ret <2 x float> [[A:%.*]]
;
  %ret = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float><float -0.0, float -0.0>, <2 x float> %a, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret <2 x float> %ret
}

; TODO: Canonicalize the order of the arguments. Then this will fire.
define float @fadd_n0_x_ebmaytrap(float %a) #0 {
; CHECK-LABEL: @fadd_n0_x_ebmaytrap(
; CHECK-NEXT:    [[RET:%.*]] = call float @llvm.experimental.constrained.fadd.f32(float -0.000000e+00, float [[A:%.*]], metadata !"round.tonearest", metadata !"fpexcept.maytrap") #[[ATTR0]]
; CHECK-NEXT:    ret float [[RET]]
;
  %ret = call float @llvm.experimental.constrained.fadd.f32(float -0.0, float %a, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret float %ret
}

; TODO: Canonicalize the order of the arguments. Then this will fire.
define <2 x float> @fadd_vec_n0_x_ebmaytrap(<2 x float> %a) #0 {
; CHECK-LABEL: @fadd_vec_n0_x_ebmaytrap(
; CHECK-NEXT:    [[RET:%.*]] = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> splat (float -0.000000e+00), <2 x float> [[A:%.*]], metadata !"round.tonearest", metadata !"fpexcept.maytrap") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[RET]]
;
  %ret = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float><float -0.0, float -0.0>, <2 x float> %a, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret <2 x float> %ret
}

;
; fadd X, 0 ==> X, when we know X is not -0
;

define float @fold_fadd_nsz_x_0_defaultenv(float %a) #0 {
; CHECK-LABEL: @fold_fadd_nsz_x_0_defaultenv(
; CHECK-NEXT:    ret float [[A:%.*]]
;
  %add = call nsz float @llvm.experimental.constrained.fadd.f32(float %a, float 0.0, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret float %add
}

define <2 x float> @fold_fadd_vec_nsz_x_0_defaultenv(<2 x float> %a) #0 {
; CHECK-LABEL: @fold_fadd_vec_nsz_x_0_defaultenv(
; CHECK-NEXT:    ret <2 x float> [[A:%.*]]
;
  %add = call nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float> zeroinitializer, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret <2 x float> %add
}

define float @fold_fadd_nsz_x_0_neginf(float %a) #0 {
; CHECK-LABEL: @fold_fadd_nsz_x_0_neginf(
; CHECK-NEXT:    ret float [[A:%.*]]
;
  %add = call nsz float @llvm.experimental.constrained.fadd.f32(float %a, float 0.0, metadata !"round.downward", metadata !"fpexcept.ignore") #0
  ret float %add
}

define <2 x float> @fold_fadd_vec_nsz_x_0_neginf(<2 x float> %a) #0 {
; CHECK-LABEL: @fold_fadd_vec_nsz_x_0_neginf(
; CHECK-NEXT:    ret <2 x float> [[A:%.*]]
;
  %add = call nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float> zeroinitializer, metadata !"round.downward", metadata !"fpexcept.ignore") #0
  ret <2 x float> %add
}

define float @fold_fadd_nsz_x_0_ebmaytrap(float %a) #0 {
; CHECK-LABEL: @fold_fadd_nsz_x_0_ebmaytrap(
; CHECK-NEXT:    [[ADD:%.*]] = call nsz float @llvm.experimental.constrained.fadd.f32(float [[A:%.*]], float 0.000000e+00, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #[[ATTR0]]
; CHECK-NEXT:    ret float [[ADD]]
;
  %add = call nsz float @llvm.experimental.constrained.fadd.f32(float %a, float 0.0, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret float %add
}

define <2 x float> @fold_fadd_vec_nsz_x_0_ebmaytrap(<2 x float> %a) #0 {
; CHECK-LABEL: @fold_fadd_vec_nsz_x_0_ebmaytrap(
; CHECK-NEXT:    [[ADD:%.*]] = call nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> [[A:%.*]], <2 x float> zeroinitializer, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[ADD]]
;
  %add = call nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float> zeroinitializer, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret <2 x float> %add
}

define float @fold_fadd_nnan_nsz_x_0_ebmaytrap(float %a) #0 {
; CHECK-LABEL: @fold_fadd_nnan_nsz_x_0_ebmaytrap(
; CHECK-NEXT:    ret float [[A:%.*]]
;
  %add = call nnan nsz float @llvm.experimental.constrained.fadd.f32(float %a, float 0.0, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret float %add
}

define <2 x float> @fold_fadd_vec_nnan_nsz_x_0_ebmaytrap(<2 x float> %a) #0 {
; CHECK-LABEL: @fold_fadd_vec_nnan_nsz_x_0_ebmaytrap(
; CHECK-NEXT:    ret <2 x float> [[A:%.*]]
;
  %add = call nnan nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float> zeroinitializer, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret <2 x float> %add
}

define float @fold_fadd_nsz_x_0_ebstrict(float %a) #0 {
; CHECK-LABEL: @fold_fadd_nsz_x_0_ebstrict(
; CHECK-NEXT:    [[ADD:%.*]] = call nsz float @llvm.experimental.constrained.fadd.f32(float [[A:%.*]], float 0.000000e+00, metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret float [[ADD]]
;
  %add = call nsz float @llvm.experimental.constrained.fadd.f32(float %a, float 0.0, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret float %add
}

define <2 x float> @fold_fadd_vec_nsz_x_0_ebstrict(<2 x float> %a) #0 {
; CHECK-LABEL: @fold_fadd_vec_nsz_x_0_ebstrict(
; CHECK-NEXT:    [[ADD:%.*]] = call nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> [[A:%.*]], <2 x float> zeroinitializer, metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[ADD]]
;
  %add = call nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float> zeroinitializer, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret <2 x float> %add
}

define float @fold_fadd_nsz_nnan_x_0_ebstrict(float %a) #0 {
; CHECK-LABEL: @fold_fadd_nsz_nnan_x_0_ebstrict(
; CHECK-NEXT:    [[ADD:%.*]] = call nnan nsz float @llvm.experimental.constrained.fadd.f32(float [[A:%.*]], float 0.000000e+00, metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret float [[A]]
;
  %add = call nsz nnan float @llvm.experimental.constrained.fadd.f32(float %a, float 0.0, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret float %add
}

define <2 x float> @fold_fadd_vec_nsz_nnan_x_0_ebstrict(<2 x float> %a) #0 {
; CHECK-LABEL: @fold_fadd_vec_nsz_nnan_x_0_ebstrict(
; CHECK-NEXT:    [[ADD:%.*]] = call nnan nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> [[A:%.*]], <2 x float> zeroinitializer, metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[A]]
;
  %add = call nsz nnan <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> %a, <2 x float> zeroinitializer, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret <2 x float> %add
}

define float @fold_fadd_nsz_0_x_defaultenv(float %a) #0 {
; CHECK-LABEL: @fold_fadd_nsz_0_x_defaultenv(
; CHECK-NEXT:    ret float [[A:%.*]]
;
  %add = call nsz float @llvm.experimental.constrained.fadd.f32(float 0.0, float %a, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret float %add
}

define <2 x float> @fold_fadd_vec_nsz_0_x_defaultenv(<2 x float> %a) #0 {
; CHECK-LABEL: @fold_fadd_vec_nsz_0_x_defaultenv(
; CHECK-NEXT:    ret <2 x float> [[A:%.*]]
;
  %add = call nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> zeroinitializer, <2 x float> %a, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret <2 x float> %add
}

; TODO: Canonicalize the order of the arguments. Then this will fire.
define float @fold_fadd_nsz_0_x_ebmaytrap(float %a) #0 {
; CHECK-LABEL: @fold_fadd_nsz_0_x_ebmaytrap(
; CHECK-NEXT:    [[ADD:%.*]] = call nsz float @llvm.experimental.constrained.fadd.f32(float 0.000000e+00, float [[A:%.*]], metadata !"round.tonearest", metadata !"fpexcept.maytrap") #[[ATTR0]]
; CHECK-NEXT:    ret float [[ADD]]
;
  %add = call nsz float @llvm.experimental.constrained.fadd.f32(float 0.0, float %a, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret float %add
}

; TODO: Canonicalize the order of the arguments. Then this will fire.
define <2 x float> @fold_fadd_vec_nsz_0_x_ebmaytrap(<2 x float> %a) #0 {
; CHECK-LABEL: @fold_fadd_vec_nsz_0_x_ebmaytrap(
; CHECK-NEXT:    [[ADD:%.*]] = call nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> zeroinitializer, <2 x float> [[A:%.*]], metadata !"round.tonearest", metadata !"fpexcept.maytrap") #[[ATTR0]]
; CHECK-NEXT:    ret <2 x float> [[ADD]]
;
  %add = call nsz <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float> zeroinitializer, <2 x float> %a, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret <2 x float> %add
}

;
; fadd with NaNs
;

define float @fold_fadd_qnan_qnan_ebmaytrap() #0 {
; CHECK-LABEL: @fold_fadd_qnan_qnan_ebmaytrap(
; CHECK-NEXT:    ret float 0x7FF8000000000000
;
  %add = call float @llvm.experimental.constrained.fadd.f32(float 0x7ff8000000000000, float 0x7ff8000000000000, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret float %add
}

define float @fold_fadd_qnan_qnan_ebstrict() #0 {
; CHECK-LABEL: @fold_fadd_qnan_qnan_ebstrict(
; CHECK-NEXT:    [[ADD:%.*]] = call float @llvm.experimental.constrained.fadd.f32(float 0x7FF8000000000000, float 0x7FF8000000000000, metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret float 0x7FF8000000000000
;
  %add = call float @llvm.experimental.constrained.fadd.f32(float 0x7ff8000000000000, float 0x7ff8000000000000, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret float %add
}

; Exceptions are ignored, so this can be folded, but constrained math requires that SNaN is quieted per IEEE-754 spec.

define float @fold_fadd_snan_variable_ebignore(float %x) #0 {
; CHECK-LABEL: @fold_fadd_snan_variable_ebignore(
; CHECK-NEXT:    ret float 0x7FFC000000000000
;
  %add = call float @llvm.experimental.constrained.fadd.f32(float 0x7ff4000000000000, float %x, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret float %add
}

; Exceptions may (not) trap, so this can be folded, but constrained math requires that SNaN is quieted per IEEE-754 spec.

define float @fold_fadd_snan_variable_ebmaytrap(float %x) #0 {
; CHECK-LABEL: @fold_fadd_snan_variable_ebmaytrap(
; CHECK-NEXT:    ret float 0x7FFC000000000000
;
  %add = call float @llvm.experimental.constrained.fadd.f32(float 0x7ff4000000000000, float %x, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret float %add
}

; Exceptions are ignored, so this can be folded, but constrained math requires that SNaN is quieted per IEEE-754 spec.

define <2 x float> @fold_fadd_vec_snan_variable_ebignore(<2 x float> %x) #0 {
; CHECK-LABEL: @fold_fadd_vec_snan_variable_ebignore(
; CHECK-NEXT:    ret <2 x float> <float 0x7FFC000000000000, float 0xFFFC000000000000>
;
  %add = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float><float 0x7ff4000000000000, float 0xfff4000000000000>, <2 x float> %x, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret <2 x float> %add
}

; Exceptions may (not) trap, so this can be folded, but constrained math requires that SNaN is quieted per IEEE-754 spec.

define <2 x float> @fold_fadd_vec_snan_variable_ebmaytrap(<2 x float> %x) #0 {
; CHECK-LABEL: @fold_fadd_vec_snan_variable_ebmaytrap(
; CHECK-NEXT:    ret <2 x float> <float 0xFFFC000000000000, float 0x7FFC000000000000>
;
  %add = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float><float 0xfff4000000000000, float 0x7ff4000000000000>, <2 x float> %x, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret <2 x float> %add
}

; Exceptions are ignored, so this can be folded, but constrained math requires that SNaN is quieted per IEEE-754 spec.

define <2 x float> @fold_fadd_vec_partial_snan_variable_ebignore(<2 x float> %x) #0 {
; CHECK-LABEL: @fold_fadd_vec_partial_snan_variable_ebignore(
; CHECK-NEXT:    ret <2 x float> <float 0x7FFC000000000000, float 0xFFFF000000000000>
;
  %add = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float><float 0x7ff4000000000000, float 0xffff000000000000>, <2 x float> %x, metadata !"round.tonearest", metadata !"fpexcept.ignore") #0
  ret <2 x float> %add
}

; Exceptions may (not) trap, so this can be folded, but constrained math requires that SNaN is quieted per IEEE-754 spec.

define <2 x float> @fold_fadd_vec_partial_snan_variable_ebmaytrap(<2 x float> %x) #0 {
; CHECK-LABEL: @fold_fadd_vec_partial_snan_variable_ebmaytrap(
; CHECK-NEXT:    ret <2 x float> <float 0xFFF8000000000000, float 0x7FFC000000000000>
;
  %add = call <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float><float 0xfff8000000000000, float 0x7ff4000000000000>, <2 x float> %x, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret <2 x float> %add
}

define float @fold_fadd_snan_variable_ebstrict(float %x) #0 {
; CHECK-LABEL: @fold_fadd_snan_variable_ebstrict(
; CHECK-NEXT:    [[ADD:%.*]] = call float @llvm.experimental.constrained.fadd.f32(float 0x7FF4000000000000, float [[X:%.*]], metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret float [[ADD]]
;
  %add = call float @llvm.experimental.constrained.fadd.f32(float 0x7ff4000000000000, float %x, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret float %add
}

define float @fold_fadd_snan_qnan_ebmaytrap() #0 {
; CHECK-LABEL: @fold_fadd_snan_qnan_ebmaytrap(
; CHECK-NEXT:    ret float 0x7FFC000000000000
;
  %add = call float @llvm.experimental.constrained.fadd.f32(float 0x7ff4000000000000, float 0x7ff8000000000000, metadata !"round.tonearest", metadata !"fpexcept.maytrap") #0
  ret float %add
}

define float @fold_fadd_snan_qnan_ebstrict() #0 {
; CHECK-LABEL: @fold_fadd_snan_qnan_ebstrict(
; CHECK-NEXT:    [[ADD:%.*]] = call float @llvm.experimental.constrained.fadd.f32(float 0x7FF4000000000000, float 0x7FF8000000000000, metadata !"round.tonearest", metadata !"fpexcept.strict") #[[ATTR0]]
; CHECK-NEXT:    ret float [[ADD]]
;
  %add = call float @llvm.experimental.constrained.fadd.f32(float 0x7ff4000000000000, float 0x7ff8000000000000, metadata !"round.tonearest", metadata !"fpexcept.strict") #0
  ret float %add
}

declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #0
declare <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float>, <2 x float>, metadata, metadata) #0

attributes #0 = { strictfp }
