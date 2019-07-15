"
RTColorPaletteExample new installTitle: 'DivergingPalette' 
		code:
		'CPDiverging show canvas'
	
"
Class {
	#name : #RTColorPaletteExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #sources }
RTColorPaletteExample >> exampleDivergingPalette [
	| v |
	v := RTView new.
	v @ RTDraggableView.
	RTCPDiverging new viewOn: v.
	^ v
]

{ #category : #icons }
RTColorPaletteExample >> exampleDivergingPaletteIcon [
	^ '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'
]

{ #category : #sources }
RTColorPaletteExample >> examplePalettes [
| v allLines lbl es lb| 
v := RTView new.
allLines := OrderedCollection new.

(RTPalette class selectors sorted) do: [ :selector |
	lbl := RTLabel elementOn: selector.
	
	v add: lbl.
	
	es := (RTBox new size: 20) elementsOn: (1 to: 5).
	v addAll: es.
	es @ (RTMouseHoverZoom new desiredExtent: [ :anElement | anElement extent * 1.7 ]).
	TRConstraint stick: lbl onTheLeftOf: es first.
	
	RTHorizontalLineLayout new gapSize: 3; on: es.
	RTMetricNormalizer new
		elements: es;
		normalizeColor: #yourself using: (RTPalette perform: selector).
	allLines add: es.
].
RTVerticalLineLayout on: allLines.

lb := RTLegendBuilder new.
lb view: v.
lb onDemand.
lb addText: 'Many color palettes are offered by Roassal'.
lb addText: 'To obtain the a palette, simply evaluate: RTPalette c5'.
lb build.
^ v

]

{ #category : #icons }
RTColorPaletteExample >> examplePalettesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFjUlEQVR4XuWcTWhcVRiGC+5d
COLOjbpxK7pwKS5cKlItIqggdBNEUMGmiBXB4l9tTEsbKmiSQiVJm8YhwaaThoIxk79pxsxk
EpPM352ZNJP5STKZ/8x3nO9m7uGe2Norgj3T9y0P4TvMap7m3HfOnZtDQuBHpxyiuTmia9cI
/63QRcj6Or4MrYQsLOAL0UkI/luALwQ/+ELwheAHXwi+kP8lueR1inrbhcVW0i2q1YAoFgck
PHPq6z0KnNJguwLH3/aqAjWCL+Qf4vf7KZVKEb4QTZJOpwn/N0SjVCoVfCH4wReCn1YUcn7g
F3rmzaPCouuyS6RS82Ix0C3hmZO52abA+f395xQ43z3xlALV6/hb1p2Sz+cpmUw2zjsXaGlp
yQRfyH2MYRjmGxOPx2lzc9OsvvhC7nPqB94cfCH4wReCnxYS8u2XnfT4o08Li1NfnRHdfQPi
xdfekPDMOdzZpcD5ePSiAmdk9lMF/A+GDlqWdZaFL0STloX/G6Jpy8IXgh98IfhpISGJvhM0
e+QhYZHo/0xkh78WobbHJDxzdk8+rGCm5xEVzuizCkT4Hwzv2bIikQj5fD7CF6JJy+Lam8lk
8IXo1rLwheAHXwh+WkiIO1um4+EdYTGWK4uFSklcym9JeOYES7sKZlFIZRU4xfmQAv4HQwct
KxwOk9frJXwhmrSsWq1GgUAAX4guLcv6iS8EP/hC8NNCQsgzQdT5jZBMTYiyf1ps952V8MwJ
dJ9R4Fw/26XA6evoVcDfshy0rHK5TOPj4/hCdGlZGxsb5Ha7CV+IZmdZ+ELwgy8EPy0k5MKV
YXr+7feExQ+DI6J/1C2OfNQu4Znz4RcnFDjfXzipwBn+9UcF/C3rHuFnDK07hvhCNAg/Y2jd
McQXokHszxjiC8EPvhD8tJCQ4maScsteYVFKJ8VWbFfEJlISnjmT/TkF80Pg6awC59SxnAL+
luVERLFIfISCL0SDcMPig0Z8IZpkdnaWQqGQefKLL0Sz0IHcae1u6/9mDV8IflpTSIf7Fj15
/Cdh0TF2i64uB8U7rkEJz5zzvlEFc/tL3VDgFOYvUdH3s7DA37Ichv+Sw+m/CxH/VYhdBr4Q
hy3L5XLR0NAQvhBdWhb/DIfDAl8IfsvCF4KfFhLC90RWVlYlPMeNOE1NTkt45tcea/+E7PDa
Sy+/TnZ47YV3PyA7+FuWg8RiMfO7WSxgdXVNWGQyWRE3EmLaMyPhuSlEoSlEoSlEAV+Ig5bF
51h8KxdfiCYta21tzfyyHL4QzVvW3YLfsvCDKWRzK0PB6IqE59p2mkrxZQnP5v98f4Ds8Fp1
zEN2zMLQe5ns4G9ZDltWoVAwBSzFVoVFYxa1nbQoJ/6U8GwmsKjSSO3GlALHuHhFAV+Ig5YV
jUYpGAziC9GlZfGfieXHE/CF4LcsfCH4aSEhub06has1Cc/Gdp4m4+sSnvm1A7/NkR1e+/xc
N9nhtVfeOkp28LcsB7G+l8UCIrU9YZGr14WxkxeexG0Jz6aQCa9CU4hCU4gCvhAHLcu8INdq
+EJ0aVnVapWsLQtfyAPUsup1Ijv7a3Wyg39Rx0/rCpluXEfONW5UWcw05vntGvUYZQnP/NqR
cIns8NqkL0t2eG1ueJXs4G9ZDi/sfC/EFFKpCIuZvT0xv70neuIVCc+mkEhZYV9ITmFfyJoC
vhCHZ1mLi4v4QnRpWXyOxeAL0bBl1W3gn2XhB1+IPYWiQenMlKRQbByn5A2K3PZIeObXzoRu
kh1eu/qHi+zwWsdkL9nB37IcJJvNUiKRIBaSyU4Ji2IxLrZ2DRHd8Eh4bgpRaApRaApRwBfi
sPLy4wj4QjRpWfyMIT/4iS/kQTvLOtDS9tfUf/gXdfzgC8EXgh98IfhC8IMvBF8IfvCFIOcv
FMdBUx6uJnQAAAAASUVORK5CYII='
]

{ #category : #sources }
RTColorPaletteExample >> exampleQualitativePalette [
	| v |
	v := RTView new.
	v @ RTDraggableView.
	RTCPQualitative new viewOn: v.
	^ v
]

{ #category : #icons }
RTColorPaletteExample >> exampleQualitativePaletteIcon [
	^ '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'
]

{ #category : #sources }
RTColorPaletteExample >> exampleSequentialPalette [
	| v |
	v := RTView new.
	v @ RTDraggableView.
	RTCPSequential new viewOn: v.
	^ v
]

{ #category : #icons }
RTColorPaletteExample >> exampleSequentialPaletteIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAMLElEQVR4XuWdeWxU1xXGTZpW
+aeK1EWq2kZOE0GUNqr6R5RGbVRKaaqmpUkTVUDplrZqSDGJQomgIaVgQsIOZt+NHbOZgDEG
L3jDgM0YLxgvMXgfbGxsvBsbGy+fO+eZc30OwkkjOfYb3U/6Cc+HGKH3ee4999w39wUMDo6P
uvsACfvXmrshYT+nqg0S9iPzrkPC/uL4UkjYnxmaAwn7zy1LgYT9Sa8dgsT4LyyGZLSuS8Dn
dcGPHTuGAwcO4ODBg7h/IBpWZWO3gnWhrFXBCs26pmAFRRUrWD/bdEHB+s68WAXroZf3KIz/
gyCF6wNZv349Vq9e7QSSmJiIpKQkZGZmorS0FGVlZbA/kDEO5MyZM4MnTpxAbm4uVq5cidra
WixbtgwJCQnOz/YHMsaBfJr6BgAJ++2+CUXCfn17DyTsl9y8BQn7nqoWSNiP/7geEvY/ulgN
CfvhKSWQGD/aA4nfB2K/XBYI7imz2G++3g4J+x8X10PCfnR6FSTsv3OyCBL2X9zrgYT9R0O2
Q8J+4OI3IDH+H1+ExJWBHD58GPn5+eY/l5GRgTt37uDunOJM7p9WZjVVtylYl/PrFKyDKWUK
1uzIPAXrmZA0BeuB4NUK1oS5v1cY/xfPKFwZCFVUFy9edC58Tk4OgoODMXfuXGdS93g8iI2N
RWRkJFJTU2F/IGMQCJW09CdXVcuXL0dnZyc2bdqErq4urF27FsXFxSgvL7c/ENfNIfeUWWYk
u9UDiQmquRMS9str2yExw2VlEyTsxxTVQcL+vrwCSExZ7UmDxPgJMZDYX2XZX2WNdi+rHxL2
a3y//RKzMLxaD4npZZ2vgIT9nR/mQGL8xYmQsL9t5mFI2A95ag0k7P8t8K+Q+EUgVGVR1XX5
8mVQbysqKgpXrlxxXnf3DwxKWN6mToVZ+RfWKczQkVyqYK3ddkFh/KATCtbKKXsVrOCH/6Ng
/Sbg1wq/CISqrDfffBMrVqzAjh07QK2U3bt3O6/tD2QcApFVFvW0yKPSNy8vz/5A3NfLGoCE
/Y7uXkjYr2vphMT0smrbIGG/0Lealxjfcw0S9vPjSyBhP29/LiTsJ4UmQWJ/lWV/lTXaVVY7
JKbK6qyCxPwGN2dDYtYV3hRI2F+TnwUJ+39PvgoJ+8/vzICE/UmLYiEx/owQSFwfCLVO4uPj
nVX5/v37wTuIw1VW26DEzCG3yhTm/RozFKZ/VhGrYL2bk64wzcWThQrW99amKsy+x+tHFcb/
abDC9YFs374d1dXVzo7h1q1bQTuIH3zwgaiy7A9kzIesJUuWoKCgwGk08g7icJVlfyAuq7J6
IDFVVm87JOw3dtdDwn5FezUk7Oc21kNiqqPqFkjYP15YCwn74RlVkBg/Lg8S+6ss+6usUe72
4gYkw9XXWUiGPwlRkLAf590NiVno5ayChP2ZsW9Bwv5PNs2ChP3ARS9BYvw/TIXEbwI5f/48
9u7d68wdYWFhqK+vB/W4BgdrBzV3A+k/rTALwLYIBetYxXoF698X3lGwpnz0JwXr8eVTFeYC
vf5DhfGff1LhN4EcPXrUqbSOHDniVFvUYBzayrU/kHEfsqivNfzK/kDsn9Ttn9Ttl//0svq7
FGYg6/IqWJ6GNIVZD5TsVrDeTl+g+NQha83zCnOB3nhKYfyff0vh2kC4mmpoaHBu/SkqKsKh
Q4dMT4tW7Tdv3oT9gYxRILKaoubipUuXQJXW5s2bsWvXLpw9e9Zpo9gfyBgOWbKaGvBtPtE9
Wfya72S0PxD7J3X7J3X75VeB3H9hONidrOHeV81GhfHTX1IYf+eTClbTW19TsHKmPaBg7Xz6
QQXrtYlfUrg6kFOnTtHE7dxUTbuEREtLC8LDw539EfrZ/kDGMJBVq4a6q1Rl1dXVYcGCBc7r
pqYm0KaV/Z+QcRqy+vr6cPv2bdg/ZNk/qds/qdsvlwfS2to64i5aY2Oj7+9yBjV31Rym4SGo
ZIHC+DHTFGZBuu45Bav/xe8qWDXf/LaClRIwScFa6vtZ4tpAKioqnO+iU+tk6dKlzuEB1MPa
smULgoKCnN3CDRs22B/IWFdZdGPcmjVrsG3bNmfHkAKhcAj7AxmHIYv7V/39/WroGq667A/E
/knd/irLfvl9IG1tbQpWSUmJwgwpKSkKlm/uUrDmz5+vYL3yyisK1sSJExXmwgUEKFwfCFVT
tHOYlZXl9LTorndauZ87d87ZMbQ/kDEOhEpdLn/pjnc6VGDGjBmoqqpyTnOwPxAXDFmVlZWw
f8iyf1K3f1K3X34SyFAPi1eObRpe6HkLFGZBlxSuMP6mfylYfXN+pTA9th8/pWBlf+MRBevA
w19XsGYHfFnhF4HExcWB7n5PTk6G1+vFe++950zqdFKQ/YGMUyB0qFlISIjpYVEYe/bssT8Q
180h9gdi/6Ru/6Ruv9wTyCftGN5d6t3DkJp7TihYnoZTCtaS3CQFa0pcuoL1yMY0BeuxPx9W
mIXh01sUrIcemalwbSB0pztN5HTTNZW51L+ir7DRRE5nLtJd8E6VZX8gY/sJoZ1Cqq587Qzn
k0InOdBOYkREBGJiYuwPxG1zCFABCfstPYmQsJ/bmAwJ++sLzkPC/szULEjYfzbUAwn7z82L
gYT9ydPCIGF/0rNzIbF/Urd/Uh9d9fX2Q2KWJ7d6IDGfnOttkLB/s7gBEvY70r2QmPePKoDE
tHUOpELC/pXQBEjYzwg9AolfBJKenm7+o9R6v3596Ak4dNxfd+edQQnrxrVWBavodKmCdXGL
R8Gq+ke0wrz/k6sVrEtfma5g7QiYqhheGAYq/CIQOsWaTgCifhZ9zY0OxKQdQ6q47A9knIYs
+k4h7RRSCFRpLVy40Llxzv5AXDaH+EKAhP0G3/wgYf/q2QpI2M8Ly4WE/eqFpyEx7z91OyTs
F35/DiTs7w+cBQn77wT+CBL7qyz7q6xRXof09ULC/kBHOyTGr6+DxHR7S6shMVVcRhkk7LfH
XIHEDHGhuZCwnxOaDQn7iaEXIPGrKouqKlllDY1ZtzR84b0VCnPhM9IUrN59sQrz9q+HK1gV
T29XsKIm/FfBWjRhoYL1QsAchV8EQt81pDYJTeh01Pj8+fORnZ3tVF32BzIOgdAxGhTG7Nmz
h3YJfaJH59GpDvYH4rY5pLsTEnPha7yQmDkh2wMJ+3eOpEBiAll0FBL2vdMiIGE/PnAdJOyv
ClwBCft/CXwXEvurLPurrNGuskZ45FGXb10iYP+zPvIoq7IJEvZHeuRRWKYXEuOnFULC/r6T
ZyDxy17W0MYUX/kRHgp2o0PB+qwPBXs7Mk/BGumhYF98K1rBenDWOgXrgWdnKvyml0XfM+Sj
xqnKog0qem1/IOM0ZNGnZPr06U4g77//vvMoPXrAi/2BuK7KGuHRqw0dkLD/WR+9uvxkESTs
j/To1ceDT0PC/mNv7IKE/Ud/OxcS+6ss+6us0dVIjzzq9O0eSthv9K1VJKYL3HoTEjNU3iiH
xKw3qrIgYf9oYQIk7Id6jkNi/IRISPwikKEjxe//eqSHgtV23VGYVX9TnYK18+pFBeu1c/sV
rClRCxRmyLLhiD96bF5oaKhTVdHtQPRknaSkJOeUUvsDGYdAqKKiJ+1QlUVfSZg3b545+93+
QFw3h0DB6ujtVwwH1aEwQTVeV5gVuTdfYVbexYkK1saMDxWsJXFbFcYPX6ewv8qyv8oaZfV2
aXh90lGnMP6NywrjF8cqjH9hr4LVc2qVwixII5YqWAW7ghWsM5uDFa4LBD7RYZf/9z/oatTw
+9RdUrAGLn+oMH5UkML4Ixw+0/7PrypYJb+coDCdgGe+oDBD1hMPKlwXCB98GR0dDWqXTJ48
GWlpaU7vir7ORpXWq6++6rRQnJMc7A/k8w2EGol09BIdAUvHi9fU1IA8+voB9bBo95COGSfo
7Hf7AxnHOeT48eO4d5Fo/xxif5Vlf5X1SaL2lcS0VG73KsxvcFOXglVR2axgXcqpUZjf7NRy
BevU4XwFK3KzR8HatyRV4cpA6MQfOvlnpDlGvu7vG1CwWpu7FMPv3ahgJaeUK0zzb1emgrV0
caKCNeflCAXrd09sULAmByxWuDIQOiiAjl6iO9zpjHfaiNq4cSP47CxZZdkfyBh9QpyW+NWr
zl2KFAqdSEqVVmZmpqqy7A/k/vofLt9V3vY9IUMAAAAASUVORK5CYII='
]

{ #category : #accessing }
RTColorPaletteExample >> label [
	^ 'Color palettes'
]
