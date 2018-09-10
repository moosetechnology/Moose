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

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allAccesses [
	
	<navigation: 'All accesses'>
	^self allWithType: FamixTAccess 
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allAnnotationInstances [
	<navigation: 'All annotation instances'>
	<package: #Java>
	^ self allWithType: FamixTAnnotationInstance
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allAnnotationTypes [
	<navigation: 'All annotation types'>
	<package: #Java>
	^ self allWithType: FamixTAnnotationType
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allAttributes [
	
	<navigation: 'All attributes'>
	^self allWithType: FamixTAttribute 
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allCaughtExceptions [
	<navigation: 'All caught exceptions'>
	<package: #Java>
	^ self allWithType: FamixTCaughtException
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allClasses [
	<navigation: 'All classes'>
	^ self allWithSubTypesOf: FamixTClass ofGroupClass: FAMIXClassGroup
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allComments [
	
	<navigation: 'All comments'>
	^self allWithType: FamixTComment 
	
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allDeclaredExceptions [
	<navigation: 'All declared exceptions'>
	<package: #Java>
	^ self allWithType: FamixTDeclaredException
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allEnumValues [
	<navigation: 'All enum values'>
	<package: #Java>
	^ self allWithType: FamixTEnumValue 
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allEnums [
	<navigation: 'All enums'>
	<package: #Java>
	^ self allWithType: FamixTWithEnumValues  
]

{ #category : #'Famix-File' }
MooseAbstractGroup >> allFiles [
	<navigation: 'All files'>
	^ self allWithSubTypesOf: FamixTFile
]

{ #category : #'Famix-File' }
MooseAbstractGroup >> allFolders [
	<navigation: 'All folders'>
	^ self allWithSubTypesOf: FamixTFolder
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allFunctions [
	<navigation: 'All functions'>
	^ self allWithType: FamixTFunction
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allGlobalVariables [
	
	<navigation: 'All global variables'>
	^self allWithType: FamixTGlobalVariable 
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allImplicitVariables [
	
	<navigation: 'All implicit variables'>
	^self allWithType: FamixTImplicitVariable 
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allInheritanceDefinitions [
	
	<navigation: 'All inheritances'>
	^self allWithType: FamixTSubInheritance
	"TODO: FamixTSuperInheritance?" 
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allInvocations [
	
	<navigation: 'All invocations'>
	^self allWithType: FamixTInvocation 
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allLocalVariables [
	
	<navigation: 'All local variables'>
	^self allWithType: FamixTLocalVariable 
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allMethods [
	<navigation: 'All methods'>
	
	^ self allWithType: FamixTMethod
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allModelClasses [
	<navigation: 'All model classes'>

	^ self privateState cacheAt: 'All model classes'
		ifAbsentPut: [
			MooseGroup
				withAll: ((self allClasses reject: [:each | each isStub or: [each isInterface]]) )
				withDescription: 'All model classes' ]
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allModelMethods [
	<navigation: 'All model methods'>
	
	^ self privateState
		cacheAt: 'All model methods'
		ifAbsentPut: [ self allMethods reject: [ :each | each parentTypeIsStub ] ]
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allModelNamespaces [
	<navigation: 'All model namespaces'>

	^ self privateState cacheAt: 'All model namespaces'
		ifAbsentPut: [
			MooseGroup
				withAll: (self allNamespaces select: [:each | 
					each classes notEmpty and: [
						each classes anySatisfy: [:class | class isStub not]]])
				withDescription: 'All model namespaces' ]
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allModelPackages [
	<navigation: 'All model packages'>

	^ self privateState cacheAt: 'All model packages'
		ifAbsentPut: [
			MooseGroup
				withAll: ((self allPackages reject: [:each | each isStub]) sorted:
																		[:p1 :p2 | p1 name < p2 name] )
				withDescription: 'All model packages' ]
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allModelTypes [
	<navigation: 'All model types'>

	^ self privateState cacheAt: 'All model types'
		ifAbsentPut: [
			(self allTypes reject: [:each | each isStub ])
				description: 'All model types' ]
]

{ #category : #groups }
MooseAbstractGroup >> allModels [ 
	 "returns all known Models (be them MooseModels or of a subclass of it)"
	<navigation: 'All models'> 
	^self allWithSubTypesOf: MooseModel 
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allNamespaces [
	
	<navigation: 'All namespaces'>
	^self allWithSubTypesOf: FamixTNamespace 
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allPackages [
	
	<navigation: 'All packages'>
	^self allWithSubTypesOf: FamixTPackage 
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allParameterTypes [
	<navigation: 'All parameter types'>
	<package: #Java>
	^ self allWithType: FAMIXParameterType
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allParameterizableClasses [
	<navigation: 'All parameterizable classes'>
	<package: #Java>
	^ self allWithType: FamixTWithParameterizedTypes
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allParameterizedTypes [
	<navigation: 'All parameterized types'>
	<package: #Java>
	^ self allWithType: FamixTParameterizedType
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allParameters [
	
	<navigation: 'All parameters'>
	^self allWithType: FamixTParameter 
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allPrimitiveTypes [
	
	<navigation: 'All primitive types'>
	^(self allWithType: FAMIXPrimitiveType) sorted: [:a :b | a name < b name]; yourself
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allReferences [
	
	<navigation: 'All references'>
	^self allWithType: FamixTReference  
]

{ #category : #'public interface' }
MooseAbstractGroup >> allSatisfy: aBlock [ 
	 
	^self entities allSatisfy: aBlock
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allTestClasses [
	<navigation: 'All test classes'>
	<package: #Java>
	^ self allModelClasses select: #isTestCase
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allTestMethods [
	<navigation: 'All test methods'>
	<package: #Java>
	^ self allModelMethods select: [ :each | 
		(each respondsTo: #isJUnit4Test) and: [ each isJUnit4Test ]]
]

{ #category : #'Famix-Java' }
MooseAbstractGroup >> allThrownExceptions [
	<navigation: 'All thrown exceptions'>
	<package: #Java>
	^ self allWithType: FamixTThrownException
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allTypes [
	<navigation: 'All types'>
	^ self allWithSubTypesOf: FamixTType ofGroupClass: FAMIXTypeGroup
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> allUnknownVariables [
	
	<navigation: 'All unknown variables'>
	^self allWithType: FAMIXUnknownVariable 
]

{ #category : #groups }
MooseAbstractGroup >> allWithSubTypesOf: aSmalltalkClass [ 
	^ self allWithSubTypesOf: aSmalltalkClass ofGroupClass: MooseGroup 
]

{ #category : #groups }
MooseAbstractGroup >> allWithSubTypesOf: aSmalltalkClass ofGroupClass:  aGroupSmalltalkClass [
	^ self privateState cacheAt: aSmalltalkClass
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

{ #category : #'set operations' }
MooseAbstractGroup >> difference: aGroup [ 
	self subclassResponsibility
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

{ #category : #'set operations' }
MooseAbstractGroup >> intersection: aGroup [ 
	self subclassResponsibility
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
MooseAbstractGroup >> numberOfEntities [
	<MSEProperty: #numberOfEntities type: #Number>
	<MSEComment: 'The total number of entities (items that are not associations)'>
	^ self numberOfItems - self numberOfAssociations
]

{ #category : #accessing }
MooseAbstractGroup >> numberOfItems [ 
	<MSEProperty: #numberOfItems type: #Number>
	<MSEComment: 'The total number of items in the group'>
	
	^self size
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> numberOfLinesOfCode [
	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<MSEComment: 'The number of classes in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self allMethods sum: #numberOfLinesOfCode ]
]

{ #category : #'Famix-Extensions' }
MooseAbstractGroup >> numberOfPackages [
	<MSEProperty: #numberOfPackages type: #Number>
	<MSEComment: 'Total number of packages'>
	^ (self mooseModel isNotNil and: [ self mooseModel isSmalltalk ])
		ifTrue: [ self privateState propertyAt: #numberOfPackages ifAbsentPut: [ self allPackages size ] ]
		ifFalse: [ self privateState propertyAt: #numberOfPackages ifAbsentPut: [ self allNamespaces size ] ]
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

{ #category : #'set operations' }
MooseAbstractGroup >> union: aGroup [ 

	self subclassResponsibility

	"| result | 
	result := MooseGroup withAll: (self entities asSet union: aGroup entities asSet). 
	result description: self description , '  and ' , aGroup description. 
	^result"
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
