"
MalLattice on: MalFormalContext mammals2.

MalLattice new viewLattice: (MalLattice on: MalFormalContext mammals2)


| data fca context lattice |
	data := #(#(#Cat #(#fourlegs #hair)) #(#Dog #(#smart #fourlegs #hair)) #(#Dolphin #(#smart #marine)) #(#Gibbon #(#hair #smart #thumbed)) #(#Man #(#smart #thumbed)) #(#Whale #(#smart #marine))).
	fca := MalFormalContext new.
	context := fca with: data using: #first using: #last.
	MalLatticePatterns on: (MalLattice new viewLattice: (MalLattice on: context)) 
"
Class {
	#name : #MalLattice,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'layers'
	],
	#category : #'Moose-Algos-Lattice'
}

{ #category : #'instance creation' }
MalLattice class >> on: formalContext [
	| lattice |
	lattice := MalLattice new.
	^lattice onConstruct: formalContext
]

{ #category : #accessing }
MalLattice >> addNode: aNode [
	self findNode: aNode ifAbsent: (self nodes add: aNode)
]

{ #category : #enumerating }
MalLattice >> bottom [
	"Any node without descendants, and which is not a top is a bottom"

	"self nodes do: [:node | (node descendants isEmpty and: [node ~= self top]) ifTrue: [^node]]."

	^ layers last first
]

{ #category : #construction }
MalLattice >> computeLabels [ 
	"Starting from top node compute lables for all nodes according to the intent and extents of their dependendants, for each node having common attributes with descendant, keep that attribute ... push the common objects to the labels of the dependendants"
	1 to: layers size do: [:n | (layers at:n) do: [:aNode | aNode computeLabel]].
	"self bottom labels: {self bottom concept attributes}, {#()}"
]

{ #category : #construction }
MalLattice >> connectBottom [
	self nodes
		do: [ :node | 
			(node descendants isEmpty and: [ node ~= self bottom ])
				ifTrue: [ node addDescendant: self bottom ] ]
]

{ #category : #accessing }
MalLattice >> filterDescendants [
	"if I have a descendant that also appears as a descendant in my descendants, remove it from the set of my descendants"

	self nodes
		do: [ :node | node descendants do: [ :desc | (desc descendants intersection: node descendants) ifNotEmpty: [ :intersect | node removeDescendant: intersect asArray ] ] ]
]

{ #category : #construction }
MalLattice >> onConstruct: formalContext [
	formalContext concepts
		do: [:each | self addNode: (MalLatticeNode withNew: each)].
		layers := ((self nodes asArray groupedBy: #layer) associations sort: [ :a :b | a key < b key]) collect: #value.
		layers size - 1 to: 1 by: -1 do: [ :n |
		n + 1 to: layers size -1 do: [ :m |
			(layers at: n) do: [ :each |
				(layers at: m) do: [ :child |
					each maybeAppendChild: child ]]]].
	self filterDescendants.
	self connectBottom.
	self computeLabels.
]

{ #category : #enumerating }
MalLattice >> orphans [
	| allNodes diff nonEmptyDescendants nonOrphans |
	nonOrphans := OrderedCollection new.
	allNodes := self nodes asSet.
	nonEmptyDescendants := self nodes reject: [ :node | node descendants isEmpty ].
	nonOrphans := (nonEmptyDescendants flatCollect: [ :each | each descendants ]) asSet.
	diff := allNodes difference: nonOrphans.
	^ diff
]

{ #category : #enumerating }
MalLattice >> top [
	^ (layers at: 1) first
]
