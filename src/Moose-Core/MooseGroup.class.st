"
MooseGroup adds on top of an abstract group the ability to change the type of a group when we change the entities inside. This is determined via class names.

For example, a XYZGroup handles a group of XYZ entities. Thus, ""MooseGroup with: XYZ new"" will return a XYZGroup. The type changing behavior also works at runtime. Thus, ""MooseGroup new add: XYZ"" will also return a XYZGroup.

The goal of this abstraction is to provide a home for behavior that is specific to groups of entities. For example, a visualization that makes sense for a group of XYZ entities will become a method in the XYZGroup class.
"
Class {
	#name : #MooseGroup,
	#superclass : #MooseAbstractGroup,
	#category : #'Moose-Core'
}

{ #category : #meta }
MooseGroup class >> annotation [
	<FMClass: #Group super: #MooseAbstractGroup>
	<package: #Moose>

]

{ #category : #'instance creation' }
MooseGroup class >> new [ 
	 
	^self new: 5
]

{ #category : #'instance creation' }
MooseGroup class >> new: capacity [ 
	 
	^self basicNew initialize: capacity
]

{ #category : #'instance creation' }
MooseGroup class >> with: anEntity withDescription: aDescription [ 
	 
	^(self with: anEntity) description: aDescription
]

{ #category : #'instance creation' }
MooseGroup class >> withAll: collection [
	^ self = MooseGroup
		ifTrue: [ | wantedClass |
			wantedClass := collection commonSuperclass relatedGroupType.
			self withKnownType: wantedClass withAll: collection ]
		ifFalse: [ self withKnownType: self withAll: collection ]
]

{ #category : #'instance creation' }
MooseGroup class >> withAll: entities withDescription: aDescription [ 
	 
	^(self withAll: entities) description: aDescription
]

{ #category : #'instance creation' }
MooseGroup class >> withDescription: aDescription [ 
	 
	^self new description: aDescription
]

{ #category : #'instance creation' }
MooseGroup class >> withKnownType: anSTClass withAll: collection [ 
	^ (anSTClass new: collection size) initializeWithAll: collection
]

{ #category : #'adding/removing' }
MooseGroup >> , aGroup [
	^ (self copy) 
		addAll: aGroup; 
		yourself
]

{ #category : #'adding/removing' }
MooseGroup >> add: anElement [ 
	 
	super add: anElement. 
	self updateTypeAccordingToEntities.
	^ anElement 
]

{ #category : #'adding/removing' }
MooseGroup >> addAll: collection [ 
	 
	self entityStorage addAll: collection. 
	self updateTypeAccordingToEntities
]

{ #category : #private }
MooseGroup >> changeTypeTo: aSmalltalkClass [
	| group | 
	self class == aSmalltalkClass ifTrue: [^ self].

	group := aSmalltalkClass withDescription: self description. 
	group addAll: self entities. 
	self become: group
]

{ #category : #private }
MooseGroup >> changeTypeToDefaultType [
	self changeTypeTo: MooseGroup
]

{ #category : #enumerating }
MooseGroup >> collect: aBlock [
	^ self species withAll: (self entities collect: aBlock)
]

{ #category : #private }
MooseGroup >> commonEntitiesClass [ 
	 
	^self entityStorage commonSuperclass
]

{ #category : #'public interface' }
MooseGroup >> copyFrom: startIndex to: endIndex [ 
	| resultCollection result | 
	resultCollection := self entities copyFrom: startIndex to: endIndex.
	result := self species withAll: resultCollection. 
	^ result	
]

{ #category : #'public interface' }
MooseGroup >> distributionOverAGroupOfGroups: aGroupOfGroups [ 
	 
	| distribution | 
	distribution := 0. 
	aGroupOfGroups 
		do: 
			[:eachReferenceGroup |  
			| intersection | 
			intersection := self intersection: eachReferenceGroup. 
			distribution := distribution 
				+ (intersection size / eachReferenceGroup size)]. 
	^distribution
]

{ #category : #'public interface' }
MooseGroup >> encapsulationOfAGroupOfGroups: aGroupOfGroups [ 
	 
	| encapsulation | 
	self isEmpty ifTrue: [^0]. 
	encapsulation := 0. 
	aGroupOfGroups 
		do: 
			[:eachReferenceGroup |  
			| intersection | 
			intersection := self intersection: eachReferenceGroup. 
			encapsulation := intersection size / eachReferenceGroup size 
				* (intersection size / self size) + encapsulation]. 
	^encapsulation
]

{ #category : #'public interface' }
MooseGroup >> indexOf: anEntity [ 
	 
	^self entities indexOf: anEntity
]

{ #category : #'initialize-release' }
MooseGroup >> initialize: capacity [ 
	 
	self initialize. 
	self description: 'Group'
]

{ #category : #'initialize-release' }
MooseGroup >> initializeWithAll: aCollection [
	self entityStorage addAll: aCollection.
]

{ #category : #'public interface' }
MooseGroup >> max: aSymbolOrBlock [ 
	 
	^self 
		inject: (aSymbolOrBlock value: self first) 
		into: [:max :each | max max: (aSymbolOrBlock value: each)]
]

{ #category : #'public interface' }
MooseGroup >> min: aSymbolOrBlock [ 
	 
	^self 
		inject: (aSymbolOrBlock value: self first) 
		into: [:min :each | min min: (aSymbolOrBlock value: each)]
]

{ #category : #accessing }
MooseGroup >> mooseDescription [
	^ self mooseModel
		ifNil: [ FM3NullClass new ]
		ifNotNil: [ :model | model mooseDescriptionFor: self class ]
]

{ #category : #printing }
MooseGroup >> mooseDisplayStringOn: stream [
	stream 
			nextPutAll: self description; 
			space; 
			nextPut: $(; 
			print: self size;
			nextPut: $)
]

{ #category : #accessing }
MooseGroup >> name [

	^self privateState attributeAt: #privateDescription ifAbsent:[#group]
	
]

{ #category : #'public interface' }
MooseGroup >> noneSatisfy: aBlock [ 
	 
	^self entities noneSatisfy: aBlock
]

{ #category : #printing }
MooseGroup >> printOn: aStream [ 

	aStream 
		nextPutAll: self description; 
		space; 
		nextPut: $(; 
		print: self size; 
		space. 
	self isEmpty ifTrue: [aStream nextPutAll: 'entities']. 
	self size = 1 ifTrue: [aStream nextPutAll: self anyOne class name]. 
	self size > 1 ifTrue: [aStream nextPutAll: storage commonSuperclass name asEnglishPlural]. 
	aStream nextPut: $).
	
"	aStream nextPut: Character space.
	aStream nextPut: $(.
	self entities do: [:element | aStream print: element] separatedBy: [aStream space].
	aStream nextPut: $)
"	
]

{ #category : #enumerating }
MooseGroup >> reject: aBlock [
	^ self species withAll: (self entities reject: aBlock)
]

{ #category : #'adding/removing' }
MooseGroup >> remove: anItem [ 
	 
	self removeEntity: anItem. 
	self updateTypeAccordingToEntities
]

{ #category : #'adding/removing' }
MooseGroup >> removeAll: collection [ 
	 
	collection do: [:each | self removeEntity: each]. 
	self updateTypeAccordingToEntities
]

{ #category : #enumerating }
MooseGroup >> select: aBlock [
	^ self species withAll: (self entities select: aBlock)
]

{ #category : #'public interface' }
MooseGroup >> selectCover: aFraction forMetric: aSymbolOrBlock [
	"select biggest entities which cover aFraction of the metric property for the whole group. Useful to easily check the 80/20 rule for example:
		self selectCover: 0.80 forMetric: #numberOfLinesOfCode
	returns the entities which cover 80% of the code base in number of lines of code"
	
	| cutValue sorted tops sum i |
	self assert: (aFraction >= 0 and: [aFraction <= 1]).
	cutValue := (self sumNumbers: aSymbolOrBlock) * aFraction.
	sorted := self asSortedCollection: [:a :b | (aSymbolOrBlock value: a) > (aSymbolOrBlock value: b)].
	tops := OrderedCollection new.
	sum := 0. i := 1.
	[ sum < cutValue and: [ i <= self size ]]
		whileTrue: [
			tops add: (sorted at: i).
			sum := sum + (aSymbolOrBlock value: (sorted at: i)).
			i := i + 1].
	^ MoosePropertyGroup withAll: tops from: self using: aSymbolOrBlock
]

{ #category : #'public interface' }
MooseGroup >> selectEightyCoverForMetric: aSymbolOrBlock [

	^ self selectCover: 0.80 forMetric: aSymbolOrBlock 
]

{ #category : #'public interface' }
MooseGroup >> selectTop: aFraction forMetric: aSymbolOrBlock [
	"select top xx entities with highest metric value in the group. Useful to easily check the 80/20 rule.
	For example:
		self selectTop: 0.20 forMetric: #numberOfLinesOfCode
	returns the top 20% entities in number of lines of code"
	
	| topsSize sorted tops cutValue i |
	self assert: (aFraction >= 0 and: [aFraction <= 1]).
	topsSize := (self size * aFraction) ceiling. "number of entities to select"
	topsSize isZero ifTrue: [ ^ MooseGroup new ].
	sorted := self asSortedCollection: [:a :b | (aSymbolOrBlock value: a) > (aSymbolOrBlock value: b)].
	tops := sorted copyFrom: 1 to: topsSize.

	"We check whether next elements should be retrieved, because their value matches the one of the last element which made the cut."
	cutValue := aSymbolOrBlock value: (sorted at: topsSize).
	i := topsSize + 1.
	[ i <= sorted size and: [ (aSymbolOrBlock value: (sorted at: i)) = cutValue ]]
		whileTrue: [
			tops add: (sorted at: i).
			i := i + 1 ].
	^ MoosePropertyGroup withAll: tops from: self using: aSymbolOrBlock
]

{ #category : #'public interface' }
MooseGroup >> selectTopTwentyForMetric: aSymbolOrBlock [
	"Return the 20% top most methods for the metric aSymbolOrBlock"

	^ self selectTop: 0.20 forMetric: aSymbolOrBlock
]

{ #category : #'public interface' }
MooseGroup >> sort: aBlock [ 
	 
	self entities: (self entities sorted: aBlock)
]

{ #category : #'public interface' }
MooseGroup >> sorted: aBlock [
	^ self species withAll: (self entities sorted: aBlock)
]

{ #category : #private }
MooseGroup >> species [
	^ MooseGroup
]

{ #category : #properties }
MooseGroup >> sumOfPropertyNamed: aPropertyName [ 
	 
	^self 
		inject: 0 
		into: 
			[:sum :each |  
			sum 
				+ 
					(each 
						propertyNamed: aPropertyName 
						ifNil: [0])]
]

{ #category : #private }
MooseGroup >> updateTypeAccordingToEntities [
	| common wantedType class |
	common := self commonEntitiesClass.
	wantedType := common relatedGroupType.
	self name = wantedType ifTrue: [ ^ self ].
	class := MooseAbstractGroup allSubclasses 
		detect: [ :each | each name == wantedType name ]
		ifNone: [ ^ self changeTypeToDefaultType ].
	self changeTypeTo: class
]
