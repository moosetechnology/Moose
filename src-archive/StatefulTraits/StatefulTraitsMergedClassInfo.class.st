Class {
	#name : #StatefulTraitsMergedClassInfo,
	#superclass : #Object,
	#instVars : [
		'mergedClass',
		'traits',
		'slots',
		'instanceSideSelectors',
		'classSideSelectors'
	],
	#category : #StatefulTraits
}

{ #category : #'instance creation' }
StatefulTraitsMergedClassInfo class >> on: aClass [

	^ self new mergedClass: aClass;
		yourself.
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> addTrait: aTrait [

	self traits add: aTrait.
]

{ #category : #'events handling' }
StatefulTraitsMergedClassInfo >> classModified: anEvent [
	
	| cls |
	
	cls := anEvent classAffected.
	(self traits includes: cls instanceSide) ifTrue: [ 
		self cleanMergedClass; merge   ].
	
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> classSideSelectors [
	^ classSideSelectors
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> classSideSelectors: anObject [
	classSideSelectors := anObject
]

{ #category : #cleaning }
StatefulTraitsMergedClassInfo >> clean [

	self cleanMergedClass.

	slots := IdentitySet new.
	traits := IdentitySet new.
	instanceSideSelectors := IdentitySet new.
	classSideSelectors := IdentitySet new.
]

{ #category : #cleaning }
StatefulTraitsMergedClassInfo >> cleanMergedClass [

	slots do: [ :each |
		mergedClass slotNamed: each ifFound: [ :aSlot |
			mergedClass removeSlot: aSlot ] ].

	mergedClass protocols 
		select: [ :each | each beginsWith: '_fromTrait_' ] 
		thenDo: [ :each | mergedClass removeProtocol: each ].
		
	mergedClass classSide protocols 
		select: [ :each | each beginsWith: '_fromTrait_' ] 
		thenDo: [ :each | mergedClass classSide removeProtocol: each ].
]

{ #category : #initialization }
StatefulTraitsMergedClassInfo >> initialize [

	super initialize.
	
	traits := IdentitySet new.
	slots := IdentitySet new.
	traits := IdentitySet new.
	instanceSideSelectors := IdentitySet new.
	classSideSelectors := IdentitySet new.
	
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> instanceSideSelectors [
	^ instanceSideSelectors
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> instanceSideSelectors: anObject [
	instanceSideSelectors := anObject
]

{ #category : #merging }
StatefulTraitsMergedClassInfo >> merge [

	self traits do: [ :aTrait | self mergeTrait: aTrait ].
	self mergedClass compileAll.
]

{ #category : #merging }
StatefulTraitsMergedClassInfo >> mergeMethod: aMethod onClassSide: aBoolean [

	| newMethodSelector prefix tag className targetClass |
	
	(aMethod hasPragmaNamed: #ignoreInTraitUsers) ifTrue: [ ^ self ].
	
	className := aMethod methodClass instanceSide name.
	"TODO: smarter way of changing selectors"
	prefix := (aMethod selector = #initializeTrait)
		ifFalse: [ '' ]
		ifTrue: [ className, '_'  ].
		
	tag := '_fromTrait_', className.	
		
	targetClass := aBoolean 
		ifTrue: [ self mergedClass classSide ]
		ifFalse: [ self mergedClass ].
		
	newMethodSelector := targetClass compile: prefix, aMethod sourceCode classified: tag.
	instanceSideSelectors add: newMethodSelector.
]

{ #category : #merging }
StatefulTraitsMergedClassInfo >> mergeMethodsFrom: aTrait [

	(self traitsToMergeWith: aTrait) do: [ :traitToMerge |
		traitToMerge traitMethods do: [ :each | self mergeMethod: each onClassSide: false ].
		traitToMerge class localMethods do: [ :each | self mergeMethod: each onClassSide: true ]]
]

{ #category : #merging }
StatefulTraitsMergedClassInfo >> mergeSlot: aSlot [

	| newSlot |
	newSlot := aSlot copy.
	[(self mergedClass allSlots anySatisfy: [:slot | slot name = newSlot name]) 
		ifTrue: [ self mergedClass removeSlot: (self mergedClass slotNamed: newSlot name) ] ] ifError: [  ].
	(self mergedClass allSlots anySatisfy: [:slot | slot name = newSlot name]) 
		ifFalse: [ self mergedClass layout addSlot: newSlot ].
	self slots add: newSlot name.
	
	^ newSlot

]

{ #category : #merging }
StatefulTraitsMergedClassInfo >> mergeSlotsFrom: aTrait [

	(self traitsToMergeWith: aTrait) do: [ :traitToMerge |
		traitToMerge slots do: [ :each | self mergeSlot: each ] ]
	
]

{ #category : #merging }
StatefulTraitsMergedClassInfo >> mergeTrait: aTrait [

	self mergeSlotsFrom: aTrait.
	self mergeMethodsFrom: aTrait.
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> mergedClass [
	^ mergedClass
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> mergedClass: anObject [
	mergedClass := anObject
]

{ #category : #'events handling' }
StatefulTraitsMergedClassInfo >> methodAdded: anEvent [
	
	| method |
	
	method := anEvent method.
	(self traits includes: method methodClass instanceSide) ifTrue: [ 
		self mergeMethod: method onClassSide: (method methodClass isClassSide). ].
	
]

{ #category : #'events handling' }
StatefulTraitsMergedClassInfo >> methodModified: anEvent [
	
	| method |
	
	method := anEvent newMethod.
	(self traits includes: method methodClass instanceSide) ifTrue: [ 
		self mergeMethod: method onClassSide: (method methodClass isClassSide). ].
	
]

{ #category : #'events handling' }
StatefulTraitsMergedClassInfo >> methodRemoved: anEvent [
	
	| method |
	
	method := anEvent method.
	(self traits includes: method methodClass instanceSide) ifTrue: [ 
		method methodClass isClassSide
			ifFalse: [ mergedClass removeSelector: method selector ]
			ifTrue: [ mergedClass classSide removeSelector: method selector   ].].
	
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> slots [
	^ slots
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> slots: anObject [
	slots := anObject
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> traits [
	^ traits
]

{ #category : #accessing }
StatefulTraitsMergedClassInfo >> traits: anObject [
	traits := anObject
]

{ #category : #merging }
StatefulTraitsMergedClassInfo >> traitsToMergeWith: aTrait [

	^ (aTrait withAllSuperclasses copyWithoutAll: (self mergedClass withAllSuperclasses))
]
