"
LinearDistributionMap displays the elements based on linear shades of color. 
"
Class {
	#name : #LinearDistributionMap,
	#superclass : #AbstractDistributionMap,
	#instVars : [
		'baseColor'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #rendering }
LinearDistributionMap >> baseColor [
	
	^ baseColor ifNil: [ self defaultBaseColor]
	
]

{ #category : #rendering }
LinearDistributionMap >> baseColor: aColor [
	"To set the color to be used for the linear color computation. When we specify Color red, we will have shade of red"
	
	baseColor := aColor
	
]

{ #category : #rendering }
LinearDistributionMap >> defaultBaseColor [

	^ Color gray
]

{ #category : #rendering }
LinearDistributionMap >> orderElementsFor: aContainer [
	^ (self elementsFor: aContainer)
		sorted:
			[ :a :b | (elementsAndPropertyValue at: a) >= (elementsAndPropertyValue at: b) ]
]

{ #category : #accessing }
LinearDistributionMap >> orderParts: aCollection [

	^ aCollection sorted: [ :a :b | | sizea sizeb|
		sizea := (self elementsFor: a) sum: [ :e | elementsAndPropertyValue at: e ].
		sizeb := (self elementsFor: b) sum: [ :e | elementsAndPropertyValue at: e ].
		sizea >= sizeb ]
]

{ #category : #rendering }
LinearDistributionMap >> renderElementsFrom: node on: view [
	
	"TODO: Broken"
	"view interaction menuMorphBlock: [ :element | element mooseMenuMorph ].
	view interaction nodraggable.
	view interaction forward: ROAbstractMouseDragging.
	view shape rectangle
		size: 10;
		linearRedFillColor: [ :e | elementsAndPropertyValue at: e ] within: elementsAndPropertyValue keys;
		borderColor: self baseColor."
	view nodes: (self orderElementsFor: node)
]

{ #category : #rendering }
LinearDistributionMap >> renderLegendOn: view [
]
