"
RTStackBarPlotExample new installTitle: 'SimpleWithDifferentColor' 
		code:
		'
| b |
b := RTStackBarPlot new.
b interaction popupText.
b colorPalette colors: { Color blue . Color gray . Color red }.
b add: #(1 2 3 4 ).
b add: #(4 3 2 1).
b add: #(5 3 2 0).

b barWidth: 200 height: 20.
b open.
^ b view canvas'
	
"
Class {
	#name : #RTStackBarPlotExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-StackBarPlot'
}

{ #category : #sources }
RTStackBarPlotExample >> exampleSimple [
	| b |
	b := RTStackBarPlot new.
	b add: #(1 2 3 4).
	b add: #(4 3 2 1).
	b add: #(5 3 2 0).
	b build.
	^ b view
]

{ #category : #icons }
RTStackBarPlotExample >> exampleSimpleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABR0lEQVR4XuXVsQmAMBRF0Sxr
7SKCO2llqZVD6Ao/WlkpKgQUzoUskAPvp5z9/lTyv8AH8fNBfBA/H8QH8fNBfBA/H8QH8fNB
/HwQH8TPB/FB/HwQH8TPB/FB/HwQPx/EB/HzQXwQPx/EB/HzQXwQPx/EzwfxQfx8EB/Ezwfx
Qfx8EB/Ezwfx80F8ED8fxAcp0tI2x5uH6vRN/XT78lq/erHng/ggPogP4oP4R90/6n7GZD15
V7P2ZOJiqcOfLB/EB/FBfBD/qPtH3c+frBLzNXZjnM6XP1nfgFzeEx/EB/FBfJD3xUf5R93P
B/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/EzwfxQfx8EB/E
zwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxK9IG4S3hO8XsV6oAAAAAElF
TkSuQmCC'
]

{ #category : #sources }
RTStackBarPlotExample >> exampleSimpleWithDifferentColor [

	| b |
	b := RTStackBarPlot new.
	b interaction popupText.
	b colorPalette colors: (Array with: Color blue with: Color gray with: Color red ).
	b add: #(1 2 3 4 ).
	b add: #(4 3 2 1).
	b add: #(5 3 2 0).

	b barWidth: 200 height: 20.
	b build.
	^ b view
]

{ #category : #icons }
RTStackBarPlotExample >> exampleSimpleWithDifferentColorIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAABbElEQVR4XuXW4QmCUBSAUUdp
FEdxEdEN2kDbwA3UCWqD3KAm6L78E0FQYREY54M7gO/guy9LyW9NZf4R+CB+PogP4ueD+CB+
PogP4ueD+CB+PoifD+KD+PkgPoifD+KD+PkgPoifD+Lng/ggfj6ID+Lng/ggfj6ID+Lng/j5
ID6Inw/ig/j5ID6Inw/ig/j5IH5rALlcIvJ8TPcZoq7r9GrGPF8002Yzf1328URZhg/ig/gg
PogP4i91f6n7/fuVtXzeXXGPsyuKd1dc+DvEB/FBfBAfZP0gMde2U/pmhmFYNIeuS1PbPp3z
dhupqtJtou/9Z6/fH/8hv/5jTvu9v0PWtFOOTeOD+CA+iA/i7xD/leW/svx8EB/EzwfxQfx8
EB/EPwIfxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/HwQH8TP
B/FB/HwQH8TPB/FB/HwQPx/EB/Fb1hXzQ/HInLBYRQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTStackBarPlotExample >> exampleSurveyResult [
	| b |
	b := RTStackBarPlot new.
	b interaction popupText.
	b colorPalette colors: (Array with: Color blue with: Color lightBlue ).
	b add: #(37	33	0	0 0) title: 'DN1'.
	b add: #(24	26	17	3 0) title: 'DN2'.
	b add: #(25	29	15	1 0) title: 'DN3'.
	b add: #(30	33	6	1 0) title: 'DN4'.	
					
	b addLegend: #('strongly agree' 'agree' 'neutral' 'disagree' 'strongly disagree').
	b barWidth: 260 height: 20.

	b addLabelToBars: [ :assoc | (assoc key  / b totalSum * 100) asInteger asString, '%' ] if: [:assoc | assoc key > 5 ] color: Color white.

	b build.
	^ b view
]

{ #category : #icons }
RTStackBarPlotExample >> exampleSurveyResultIcon [
	^ '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
+wAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTStackBarPlotExample >> exampleVerticalStackBarPlot [

| b |
b := RTStackBarPlot new.
b vertical.
b interaction popupText.
b colorPalette colors: (Array with: Color green with: Color red).
b add: #(37 33 ) title: 'SampleText1'.
b add: #(24 26 ) title: 'SampleText2'.
b add: #(25 29 ) title: 'SampleText3'.
b add: #(30 33 ) title: 'SampleText4'.
b addLegend: #('yes' 'no').
b barWidth: 40 height: 260.
b
	addLabelToBars: [:assoc | (assoc key / b totalSum * 100) asInteger asString , '%']
		if: [:assoc | assoc key > 5]
		color: Color black.
b build.
^ b view
]

{ #category : #icons }
RTStackBarPlotExample >> exampleVerticalStackBarPlotIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAD+klEQVR4XuWcy0uUURiHBxc1
/0DMdrzgInHbSsTb4P1+Q/EGCu1ctioUdxW0iKxFgbjIJME25WibyAupi6BAUAgTQV24cBNZ
Rmd63/EoCt83zsDQ9+nD8DDfN+fHt3ifM+cc5zufgaKiohgf/xDgF4EvhA9fCF8IH74QvhA+
fCF8IXz4QvhC+IXgC+HDF8IXwocvhC8kMYWRQlNQVeCKtnuZwwkJj4VjgQQvbfcyxxfCF8IX
whfCF8IXwhfCF8IXwhfCF8IXwhfCF8IXwhdyWYRsyScLwqawJ2wLKy65N8IzYV3YFWZchEwJ
r4SovfYqX8hxAV/YwvwR1mzRnQo4ItwW3gpLwrBD7rN88kD4KjyxuXGHXNQKWLL6R4VJvpBY
4IuU4LWVMS9MC7MOBdywPVlfv4R9YSKNQ9ahcMQXctyTPwnLwk/hwIrhzyH8SZ0vhC+EL4Qv
hC+EL4QvhC+EL4QvhC+EL4QvxKdCbo1km/zFa65ou+bGwuFYLBBwRds119sbjg0NBVzRdr6Q
BEKSLXS6c3whfCHeCnl0M9t8u3HdFW33q5CBgYGk9/+mkvVUiFeF5gu5okJCcyGjQ2twJ3iu
4OXl5aaqqsp0dHQYvhCPhfT395vGxkZTU1Nj2tra+EL+p5D8O/km62mWyX2Ye1rw1tbWk2NT
XFzMF8KfQ/hC+EL4QvhC+EL4QnwuZEvOF4Qd4b2wLaw45P7K+TthRlgXdu2xk5Ap4b4wbq+9
mqKQuVDIaH4nGDRXSsiiLcwHYU3YdCngiLAs/BCWhGGH3Ec5v2cL/Nvmxh1yUSvgpW0bFSbT
IESXvYODg6alpcVcSiFawO+CfgP2hGlh1qGAG3IetdK0bV+YSOOQdSgcpSjkbl6e0ezjnJzT
gldWVpqKigpz5u+Ry/cNOThTaD2e588h/Ek9VSF9fX2mq6srKfTnFL4Q/v0QvhC+EL4QvhC+
EL4QvhC+EL4QvhC+EL4Q/wt5nplpDjMyXNF2L3P8/0rKhy+EL4QPXwhfCJ+rLaS2tjapVU99
fb3RfbXJ5HTv7UU53Xl4svuQL8RSV1dnqqurz92jdsspZ2+dJrpee3v7hTnN6I0ovhCLblrW
O25NTU2mubnZJJPr6elJKqdclLOdgC1Et/CXlZXFC6tDi1uP9yqHEaJDhM4VkUgkPlRoURS/
5HBCtEfqeK1baBINE17lMEJ0vO7s7Iw/bZRo5eNVDiOktLTUdHd3x3umvrstV73KIYRoEUpK
SkxDQ0N88tThQh/98ksOJ0QnT11KakFOnr/zUw45ZCW7tvcqx//phA9fCF8IH74QvhA+fCF8
IXz4QvjwhfCF8OEL4QvhwxfCF8KHL4QvhI+3/AOXK+27CEfa9wAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
RTStackBarPlotExample >> label [
	^ 'StackBarPlot'
]
