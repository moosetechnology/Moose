Class {
	#name : #RTAxisAdaptedBuilderExample,
	#superclass : #RTAbstractExample,
	#instVars : [
		'objects',
		'minX',
		'maxX',
		'minY',
		'maxY',
		'margin',
		'xAxisConfiguration',
		'yAxisConfiguration'
	],
	#category : #'Roassal2-Builder-AxisAdapted'
}

{ #category : #sources }
RTAxisAdaptedBuilderExample >> boxesFlLayout [
	<gtExample>
	<iconSelectorBase64: #boxesFlLayoutIcon>

	"RTAxisAdaptedBuilderExample new boxesFlLayout"
	| view coll n  b |
	view := RTView new.

	coll:= #(50 60 80 100 85 10 35).

	n := RTMultiLinearColorForIdentity new objects: (coll).

	coll do: [ :r | view add: ((RTBox new color: [ :value | n rtValue: r]; size: r) elementOn: r )].

	RTFlowLayout new applyOn: view elements.
	view elements do: [ :e | e @ (RTPopup text: [:el | el])].

	b := RTAxisAdaptedBuilder new.
	b view: view.
	b margin: 20.
	b objects: view elements.
	b build.
	^ b view
]

{ #category : #icons }
RTAxisAdaptedBuilderExample >> boxesFlLayoutIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAAEjElEQVR4XuWc20sbQRTG+9/5
6l/gn6Hgg5YiqNDig4iIl75UUJAiVgoqXmK8+xCiqG3UpEu8YBITc10N9WzzHRixRZNmjemm
3weH2Vn2ZGbnt5PJnMzsG8fhl5f0hr8J+IHwix8IPxB+8QPhB8IvfiD8QPjFD4QfCL/4gfCL
Hwg/EH7xA+EHwi9+IPxA+MUPhB8Iv/iB8Ku+QILBoCCdm5sTkw8EAlLOZ3NzU9LptExNTel1
5+fnsr6+LltbW1IoFKRSeclkUmKxmJydncn29rYcHBzI1dXVs363t7cCv8nJSTk+PtZycN74
m7o/p8XFRfVfWFjQcnB/yFfyqzuQ/f192dnZ0Up1dHRILpfTG4aV80MjoHHGx8e1ce/v72Vp
aUnzExMTZX1RHq73+XwyPDwsph7t7e0V/VZWVqStrU1aW1v1WgPG1L3cQ5DNZhWkZVl63NnZ
qannesjy8rKDJ2dgYEArjKdnb2+v4hOHRhwdHVUfwJmenpbBwUEpFotlfUsNof64Hr0M/oeH
hzI/P/+sH+oEv6GhIb2mr69PewbqjvJQ90pl4lrY6uqq3t/GxkZFP/4xhGkM+XNcQDc2PUFK
SqVSmlb7ubZtq7kRynQjjFOVxqrXqG/NgOD73YwVZhBHNy41iB5jHDg9PXWi0ah+5VRj8Xhc
rVo/2MnJiePGDz8I3JaZSCTE7YNQ0x5SunlBgwNMKBTS7+3d3V156dPK30P4xT8x5JcHgNzc
2bJxFXX+xqBE/KwqK97dSiEYkJx/2XFrd1aEB4iVvZEP+5vO3xgU+rZTleVzaUl++iix7reO
WwMUfiD8QPiB8APhB8IPhAoIgniP8xcXFxrY+/M8P5A6ACmFRKSlpUXwnwXy+Xxeuru7ZWxs
TEwYBbNehE8ymYzwA3llIPjfoampSUPVCHvPzs5Kc3OzmGMTTkAYgx8I/xjCD+S1Zur8QDwm
fiAeU9Q6kmrMtnP8QLwmfiD8QPiB8ANpIGXmv+o44tbwfwoNkJ/FguTjkZqa/pzOW/JSs4s3
UrwrSiGX19TO2ZKKpZ60bCojngPi9/tlZmZGl25eX19ryOTx0s2nZur5eFhCX945tTRo6/v7
F1s0se4k49dO+NuxptbhD8f/2fekBX0B7wHBar2enp6H1YFYj/V46WYjAsncpOXcigrShgOC
JT9ra2sazzL5cks3GwHIb2GeRgPiRvxA+IHwA+EHwg+EHwgDEIqJIT8QfiD8QPiB/AMg2OEa
iURkZGRE9wJi1QlCKV1dXZrC+IHUuYcACsInWOpjtgJjoyfScDis55FivRY/kDoAwd5BAMDW
YRM+QeMjj61hj8UPhH8M4QfCD4QfCD8QrwL5X8QPhB8IPxBPAeEXPxB+IPz6R0BKs/OHGTgW
OOAFYpeXl2o499QOKn69EhCEQ3p7ex8aGqESvAXo6OhIzNuA+IHUEQhiV+aNatjG1t/f//Dm
OAQc+ZuWfwzhB8IvfiD8QPjFD4QfCL/4gfCLHwg/EH7xA+EHwi9+IPxA+MUPhB8Iv/iB8Isf
CD8QfvED4QfCr1rqFwbGcUaeNWcPAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTAxisAdaptedBuilderExample >> boxesFlowLayout [
	<gtExample>
	<iconSelectorBase64: #boxesFlowLayoutIcon>
	
	"RTAxisAdaptedBuilderExample new boxesFlowLayout"
	| view coll n  b |
	view := RTView new.

	coll:= #(50 60 80 100 85 10 35).

	n := RTMultiLinearColorForIdentity new objects: (coll).

	coll do: [ :r | view add: ((RTBox new color: [ :value | n rtValue: r]; size: r) elementOn: r )].

	RTFlowLayout new applyOn: view elements.
	view elements do: [ :e | e @ (RTPopup text: [:el | el])].

	b := RTAxisAdaptedBuilder new.
	b view: view.
	b margin: 20.
	b objects: view elements.
	b build.
	^ b view
]

{ #category : #icons }
RTAxisAdaptedBuilderExample >> boxesFlowLayoutIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAENUlEQVR4XuWcy0tbQRjF+7e5
1D/DpXsXIhrro4JVEURcKClSKS7swuD7GWNMKQgtbdVamjSJUTTiK/GtJ+0ZesXa5nmj3vQc
OMSE+e53M79MJjPOzLNUSl9O0jP9KtAHoi99IPpA9KUPRB+IvvSB6APRlz4QfSD60geiL30g
+kD0pQ9EH4i+9IHoA9GXPhB9IPrSB6IvfSD6QPSlD0QfSAZdX1/j6OjImM+3t7eRqfzFxQW2
trZwfHwMiq/F43Hs7e0hmUwiWy4rbnNzEzc3N3/kziTmZDzzM47xucTy3qxcOzs7sK7lWCBr
a2twu92Yn583FZpIJDLebH9/P6amplBRUYFoNGrKTkxMoKamBrFYDNly8bG7uxtjY2Pmbyt3
pjhWOsuMj49jYWHBlJ2cnEQusbw35qqvr4fL5TJlz87OcHp6CkcCqaqqwuzsLHw+H5aWltDU
1JTxRldXV1FbW4vGxkZ4PB7Mzc2Z5319fZiZmUG2XK2traZiI5GIyWflThfzq8JTLMN8/CBM
T0/D7/ejoaEha6x1b8xFcLwGc7a0tEC/D9HvQ3LvKy4vL0EXct1Cm76dOKvvykd23uODAMnU
V4RCodTIyEiKzT8fLy4uopA42kacyZtvHL/u9vf3nQMkU1/BXz50vtfkJ7XQXyx24gppIYW+
R/0+RH9gqK+SABJOHCIXs+xJ8gj52AwwfwRhx3JA2j8FcjK1sf4+L1O7L1y2rA9EH4g+EH0g
+kD0gegD0QfytECWl5c59WxG6nx+fn6O9vZ2dHR03P505JTC/WkFfSAPBKSrqwuVlZWoq6sD
57O8Xq+Zx+I0Av/ZwzIHBwfG+kD0v7L0geSqoe+fkYv1gThQ+kAcpmh4DflYH4gDpQ9EH4g+
EH0gJaT9127YsRyQk3gIxTSveXgShl3zOqfJE9BmULt7gHR2LBCuKuTitPLycnOT1dXVWFlZ
ub3hf43UNzzPi2rq3deXtk0F178ZU7633rR2LJDh4WG0tbVhYGDAQOCqDa78K1UgsXAUdMkC
ubsI+urqKuv6XacDuauSBFLQ6FsfiD4QfSD6QPSBFBvIR+8HpLM+kCcAIjMw1AeiD0QfiD6Q
RwbCQeDo6KjZk8fBIUfsfJ27UgOBgNmdqg/kkVtIc3MzhoaGMDg4iN7eXgOAO5D42NPTYx65
g4rWB/LAQNgKuCaLO2S5v66zs9O0Fu5s5Z5DC4h+C9HvQ/SB6APRB/IXkC+RN7BrfSBFBPK/
SB+IPpBUKuJ/hWJaH4i+9IHoA8lB1oFh1rESxTrESx+IDfHAME6hpDvEKxgMgtav6kcAYh0Y
VlZWBusgsPuHeOG39Ktavw/RB6IvfSD6QPSlD0QfiL70gehLH4g+EH3pA9EHoi99IPpA9KUP
RB+IvvSB6EsfiD4QfekD0QeiL30g+kD0pQ9EH4i+nkI/AWbyx21YZEZCAAAAAElFTkSuQmCC'
]

{ #category : #examples }
RTAxisAdaptedBuilderExample >> label [
	^ 'Axis adapted'
]

{ #category : #sources }
RTAxisAdaptedBuilderExample >> withColorPalette [
	<gtExample>

	"RTAxisAdaptedBuilderExample new withColorPalette"
	| c b |
	c := RTColorPaletteExample new exampleSequentialPalette.

	b := RTAxisAdaptedBuilder new.
	b view: c view.
	b margin: 20.
	b objects:  c view elements.
	b build.
	^ b view.

]

{ #category : #sources }
RTAxisAdaptedBuilderExample >> withComposer [
	<gtExample>
	<iconSelectorBase64: #withComposerIcon>
	
	"RTAxisAdaptedBuilderExample new withComposer"
	| c b |
	c := RTComposerExample new exampleClassAnalysis2.

	b := RTAxisAdaptedBuilder new.
	b view: c view.
	b margin: 20.
	b objects:  c view elements.
	b build.
	^ b view.
]

{ #category : #icons }
RTAxisAdaptedBuilderExample >> withComposerIcon [
	^ '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
AABJRU5ErkJggg=='
]

{ #category : #sources }
RTAxisAdaptedBuilderExample >> withMondrian1 [
	<gtExample>
	<iconSelectorBase64: #withMondrian1Icon>
	
	"RTAxisAdaptedBuilderExample new withMondrian1"
	| c b |
	c := RTMondrianExample new exampleNormalization .

	b := RTAxisAdaptedBuilder new.
	b view: c view.
	b margin: 20.
	b objects:  c view elements.
	b build.
	^ b view. 
]

{ #category : #icons }
RTAxisAdaptedBuilderExample >> withMondrian1Icon [
	^ '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'
]

{ #category : #sources }
RTAxisAdaptedBuilderExample >> withMondrian2 [
	<gtExample>
	<noTest>
	"RTAxisAdaptedBuilderExample new withMondrian2"
	| c b |
	c := RTMondrianExample new exampleBezier  .

	b := RTAxisAdaptedBuilder new.
	b view: c view.
	b margin: 20.
	b objects:  c view elements.
	b build.
	^ b view.

]
