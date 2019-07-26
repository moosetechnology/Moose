"
AbstractGroup is an entity that offers the basic mechanism for managing multiple entities. It is also the superclass of MooseModel.

It stores the contained entities in a storage variable that points to a MooseGroupStorage strategy.


"
Class {
	#name : #MooseAbstractGroup,
	#superclass : #MooseEntity,
	#traits : 'TMooseGroupDependencyQueries',
	#classTraits : 'TMooseGroupDependencyQueries classTrait',
	#instVars : [
		'storage'
	],
	#category : #'Moose-Core'
}

{ #category : #meta }
MooseAbstractGroup class >> annotation [
	<MSEClass: #AbstractGroup super: #MooseEntity>
	<package: #Moose>
	<abstract>

]

{ #category : #'set operations' }
MooseAbstractGroup >> & aCollection [
	^ self intersection: aCollection
]

{ #category : #'set operations' }
MooseAbstractGroup >> \ aCollection [
	^ self difference: aCollection
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> add: anItem [ 

	self entityStorage add: anItem.
	self privateState flushGroups. 
	^ anItem
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> addAll: aCollectionOfItems [ 
	^ self subclassResponsibility
]

{ #category : #groups }
MooseAbstractGroup >> allModels [ 
	 "returns all known Models (be them MooseModels or of a subclass of it)"
	<navigation: 'All models'> 
	^self allWithSubTypesOf: MooseModel 
]

{ #category : #'public interface' }
MooseAbstractGroup >> allSatisfy: aBlock [ 
	 
	^self entities allSatisfy: aBlock
]

{ #category : #groups }
MooseAbstractGroup >> allWithSubTypesOf: aSmalltalkClass [ 
	^ self allWithSubTypesOf: aSmalltalkClass ofGroupClass: MooseGroup 
]

{ #category : #groups }
MooseAbstractGroup >> allWithSubTypesOf: aSmalltalkClass ofGroupClass:  aGroupSmalltalkClass [
	^ self privateState cacheAt: 'sub', aSmalltalkClass className
		ifAbsentPut: [
			aGroupSmalltalkClass 
				withAll: (aSmalltalkClass withMooseSubclasses flatCollect: [:each |
		self entityStorage selectAllWithType: each ])
				withDescription: 'All ' , aSmalltalkClass name asLowercase asEnglishPlural]
]

{ #category : #groups }
MooseAbstractGroup >> allWithType: aSmalltalkClass [ 
	^ self allWithType: aSmalltalkClass ofGroupClass: MooseGroup 
]

{ #category : #groups }
MooseAbstractGroup >> allWithType: aSmalltalkClass ofGroupClass: aGroupSmalltalkClass [
	^ self privateState 
		cacheAt: aSmalltalkClass
		ifAbsentPut: [
			aGroupSmalltalkClass 
				withAll: (self entityStorage selectAllWithType: aSmalltalkClass)
				withDescription: 'All ' , aSmalltalkClass name asLowercase asEnglishPlural ]
]

{ #category : #accessing }
MooseAbstractGroup >> anyOne [
	 
	^self entities anyOne
]

{ #category : #'public interface' }
MooseAbstractGroup >> anySatisfy: aBlock [ 
	 
	^self entities anySatisfy: aBlock
]

{ #category : #converting }
MooseAbstractGroup >> asArray [ 
	 
	^self entityStorage asArray
]

{ #category : #converting }
MooseAbstractGroup >> asBag [
	^ self entityStorage asBag
]

{ #category : #converting }
MooseAbstractGroup >> asMooseGroup [ 
	^ self 
]

{ #category : #converting }
MooseAbstractGroup >> asOrderedCollection [ 
	^ self entityStorage asOrderedCollection
]

{ #category : #converting }
MooseAbstractGroup >> asSet [ 
	^ self entityStorage asSet
]

{ #category : #converting }
MooseAbstractGroup >> asSortedCollection [
	^ self entityStorage asSortedCollection
]

{ #category : #converting }
MooseAbstractGroup >> asSortedCollection: aSortBlock [
	^ self entityStorage asSortedCollection: aSortBlock 
]

{ #category : #accessing }
MooseAbstractGroup >> at: anIndex [
	^ self entities at: anIndex
]

{ #category : #enumerating }
MooseAbstractGroup >> collect: aBlock [ 
	^ self entities collect: aBlock
]

{ #category : #enumeration }
MooseAbstractGroup >> collect: aBlock as: aClass [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into an instance of aClass. Answer the resulting collection."

	^ (aClass new: self size) fillFrom: self with: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> collect: collectBlock thenReject: selectBlock [
	"Utility method to improve readability."

	^ (self collect: collectBlock) reject: selectBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> collectAsSet: aBlock [
	^ self entities collectAsSet: aBlock
]

{ #category : #accessing }
MooseAbstractGroup >> commonSuperclass [ 
	^ self entityStorage commonSuperclass
]

{ #category : #enumerating }
MooseAbstractGroup >> contains: aBlock [ 
	 
	^self entities contains: aBlock
]

{ #category : #copying }
MooseAbstractGroup >> copyWithout: anEntity [ 
	^ self entities copyWithout: anEntity
]

{ #category : #enumerating }
MooseAbstractGroup >> count: aBlock [ 
	 
	| count | 
	count := 0. 
	self do: [:each | (aBlock value: each) ifTrue: [count := count + 1]]. 
	^count
]

{ #category : #enumerating }
MooseAbstractGroup >> detect: aBlock [ 
	 
	^self entities detect: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> detect: aBlock ifNone: anotherBlock [ 
	 
	^self entities detect: aBlock ifNone: anotherBlock
]

{ #category : #'entity collection' }
MooseAbstractGroup >> difference: aCollection [
	^ self species withAll: (self entities difference: aCollection)
]

{ #category : #enumerating }
MooseAbstractGroup >> do: aBlock [ 
	 
	^self entityStorage do: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> do: elementBlock separatedBy: separatorBlock [
	^ self entities do: elementBlock separatedBy: separatorBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> doWithIndex: aBlockClosure [ 
	self entities doWithIndex: aBlockClosure 
]

{ #category : #'reflective operations' }
MooseAbstractGroup >> doesNotUnderstand: aMessage [
	"Forward message to collection"

	^ [ aMessage sendTo: self entities ]
		on: MessageNotUnderstood
		do: [ super doesNotUnderstand: aMessage ]
]

{ #category : #'entity collection' }
MooseAbstractGroup >> entities [
	^ self entityStorage elements
]

{ #category : #'entity collection' }
MooseAbstractGroup >> entities: aCollection [ 
	 
	self entityStorage removeAll. 
	self addAll: aCollection	"	aCollection do: [:each | self addEntity: each ]."
]

{ #category : #'entity collection' }
MooseAbstractGroup >> entitiesDo: aBlock [ 
	 
	^self entityStorage do: aBlock	"self entityDictionary keysAndValuesDo: [ :key :group | 
		group do: aBlock 
	]."
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aSymbol [ 
	 
	^self 
		entityNamed: aSymbol 
		ifAbsent: [nil]
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aMooseName ifAbsent: aBlock [ 
	^ self entityStorage at: aMooseName ifAbsent: aBlock
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aMooseName ifAbsent: aBlock ifPresent: anotherBlock [
	| entity |
	entity := self entityStorage at: aMooseName ifAbsent: [nil].
	^ entity isNil 
		ifTrue: [aBlock value]
		ifFalse: [anotherBlock value: entity]
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aMooseName ifAbsentPut: aValue [ 
	^ self entityNamed: aMooseName ifAbsent: [self add: aValue]
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aSymbol withType: aFamixType [
	 
	^self 
		entityNamed: aSymbol 
		withType: aFamixType
		ifAbsent: [nil]
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aMooseName withType: aFamixType ifAbsent: aBlock [
	^ self entityStorage at: aMooseName withType: aFamixType ifAbsent: aBlock
]

{ #category : #private }
MooseAbstractGroup >> entityStorage [ 
	 
	^storage
]

{ #category : #testing }
MooseAbstractGroup >> equalsTo: aCollection [
	^ self entities equalsTo: aCollection
]

{ #category : #accessing }
MooseAbstractGroup >> first [ 
	 
	^self entities first
]

{ #category : #enumerating }
MooseAbstractGroup >> first: n [
	^ self entities first: n
]

{ #category : #enumerating }
MooseAbstractGroup >> flatCollect: aBlock [ 
	^ (self entities flatCollect: aBlock) asMooseGroup
]

{ #category : #enumerating }
MooseAbstractGroup >> flatCollectAsSet: aBlock [ 
	^ (self entities flatCollectAsSet: aBlock) asMooseGroup
]

{ #category : #flattening }
MooseAbstractGroup >> flatten [
	"Recursively collect each non-collection element of the receiver and its descendant
	collections.  Please note, this implementation assumes that strings are to be treated
	as objects rather than as collection."

	^self gather: [ :each | each ]
]

{ #category : #enumerating }
MooseAbstractGroup >> gather: aBlock [
	"This method is kept for compatibility reasons, use flatCollect instead."
	^ self flatCollect: aBlock.
]

{ #category : #enumerating }
MooseAbstractGroup >> groupedBy: aBlock [ 
	"we are reimplementing this method here and not reuse the one in collection
	because we want the keys to be groups, not simple collections"
	| result |
	result := Dictionary new.
	self do:
		[:each | | key collection |
		key := aBlock value: each.
		collection := result at: key ifAbsentPut: [OrderedCollection new].
		collection add: each].
	result keysAndValuesDo:
			[:key :value | result at: key put: (self species withAll: value)].

	^result
]

{ #category : #testing }
MooseAbstractGroup >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [
	self isEmpty
		ifTrue: [ ^ emptyBlock value ].
	^ notEmptyBlock cull: self
]

{ #category : #testing }
MooseAbstractGroup >> ifNotEmpty: aBlock [
	^ self isEmpty
		ifTrue: [ self ]
		ifFalse: [ aBlock cull: self ]
]

{ #category : #testing }
MooseAbstractGroup >> includes: anEntity [ 
	 
	^self entities includes: anEntity
]

{ #category : #testing }
MooseAbstractGroup >> includesAll: aCollection [ 
	^ self entities includesAll: aCollection
]

{ #category : #testing }
MooseAbstractGroup >> includesAllOf: aCollection [ 
	^ self entities includesAll: aCollection
]

{ #category : #'entity collection' }
MooseAbstractGroup >> includesID: elementID [ 
	 
	^self entityStorage includesID: elementID
]

{ #category : #'initialize-release' }
MooseAbstractGroup >> initialize [ 
	 
	super initialize.
	storage := MooseGroupStorage empty
]

{ #category : #enumerating }
MooseAbstractGroup >> inject: neutral into: aBinaryBlock [ 
	 
	^self entities inject: neutral into: aBinaryBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> insertInto: aSequenceableCollection from: anInteger to: anotherInteger [ 
	^ self entities insertInto: aSequenceableCollection from: anInteger to: anotherInteger
]

{ #category : #'set operations' }
MooseAbstractGroup >> intersect: aGroup [ 
	self deprecated: 'use intersection: instead, as it is polymorphic with the Collection protocol'.
	^ self intersection: aGroup 
]

{ #category : #'entity collection' }
MooseAbstractGroup >> intersection: aCollection [
	^ self species withAll: (self entities intersection: aCollection)
]

{ #category : #testing }
MooseAbstractGroup >> isCollection [ 
	 
	^true
]

{ #category : #testing }
MooseAbstractGroup >> isEmpty [ 
	 
	^self entityStorage isEmpty
]

{ #category : #testing }
MooseAbstractGroup >> isNotEmpty [
	"Answer whether the receiver contains any elements."

	^ self isEmpty not
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> javaEntityNamed: aSymbol [ 
	 
	^self 
		javaEntityNamed: aSymbol 
		ifAbsent: [nil]
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> javaEntityNamed: aMooseName ifAbsent: aBlock [
	^ self entityStorage
		at: aMooseName
		ifAbsent: [ self entityStorage at: '<Default Package>::' , aMooseName ifAbsent: aBlock ]
]

{ #category : #accessing }
MooseAbstractGroup >> last [ 
	 
	^self entities last
]

{ #category : #enumerating }
MooseAbstractGroup >> last: n [
	^ self entities last: n
]

{ #category : #enumerating }
MooseAbstractGroup >> maxValue: aBlock [
	^ self entities maxValue: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> minValue: aBlock [
	^ self entities minValue: aBlock
]

{ #category : #accessing }
MooseAbstractGroup >> mooseModel [
	^ self ifEmpty: [ nil ] ifNotEmpty: [ self anyOne mooseModel ]
]

{ #category : #accessing }
MooseAbstractGroup >> mooseModel: anObject [ 
	 
	self shouldNotImplement
]

{ #category : #testing }
MooseAbstractGroup >> notEmpty [ 
	 
	^self entities notEmpty
]

{ #category : #accessing }
MooseAbstractGroup >> numberOfItems [ 
	<MSEProperty: #numberOfItems type: #Number>
	<MSEComment: 'The total number of items in the group'>
	
	^self size
]

{ #category : #enumerating }
MooseAbstractGroup >> occurrencesOf: anObject [ 
	 
	^self entities occurrencesOf: anObject
]

{ #category : #copying }
MooseAbstractGroup >> postCopy [  
	super postCopy.
	storage := storage copy. 
]

{ #category : #printing }
MooseAbstractGroup >> printOn: aStream [ 
	 
	super printOn: aStream. 
	aStream nextPut: $(. 
	aStream nextPutAll: self size printString. 
	aStream nextPut: $)
]

{ #category : #enumerating }
MooseAbstractGroup >> reject: aBlock [ 
	 
	^self entities reject: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> reject: rejectBlock thenCollect: collectBlock [
	^ (self reject: rejectBlock) collect: collectBlock
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> remove: anItem [ 
	 
	^self subclassResponsibility
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> removeAll: aCollection [ 
	 
	^self subclassResponsibility
]

{ #category : #'entity collection' }
MooseAbstractGroup >> removeEntity: anEntity [ 
	 
	^self entityStorage remove: anEntity
]

{ #category : #loading }
MooseAbstractGroup >> resetMooseNameFor: anEntity [ 
	self entityStorage resetMooseNameFor: anEntity.
	" this is safe, but probably a bit overdone "
	self privateState flushGroups
]

{ #category : #accessing }
MooseAbstractGroup >> second [ 
	 
	^self entities second
]

{ #category : #enumerating }
MooseAbstractGroup >> select: aBlock [ 
	 
	^self entities select: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> selectFirst: anInteger [ 
	 
	self flag: #patched. "VW uses sliceTo:, which is a copyFrom:To: with checked indices. Not the case here"
	^self class withAll: (self entities copyFrom: 1 to: anInteger)
]

{ #category : #enumerating }
MooseAbstractGroup >> selectWithNameSimilarTo: anEntity [
	^ self select: [:each | 
		each ~= anEntity and: [
			(each name pairsSimilarityWith: anEntity name) > 0.5]]
]

{ #category : #accessing }
MooseAbstractGroup >> size [	 
	^ self entityStorage size
]

{ #category : #arithmetic }
MooseAbstractGroup >> sumNumbers: aBlockClosure [ 
	^ self entities sumNumbers: aBlockClosure 
]

{ #category : #accessing }
MooseAbstractGroup >> third [ 
	 
	^self entities third
]

{ #category : #'entity collection' }
MooseAbstractGroup >> union: aCollection [
	^ self species withAll: (self entities union: aCollection)
]

{ #category : #enumerating }
MooseAbstractGroup >> with: aCollection do: aBlockClosure [ 
	^self entities with: aCollection do: aBlockClosure 
]

{ #category : #enumerating }
MooseAbstractGroup >> withIndexDo: aBlockClosure [ 
	self entities withIndexDo: aBlockClosure 
]

{ #category : #'set operations' }
MooseAbstractGroup >> | aCollection [
	^ self union: aCollection
]
