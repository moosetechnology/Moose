"
RTGradientColoredLineExample new installTitle: 'Dependencies' 
		code:
		'| eb |
v := RTView new.

es := RTEllipse new elementsOn: RTShape withAllSubclasses, TRShape withAllSubclasses.
v addAll: es.
es @ RTDraggable.
es @ RTPopup.

eb := RTEdgeBuilder new.
eb view: v.
eb shape line color: Color black.
eb objects: RTShape withAllSubclasses from: #yourself toAll: #dependentClasses.

RTMetricNormalizer new
	elements: es;
	normalizeSize: #numberOfLinesOfCode min: 10  max: 30;
	normalizeColor: #numberOfMethods using: {Color green . Color red} using: #sqrt;
	alphaColor: 0.5.

RTForceBasedLayout new charge: -300; on: es.

v edgesDo: #remove.

eb := RTEdgeBuilder new.
eb view: v.
eb shape gradientLineFrom: Color green to: Color white.
eb objects: RTShape withAllSubclasses, TRShape withAllSubclasses from: #yourself to: #superclass.

v open.
v canvas.'
"
Class {
	#name : #RTGradientColoredLineExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #sources }
RTGradientColoredLineExample >> edgePaletteColored [
	<gtExample>

	| v elem1 elem2 edge|
	v := RTView new.
	elem1 := (RTEllipse new color: (Color blue alpha:0.6); size:10) elementOn: 1.
	elem2 := (RTEllipse new color: (Color blue alpha:0.6); size:10) elementOn: 2.
	elem2 translateBy: 200@0.
	elem1 @ RTDraggable.
	elem2 @ RTDraggable.
	v add: elem1.
	v add: elem2.
	edge := RTEdge from:elem1 to:elem2.
	v add: (edge + (RTMultiColoredLine new colors: (RTColorPalette qualitative colors: 12 scheme:'Paired'); colorShape)).
	^ v 

]

{ #category : #sources }
RTGradientColoredLineExample >> exampleA [

	| v elem1 elem2 edge |
	v := RTView new.

	elem1 := (RTEllipse new color: (Color blue alpha:0.3); size:20) elementOn: 1.
	elem2 := (RTEllipse new color: (Color red alpha:0.9); size:20) elementOn: 2.
	elem1 @ RTDraggable.
	elem2 @ RTDraggable.
	elem2 translateBy: 300@0.
	v add: elem1.
	v add: elem2.
	
	edge := RTEdge from:elem1 to:elem2.
	v add: (edge + (RTGradientColoredLine new colors: (Array with: (elem1 color) with: (elem2 color)); precision: 100; gradientColorShape)).

	^ v
]

{ #category : #icons }
RTGradientColoredLineExample >> exampleAIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACBklEQVR4XuXVS1IaUQCFYffg
yC2YgWtxDZZLcwOOdO4IiUZCRIPG94sGRMUHqMc0RUxWkCqK7686C7j91e078/HhN0nN+J/A
B/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/EzwfxQfx8EB/EzwfxQfx8ED8fxAfx80F8ED8f
xAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/P4L
SMoqlWR9PSmKZNo/3Oi8WVpKFhaSjY1MHMgIY3X136YeZHk5mZv7u4kDWVsbQ6ysjPaedvFn
rfcUN29plyuuX8e7Go53ORjvYpDW+Uu557TOntI6He0xxUm5435axw8pju7H+3VXrpf24W3a
B93xmp10mu10fhbp7rfK3aS7d51u4yq3jcvc7l6kt3ue3o+z3NVPy53k/vtxuaM81A7Trx2k
v9PM47f9cnt52m7keWu3XD0vX+sZVGsZVncy3NzO6+ZW3irVvM1/yfvs7OSCjH5Tn7ejvMHT
f0NGh/y8IYuL8R91/1H380F8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNB
fBA/H8QH8fNB/HwQH8TPB/FB/HwQH8TPB/FB/HwQPx/EB/HzQXwQPx/EB/HzQXwQPx/Ezwfx
Qfx8EB/EzwfxQfx8EKHfwFZ+KsQkEEMAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGradientColoredLineExample >> exampleB [

	| v elem1 elem2 edge |
	v := RTView new.

	elem1 := (RTEllipse new color: (Color red alpha:0.3); size:20) elementOn: 1.
	elem2 := (RTEllipse new color: (Color red alpha:0.9); size:20) elementOn: 2.
	elem2 translateBy: 300@0.
	v add: elem1.
	v add: elem2.
	
	edge := RTEdge from:elem1 to:elem2.
	v add: (edge + (RTGradientColoredLine new colors: (Array with: (elem1 color) with: (elem2 color)); precision: 100; gradientColorShape)).

	^ v
]

{ #category : #icons }
RTGradientColoredLineExample >> exampleBIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABxUlEQVR4XuXVy01CURiFUXpw
ZAtOqMUajKXRgCOdM/KFiPLwCT5QsIeN4h+pQJMb15fsAu5Z9+S0Viu/JtXyj8AH8fNBfBA/
H8QH8fNBfBA/H8QH8fNB/HwQH8TPB/FB/HwQH8TPB/FB/HwQPx/EB/HzQXwQPx/EB/HzQXwQ
Px/EzwfxQfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx80H8/gQk646Pk6Oj
5OMj//3gvr93by9pt5NuN80DWWMcHGz270H295Pt7c2aB3J4WBidTu3rlnxvuUwWi9r7e+3t
rTaf115fk5eX2vNz8vRUm82S6bT2+Fh7eKjd3yd3d7Xb29rNTTKZ1MbjZDSqDYe16+vk6qo2
GNQuL2v9fnJxUev1kvPz2tlZcnpaOzmprX++nZ1ka6vBIOvD/7khv3iFG3tDvr5xc0N2d+M/
6v6j7ueD+CB+PoifD+KD+PkgPoifD+KD+PkgPoifD+Lng/ggfj6ID+Lng/ggfj6ID+Lng/j5
ID6Inw/ig/j5ID6Inw/ig/j5IH4+iA/i54P4IH4+iA/i54P4IH4+iJ8P4oP4+SA+iJ8P4oP4
+SBCnzOafijeu2A3AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGradientColoredLineExample >> exampleDependencies [
	
	| eb v es |
	v := RTView new.

	es := RTEllipse new elementsOn: RTShape withAllSubclasses, TRShape withAllSubclasses.
	v addAll: es.
	es @ RTDraggable.
	es @ RTPopup.

	eb := RTEdgeBuilder new.
	eb view: v.
	eb shape line color: Color black.
	eb objects: RTShape withAllSubclasses.
	eb connectToAll: #dependentClasses.

	RTMetricNormalizer new
		elements: es;
		normalizeSize: #numberOfLinesOfCode min: 10  max: 30;
		normalizeColor: #numberOfMethods using: (Array with: Color green with: Color red) using: #sqrt;
		alphaColor: 0.5.

	RTForceBasedLayout new charge: -300; on: es.

	v edges do: #remove.

	eb := RTEdgeBuilder new.
	eb view: v.
	eb shape gradientLineFrom: Color green to: Color white.
	eb 
		objects: RTShape withAllSubclasses, TRShape withAllSubclasses;
		connectFrom: #yourself to: #superclass.

	^ v
]

{ #category : #icons }
RTGradientColoredLineExample >> exampleDependenciesIcon [
	^ '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'
]

{ #category : #sources }
RTGradientColoredLineExample >> exampleedgePaletteColored [
	
	| v elem1 elem2 edge|
	v := RTView new.
	elem1 := (RTEllipse new color: (Color blue alpha:0.6); size:10) elementOn: 1.
	elem2 := (RTEllipse new color: (Color blue alpha:0.6); size:10) elementOn: 2.
	elem2 translateBy: 200@0.
	elem1 @ RTDraggable.
	elem2 @ RTDraggable.
	v add: elem1.
	v add: elem2.
	edge := RTEdge from:elem1 to:elem2.
	v add: (edge + (RTMultiColoredLine new colors: (RTColorPalette qualitative colors: 12 scheme:'Paired'); colorShape)).
	^ v 
]

{ #category : #icons }
RTGradientColoredLineExample >> exampleedgePaletteColoredIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABbklEQVR4XuXUTQpBURjHYZu1
AmNiCxbkDoyIMPORKOVSV4rE5L7I4MgK3Hp+9Z+eTuepU3s+/apUzX8CH8TPB/FB/HwQH8TP
B/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/EzwfxQfx8EB/EzwfxQfx8ED8f
xAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfJDfer2ITieiqo+S
Zf+7319A2u2IRvMex+vjs8XxEsPNKa2479Imh3HaPl9Gme/THoNBWpzX3x2mEdt+2qW4pa1m
edrpfUbEd8V89Fm3NYp6vQz/y/LzQXwQPx/EB/HzQXwQPx/EB/HzQXwQPx/EzwfxQfx8EB/E
zwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxM8H8UH8fBA/
H8QH8fNBfBA/H8QH8fNBfBA/H8TPB6l0L/57mfhqM72IAAAAAElFTkSuQmCC'
]

{ #category : #'as yet unclassified' }
RTGradientColoredLineExample >> label [
	^ 'Gradient and multi colored lines'
]
