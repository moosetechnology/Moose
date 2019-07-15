Class {
	#name : #DudeMultiplication,
	#superclass : #FAMIXEntity,
	#instVars : [
		'duplications'
	],
	#category : #'SmallDude-Core'
}

{ #category : #meta }
DudeMultiplication class >> annotation [
	<MSEClass: #Multiplication super: #FAMIXEntity>
	<package: #Dude>
]

{ #category : #'instance creation' }
DudeMultiplication class >> newFrom: aDuplication [ 
	 
	^(super new) 
		absorb: aDuplication; 
		yourself
]

{ #category : #'initialize-release' }
DudeMultiplication >> absorb: aDuplication [ 
	 
	self duplications add: aDuplication.
]

{ #category : #'initialize-release' }
DudeMultiplication >> absorbAll: aMultiplication [ 
	 
	self ~= aMultiplication 
		ifTrue: [self duplications addAll: aMultiplication duplications]
]

{ #category : #'public interface' }
DudeMultiplication >> allDuplications [ 
	<navigation: 'All Duplications of this multiplication'> 
	^DudeDuplicationGroup withAll: duplications withDescription: 'Duplications'
]

{ #category : #'public interface' }
DudeMultiplication >> allFiles [ 
	 
	<navigation: 'All files covered in this multiplication'> 
	| files | 
	files := OrderedCollection new. 
	self fragments 
		do: 
			[:fragment | (files indexOf: fragment entity) > 0 ifFalse: [files add: fragment entity]]. 
	^MooseGroup withAll: files withDescription: 'Duplicated entities'
]

{ #category : #accessing }
DudeMultiplication >> duplications [ 
	<MSEProperty: #duplications type: #DudeDuplication opposite: #multiplicationInvolved> <multivalued> <derived>
	<MSEComment: 'The duplications involved in the current multiplication'>

	duplications isNil ifTrue: [duplications := FMMultivalueLink 
		on: self
		opposite: #multiplicationInvolved:]. 
	^duplications
]

{ #category : #accessing }
DudeMultiplication >> fragments [ 
	 
	| fragments | 
	fragments := Set new. 
	self duplications 
		do: 
			[:dup |  
			fragments add: dup referenceCode. 
			fragments add: dup duplicateCode]. 
	^fragments asOrderedCollection
]

{ #category : #properties }
DudeMultiplication >> getNumberOfClones [ 
	 
	^self fragments size
]

{ #category : #properties }
DudeMultiplication >> getNumberOfFiles [ 
	 
	^self allFiles size
]

{ #category : #properties }
DudeMultiplication >> getNumberOfLines [ 
	 
	^self fragments 
		inject: 0 
		into: [:result :elem | result + elem fragmentLength]
]

{ #category : #accessing }
DudeMultiplication >> gtDisplayOn: stream [
	 
	| name | 
	name := ''. 
	self fragments 
		do: [:fragment | name := name , ' [' , fragment shortName , ']']. 
	stream nextPutAll: ('Instances:' , name)
]

{ #category : #query }
DudeMultiplication >> hasAny: prop withValue: val [ 
	 
	| res | 
	res := false. 
	self fragments 
		do: 
			[:fragm |  
			| propVal | 
			propVal := fragm entity privateState 
				propertyAt: prop 
				ifAbsent: [nil]. 
			propVal = val ifTrue: [res := true]]. 
	^res
]

{ #category : #testing }
DudeMultiplication >> isBetween: aGroup [ 
	 
	^self multiplyingEntities allSatisfy: [:each | aGroup includes: each]
]

{ #category : #testing }
DudeMultiplication >> isComplex [
	"A multiplication is complex if it has more than one duplication, or 
	if at least one entity also participates in another multiplication"
	^ (self duplications size > 1) or: [
		self multiplyingEntities anySatisfy: [:entity |
			entity allMultiplications size > 1 ]] 
]

{ #category : #testing }
DudeMultiplication >> isInternal [ 
	 
	^self duplications allSatisfy: #isSelfDuplication
]

{ #category : #testing }
DudeMultiplication >> isInternalTo: modelEntity [ 
	 
	^self duplications 
		allSatisfy: [:each | each isSelfDuplicationOf: modelEntity]
]

{ #category : #testing }
DudeMultiplication >> isMultiplicationOf: modelEntity [ 
	 
	^self duplications anySatisfy: [:each | each isDuplicationOf: modelEntity]
]

{ #category : #testing }
DudeMultiplication >> isMultiplicationOfOneOf: aGroup [ 
	 
	^self multiplyingEntities anySatisfy: [:each | aGroup includes: each]
]

{ #category : #testing }
DudeMultiplication >> isMultiplicationOfTwoOf: aGroup [ 
	 
	| count | 
	count := 0. 
	self multiplyingEntities 
		do: [:each | (aGroup includes: each) ifTrue: [count := count + 1]]. 
	^count > 1
]

{ #category : #accessing }
DudeMultiplication >> mooseNameOn: stream [
	stream nextPutAll: 'Multiplication:'.
	self fragments do: [:fragment | 
		stream 
			nextPutAll: ' [';
			nextPutAll: fragment shortName;
			nextPutAll:  ']']
]

{ #category : #accessing }
DudeMultiplication >> multiplyingEntities [ 
	 
	^(self fragments collect: #entity) asSet asOrderedCollection
]

{ #category : #properties }
DudeMultiplication >> numberOfClones [ 
	 <MSEProperty: #numberOfClones type: #Number>
	<derived>
	<MSEComment: 'The number of distinct file fragments that have been cloned'>

	^self 
		lookUpPropertyNamed: #numberOfClones 
		computedAs: [self getNumberOfClones]
]

{ #category : #properties }
DudeMultiplication >> numberOfFiles [ 
	<MSEProperty: #numberOfFiles type: #Number>
	<derived>
	<MSEComment: 'The number of distinct files covered in this multiplication'>

	^self 
		lookUpPropertyNamed: #numberOfFiles 
		computedAs: [self getNumberOfFiles]
]

{ #category : #properties }
DudeMultiplication >> numberOfLines [ 
	 <MSEProperty: #numberOfLines type: #Number>
	<derived>
	<MSEComment: 'The number of distinct file fragments that have been cloned'>

	^self 
		lookUpPropertyNamed: #numberOfLines 
		computedAs: [ self getNumberOfLines ]
]

{ #category : #accessing }
DudeMultiplication >> signature: sig [ 
	 
	self halt: 'not implemented'
]
