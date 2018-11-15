Class {
	#name : #LatticeTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-Lattice-Tests'
}

{ #category : #initialize }
LatticeTest >> initializeDataMammals [
	| data fca |
	data := #(#(#Cat #(#fourlegs #hair)) #(#Dog #(#fourlegs #hair)) #(#Dolphin #(#smart #marine)) #(#Gibbon #(#hair #smart #thumbed)) #(#Man #(#smart #thumbed)) #(#Whale #(#smart #marine))).
	fca := MalFormalContext new.
	^fca with: data using: #first using: #last.
]

{ #category : #initialize }
LatticeTest >> initializeDataMammals2 [
	| data fca |
	data := #(#(#Cat #(#fourlegs #hair)) #(#Dog #(#smart #fourlegs #hair)) #(#Dolphin #(#smart #marine)) #(#Gibbon #(#hair #smart #thumbed)) #(#Man #(#smart #thumbed)) #(#Whale #(#smart #marine))).
	fca := MalFormalContext new.
	^fca with: data using: #first using: #last.
]

{ #category : #initialize }
LatticeTest >> initializeHD [
	"lattice with horizontal decomposition"
	| data fca |
	data := #(#(#Cat #(#fourlegs #hair)) #(#Dog #(#fourlegs #hair)) #(#Dolphin #(#smart #marine)) #(#Gibbon #(#hair #thumbed)) #(#Man #(#hair #thumbed)) #(#Whale #(#smart #marine))).
	fca := MalFormalContext new.
	^fca with: data using: #first using: #last.
]

{ #category : #initialize }
LatticeTest >> initializeHD2 [
	"lattice with horizontal decomposition"
	| data fca |
	data := #(#(#Cat #(#fourlegs #hair)) #(#Dog #(#fourlegs #hair)) #(#Dolphin #(#smart #marine)) #(#Gibbon #(#hair #thumbed)) #(#Man #(#hair #thumbed)) #(#Whale #(#smart #marine)) #(#a #(#b #c))).
	fca := MalFormalContext new.
	^fca with: data using: #first using: #last.
]

{ #category : #tests }
LatticeTest >> testAllAncestors [
	"ancestors of a node"

	| lattice patterns |
	lattice := MalLattice on: self initializeDataMammals2.
	patterns := ModuleIdentification new lattice: lattice.
	self assert: (patterns allAncestors: (lattice nodes at: 2)) size equals: 2.
	self assert: (patterns allAncestors: (lattice nodes at: 3)) size equals: 1.
	self assert: (((patterns allAncestors: (lattice nodes at: 3)) at: 1) concept attributes at: 1) value equals: #smart
]

{ #category : #tests }
LatticeTest >> testComplexMammals2 [
	| lattice patterns |
	lattice := MalLattice on: self initializeDataMammals2.
	patterns := MalLatticePatterns on: lattice.
	self assert: (patterns isSuperConceptSpecialization: lattice top) not.
	self assert: patterns black size equals: 2.
	self assert: patterns grey size equals: 2.
	self assert: patterns full size equals: 3.
	self assert: patterns empty size equals: 3
]

{ #category : #tests }
LatticeTest >> testLatticeMammals [
	| lattice |
	lattice := MalLattice on: self initializeDataMammals.
	self assert: lattice nodes size equals: 8.
	self assert: lattice bottom concept numAttributes equals: 5.
	self assert: lattice top concept numObjects equals: 6.
	self assert: lattice nodes size equals: 8.
	self assert: (lattice top hasDescendant: lattice bottom).
	self assert: lattice bottom descendants isEmpty
]

{ #category : #tests }
LatticeTest >> testLatticePatterns [
	| lattice patterns |
	lattice := MalLattice on: self initializeDataMammals.
	patterns := MalLatticePatterns on: lattice.
	self assert: patterns full size equals: 3.
	self assert: patterns black size equals: 1.
	self assert: patterns grey size equals: 2.
	self assert: patterns empty size equals: 2.
	self assert: patterns isTopBlack equals: false.
	self assert: (patterns isEmpty: patterns lattice top).
	self assert: patterns isTopGrey equals: false.
	self assert: patterns isTopFull equals: false.
	self assert: patterns totalConnections equals: 10
]

{ #category : #tests }
LatticeTest >> testModule [
	| data fca context lattice modules |
	data := #(#(#a #()) #(#b #(1)) #(#c #(1 2)) #(#(#d) #(1 3)) #(#x #(1 5)) #(#(#e) #(1 2 3 5)) #(#(#f) #(1 2 3 4 5))).
	fca := MalFormalContext new.
	context := fca with: data using: #first using: #last.
	lattice := MalLattice on: context.
	modules := ModuleIdentification on: lattice.
	self assert: modules size equals: 1.
	self assert: modules first size equals: 5
]

{ #category : #tests }
LatticeTest >> testModule2 [
	| data fca context lattice modules |
	data := #(#(#a #()) #(#b #(1)) #(#c #(1 2)) #(#(#d) #(1 3)) #(#(#e) #(1 2 3)) #(#(#f) #(1 2 3 4))).
	fca := MalFormalContext new.
	context := fca with: data using: #first using: #last.
	lattice := MalLattice on: context.	"(MalLattice new viewLattice: lattice)."
	modules := ModuleIdentification on: lattice.
	self assert: modules size equals: 1.
	self assert: modules first size equals: 4
]

{ #category : #tests }
LatticeTest >> testPatternsHD [
	"Horizontal Decomposition lattice"

	| lattice patterns |
	lattice := MalLattice on: self initializeHD.
	patterns := MalLatticePatterns on: lattice.
	self assert: patterns horizontalDecomposition equals: 2.
	self assert: patterns isHorizontalDecomposition.
	self assert: patterns totalConnections equals: 7
]

{ #category : #tests }
LatticeTest >> testPatternsHD2 [
	"A lattice without Horizontal Decomposition"

	| lattice patterns |
	lattice := MalLattice on: self initializeDataMammals.
	patterns := MalLatticePatterns on: lattice.
	self assert: patterns isHorizontalDecomposition not.
	self assert: patterns horizontalDecomposition equals: 0
]

{ #category : #tests }
LatticeTest >> testPatternsHD3 [
	"Horizontal Decomposition lattice"

	| lattice patterns |
	lattice := MalLattice on: self initializeHD2.
	patterns := MalLatticePatterns on: lattice.
	self assert: patterns horizontalDecomposition equals: 3.
	self assert: patterns isHorizontalDecomposition.
	self assert: patterns totalConnections equals: 9
]

{ #category : #tests }
LatticeTest >> testPatternsSpecialization [
	"Irreducible specialization"

	| lattice patterns |
	lattice := MalLattice on: self initializeDataMammals.
	patterns := MalLatticePatterns on: lattice.
	self assert: (patterns isSuperConceptSpecialization: lattice top) not.
	self
		assert:
			(patterns isSuperConceptSpecialization: (patterns lattice nodes at: 2)).
	self
		assert: (patterns isSubConceptSpecialization: lattice bottom) not.
	self
		assert: (patterns isSubConceptSpecialization: (patterns lattice nodes at: 3)).
	self assert: patterns irreducibleSpecialization values size equals: 0
]
