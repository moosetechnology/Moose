Class {
	#name : #RTSugiyamaLayout,
	#superclass : #RTAbstractGraphLayout,
	#instVars : [
		'sortBlock',
		'labels',
		'layers',
		'layerNrs',
		'connections'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #utils }
RTSugiyamaLayout class >> sortBlock [
	
	^ RTSortBlock new
]

{ #category : #private }
RTSugiyamaLayout >> addDummyNodes [
	
	| layer layerNr |
	connections := RTIdentityMatrix new.
	self edgesDo:
			[:edge | 
			| a b span fromNode toNode |
			"edge hints removeAll."
			a := layerNrs at: edge from.
			b := layerNrs at: edge to.
			span := (a - b) abs.
			span = 1
				ifTrue:
					[connections
						at: edge from
						at: edge to
						put: true].	"Normal case where nodes are in adjacent layers"
			fromNode := edge from.
			[span > 1]
				whileTrue:
					[span := span - 1.
					layerNr := b + span.
					layer := layers at: layerNr.
					toNode := RTDummyNode
						on: edge
						slot: a - span.
					layer add: toNode.
					layerNrs at: toNode put: layerNr.
					connections at: fromNode at: toNode put: true.
					fromNode := toNode].
			(a - b) abs > 1
				ifTrue:
					[connections
						at: fromNode
						at: edge to
						put: true]]
]

{ #category : #private }
RTSugiyamaLayout >> assignLabels: aNodeCollection [ 
	"Initialize label dictionary"
	| label vertices parentLabels |
	labels := IdentityDictionary new.
	label := 1.	"Assign labels to the roots"
	(self rootNodesFor: aNodeCollection) do: 
		[ :node | 
		labels 
			at: node
			put: label.
		label := label + 1 ].	"Assign labels to the rest"
	[ labels keys size < aNodeCollection size ] whileTrue: 
		[ vertices := SortedCollection sortBlock: self sortBlock.
		aNodeCollection do: 
			[ :node | 
			(labels includesKey: node) ifFalse: 
				[ parentLabels := ((self parentsFor: node) collect: 
					[ :pn | 
					labels 
						at: pn
						ifAbsent: [ self maxFloat ] ]) asSortedCollection.
				parentLabels last ~= self maxFloat ifTrue: [ vertices add: node -> parentLabels ] ] ].
		labels 
			at: vertices first key
			put: label.
		label := label + 1 ]
]

{ #category : #private }
RTSugiyamaLayout >> buildLayers: g [
	
	| w layerNr u vertices vertex layer done |
	w := self maxFloat.
	u := OrderedCollection new.
	layers := IdentityDictionary new.
	layerNrs := IdentityDictionary new.	"Assign all nodes to layers"
	[g isEmpty]
		whileFalse:
			[vertices := g
				select:
					[:e | (self childrenFor: e) allSatisfy: [:node | u includes: node]].
			vertex := vertices detectMax: [:e | labels at: e].
			done := false.
			layerNr := 1.
			[done]
				whileFalse:
					[layer := layers
						at: layerNr
						ifAbsentPut: [OrderedCollection new].
					(layer size >= w
						or:
							[(self childrenFor: vertex) anySatisfy: [:n | (layerNrs at: n) >= layerNr]])
						ifTrue: [layerNr := layerNr + 1]
						ifFalse: [done := true]].
			layer add: vertex.
			layerNrs at: vertex put: layerNr.
			u add: vertex.
			g remove: vertex]
]

{ #category : #private }
RTSugiyamaLayout >> cl: layer u: u v: v [
	"Calculates cuv. Di Battista, chapter 9.2.2, page 283"
	
	| partnersOfU partnersOfV c partnersOfUIndex partnersOfVIndex layerNr |
	layerNr := layerNrs at: u.	":= layerNrs at: v"
	partnersOfU := (connections at: u)
		select: [:each | (layerNrs at: each) = (layerNr - 1)].
	partnersOfV := (connections at: v)
		select: [:each | (layerNrs at: each) = (layerNr - 1)].
	c := 0.
	partnersOfUIndex := partnersOfU collect: [:node | layer indexOf: node].
	partnersOfVIndex := partnersOfV collect: [:node | layer indexOf: node].
	partnersOfUIndex
		do:
			[:uIndex | partnersOfVIndex do: [:vIndex | vIndex < uIndex ifTrue: [c := c + 1]]].
	^c
]

{ #category : #'default attach points' }
RTSugiyamaLayout >> defaultAttachPoint [
	^ RTVerticalAttachPoint new
]

{ #category : #hook }
RTSugiyamaLayout >> doExecute: aNodeCollection [ 
	"Coffman-Graham-Layering. Di Battista Book, page 275, chapter, 9.2.1"
	self assignLabels: aNodeCollection.
	self buildLayers: aNodeCollection copy.
	self addDummyNodes.
	self reduceCrossing.
	self layoutAt: self verticalGap @ self horizontalGap
]

{ #category : #private }
RTSugiyamaLayout >> layoutAt: aPoint [
	
	| treeWidth layerKeys layer layerWidth horizontalPosition verticalPosition layerHeight |
	treeWidth := layers values
		inject: self maxFloat negated
		into:
			[:max :e | max max: (e sumNumbers: #width) + ((e size - 1) * self horizontalGap)].
	verticalPosition := self horizontalGap.	"For visual reasons NOT: self class verticalGap"
	layerKeys := layers keys asSortedCollection reverse.
	layerKeys
		do:
			[:aKey | 
			layer := layers at: aKey.
			layerWidth := (layer sum: #width)
				+ ((layer size - 1) * self horizontalGap).
			layerHeight := (layer detectMax: #height) height.
			horizontalPosition := treeWidth / 2.0 + aPoint x - (layerWidth / 2.0).
			layer
				do:
					[:node | 
					translator translateTopLeftOf: node to:  horizontalPosition @ verticalPosition.
					
					horizontalPosition := horizontalPosition + node width
						+ self horizontalGap ].
			verticalPosition := verticalPosition + layerHeight + self verticalGap ]
]

{ #category : #private }
RTSugiyamaLayout >> maxFloat [
	^ 1e10
]

{ #category : #private }
RTSugiyamaLayout >> reduceCrossing [
	"Crossing reduction"
	
	| layer2 u v c1 c2 layer1 done |
	2
		to: layers keys size
		do:
			[:index | 
			layer1 := layers at: index - 1.
			layer2 := layers at: index.
			done := false.
			[done]
				whileFalse:
					[done := true.
					2
						to: layer2 size
						do:
							[:i | 
							u := layer2 at: i - 1.
							v := layer2 at: i.
							c1 := self cl: layer1 u: u v: v.
							c2 := self cl: layer1 u: v v: u.
							c1 > c2
								ifTrue:
									[layer2 rtSwapElement: u withElement: v.
									done := false]]]]
]

{ #category : #private }
RTSugiyamaLayout >> sortBlock [
	
	sortBlock isNil ifTrue: [ sortBlock := self class sortBlock ].
	^sortBlock
]
