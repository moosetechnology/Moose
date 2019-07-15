Class {
	#name : #StatefulTraitsMergedClassInfoTests,
	#superclass : #TestCase,
	#category : #'StatefulTraits-Tests'
}

{ #category : #reset }
StatefulTraitsMergedClassInfoTests >> reset [

	"self new reset"
	StatefulTraitsTestingMergedClass protocols 
		select: [ :each | each beginsWith: '_fromTrait_' ] 
		thenDo: [ :each | StatefulTraitsTestingMergedClass removeProtocol: each ].
		
	StatefulTraitsTestingMergedClass classSide protocols 
		select: [ :each | each beginsWith: '_fromTrait_' ] 
		thenDo: [ :each | StatefulTraitsTestingMergedClass classSide removeProtocol: each ].
			
	Object subclass: #StatefulTraitsTestingMergedClass
		slots: { #var1. #var2 }
		classVariables: {  }
		category: 'StatefulTraits-Tests'.
	

]

{ #category : #tests }
StatefulTraitsMergedClassInfoTests >> setUp [

	self reset
]

{ #category : #tests }
StatefulTraitsMergedClassInfoTests >> testEmpty [

	| info | 
	
	info := StatefulTraitsMergedClassInfo on: StatefulTraitsTestingMergedClass.
	self assert: info mergedClass equals: StatefulTraitsTestingMergedClass.
	self assert: info slots isEmpty.
	self assert: info traits isEmpty.

	
	
]

{ #category : #tests }
StatefulTraitsMergedClassInfoTests >> testMerge [

	| info c1 t1 |
	
	c1 := StatefulTraitsTestingMergedClass.
	t1 := StatefulTraitsTestingTrait1.
	
	self assert: StatefulTraitsTestingMergedClass slotNames sorted equals: #(var1 var2).
	self assert: StatefulTraitsTestingMergedClass localSelectors sorted equals: #(var1 var1: var2 var2:).
	self assert: StatefulTraitsTestingMergedClass classSide localSelectors isEmpty.
	
	
	info := StatefulTraitsMergedClassInfo on: c1.
	info addTrait: t1.
	info merge.
	
	self assert: StatefulTraitsTestingMergedClass slotNames sorted equals: #(director traitVar1 traitVar2 var1 var2).
	self assert: StatefulTraitsTestingMergedClass localSelectors sorted equals: #(StatefulTraitsTestingTrait1_initializeTrait
traitVar1
traitVar1:
traitVar2
traitVar2:
var1
var1:
var2
var2:).

	self assert: StatefulTraitsTestingMergedClass classSide localSelectors sorted equals: #(aClassSideMethod).
	
	

	
	
	
]
