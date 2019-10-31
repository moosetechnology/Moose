"
I implement a Metamodel generator visitor, aiming to give a UML code usable with plantUML (http://plantuml.com).

I accumulate in a stream the content you'll have to put in a file and run through plantUml.

subclass #MetamodelGenerator , and try me! (print the last line)

b :=  aMetamodelGeneratorSubClass builderWithDefinitions.
v :=  FmxMBPlantTextVisitor new.
b acceptVisitor: v.
v contents

"
Class {
	#name : #FmxMBPlantTextVisitor,
	#superclass : #FmxMBVisitor,
	#instVars : [
		'stream',
		'relations',
		'gatherTraits',
		'behaviors',
		'mergeTraits',
		'generalizationDefinitions',
		'typedProperties',
		'traitsWithUsers'
	],
	#category : #'Famix-MetamodelBuilder-Core-Visitors'
}

{ #category : #private }
FmxMBPlantTextVisitor >> behaviorNameOrNilFor: aBehavior [
	^ behaviors associations detect: [ :each | each value includes: aBehavior ] ifFound: [ :foundAssociation | foundAssociation key ] ifNone: [ nil ]
]

{ #category : #accessing }
FmxMBPlantTextVisitor >> behaviors [
	^ behaviors
]

{ #category : #visiting }
FmxMBPlantTextVisitor >> contents [

	^ stream contents
]

{ #category : #private }
FmxMBPlantTextVisitor >> ensureBehaviorNameFor: aBehavior [

	^ (self behaviorNameOrNilFor: aBehavior)
		ifNil: [ self registerNewBehavior: aBehavior ]
]

{ #category : #accessing }
FmxMBPlantTextVisitor >> gatherTraits [
	^ gatherTraits
]

{ #category : #accessing }
FmxMBPlantTextVisitor >> gatherTraits: anObject [
	gatherTraits := anObject
]

{ #category : #initialization }
FmxMBPlantTextVisitor >> initialize [
	super initialize.

	stream := '' writeStream.
	relations := IdentitySet new.
	gatherTraits := false.
	behaviors := Dictionary new.
	mergeTraits := true.
	generalizationDefinitions := OrderedCollection new.
	typedProperties := OrderedCollection new.
	traitsWithUsers := Set new
]

{ #category : #accessing }
FmxMBPlantTextVisitor >> mergeTraits [
	^ mergeTraits
]

{ #category : #accessing }
FmxMBPlantTextVisitor >> mergeTraits: anObject [
	mergeTraits := anObject
]

{ #category : #private }
FmxMBPlantTextVisitor >> mergeTrat: aTrait withBehaviorNamed: aBehaviorName [

	(behaviors at: aBehaviorName) add: aTrait.
	
	
	
]

{ #category : #private }
FmxMBPlantTextVisitor >> onlySingleUserOf: aTrait [
	^ ((aTrait builder classes select: #willGenerate)
		count: [ :aClass | 
			| traits |
			traits := aClass traitGeneralizations.
			traits size = 1 and: [ traits anyOne = aTrait ] ]) = 1
]

{ #category : #private }
FmxMBPlantTextVisitor >> registerNewBehavior: aBehavior [

	| key |

	key := 'behavior', (behaviors size + 1) asString.
	behaviors at: key put: (Set with: aBehavior).
	^ key
	
	
]

{ #category : #visiting }
FmxMBPlantTextVisitor >> selectTraitsWithUsersFrom: aBuilder [

	^ traitsWithUsers := aBuilder classes flatCollect: [:each | each traitGeneralizations] as: Set
]

{ #category : #visiting }
FmxMBPlantTextVisitor >> visitBuilder: aBuilder [
	stream
		nextPutAll: '@startuml';
		cr;
		cr;
		nextPutAll: 'hide empty members';
		cr;
		cr.

	self gatherTraits
		ifTrue: [ stream
				nextPutAll: 'together {';
				cr ].

	self selectTraitsWithUsersFrom: aBuilder.

	(aBuilder traits select: #willGenerate) do: [ :each | each acceptVisitor: self ].

	self gatherTraits
		ifTrue: [ stream
				nextPutAll: '}';
				cr ].

	aBuilder sortedClasses do: [ :each | each acceptVisitor: self ].

	self writeGeneralizations.
	self writeRelations.
	stream
		cr;
		nextPutAll: '@enduml';
		cr
]

{ #category : #visiting }
FmxMBPlantTextVisitor >> visitClass: aClass [

	| behaviorKey mergesTrait displayedName | 
	
	aClass willGenerate ifFalse: [ ^ self ].
	
	mergesTrait := self mergeTraits 
		and: [ aClass traitGeneralizations size = 1 
		and: [ self onlySingleUserOf: aClass traitGeneralizations first ]].
	
	displayedName := aClass name.

	mergesTrait	ifTrue: [ 
		(self behaviorNameOrNilFor:	aClass traitGeneralizations first)
				ifNil: [ behaviorKey := self ensureBehaviorNameFor: aClass.
					self mergeTrat: aClass traitGeneralizations first withBehaviorNamed: behaviorKey. ]
				ifNotNil: [ :key |
					behaviorKey := key.
					self mergeTrat: aClass withBehaviorNamed: behaviorKey. ].
	
	displayedName := displayedName, ' / ', aClass traitGeneralizations first name ]
	ifFalse: [ 
	behaviorKey := self ensureBehaviorNameFor: aClass].

	stream 
		nextPutAll: 'class ';
		nextPutAll: behaviorKey;
		nextPutAll: ' as "';
		nextPutAll: displayedName;
		nextPutAll: '" {'; cr.

	aClass properties do: [ :each | each acceptVisitor: self ].
	
	mergesTrait	ifTrue: [ 
		| defs |
		defs := typedProperties select: [ :each | each key = aClass traitGeneralizations first ].
		defs do: [ :assoc | 
			stream nextPutAll: assoc value ] ].

	stream nextPutAll: '}'; cr; cr.
	
	aClass classGeneralization ifNotNil: [ :generalization |
		generalizationDefinitions add: (generalization -> aClass)].
	
	mergesTrait ifFalse: [ 
		aClass traitGeneralizations ifNotEmpty: [ :generalizations |
			generalizations do: [ :generalization |
				generalizationDefinitions add: (generalization -> aClass)]]]
	
	
]

{ #category : #visiting }
FmxMBPlantTextVisitor >> visitRelationSide: aRelationSide [

	relations add: aRelationSide relation.

]

{ #category : #visiting }
FmxMBPlantTextVisitor >> visitTrait: aTrait [

	| behaviorKey |
	
	aTrait willGenerate ifFalse: [ ^ self ].
	
	(traitsWithUsers includes: aTrait) ifFalse: [ ^self ].
	
	((aTrait builder classes flatCollect: [:each | each traitGeneralizations]) includes: aTrait)
		ifFalse: [ ^ self ].

	behaviorKey := self ensureBehaviorNameFor: aTrait.
	
	(self onlySingleUserOf: aTrait) ifTrue: [ 
		| savedStream |
		savedStream := stream.
		stream := String new writeStream.
		aTrait properties do: [ :each | each acceptVisitor: self ].
		typedProperties add: (aTrait -> stream contents).
		stream := savedStream.
		^ self ].	

	stream nextPutAll: 'class ';
		nextPutAll: behaviorKey; 
		nextPutAll: ' as "';
		nextPutAll: aTrait name; 
		nextPutAll: '" << (T,orchid) >> {'; 
		cr.

	aTrait properties do: [ :each | each acceptVisitor: self ].

	stream nextPutAll: '}'; cr; cr.

]

{ #category : #visiting }
FmxMBPlantTextVisitor >> visitTypedProperty: aTypedProperty [

	stream 
		tab; 
		nextPutAll: '- '; 
		nextPutAll: aTypedProperty propertyType; 
		space; 
		nextPutAll: aTypedProperty name; 
		cr. 
]

{ #category : #relations }
FmxMBPlantTextVisitor >> writeGeneralizations [

	generalizationDefinitions do: [ :each| 
		
		(each key willGenerate and: [ each value willGenerate ])
			ifTrue: [  
				stream 
					nextPutAll: (self ensureBehaviorNameFor: each key);
					nextPutAll: ' <|-- ';
					nextPutAll: (self ensureBehaviorNameFor: each value);
					cr ]].
	stream cr.
	
]

{ #category : #relations }
FmxMBPlantTextVisitor >> writeRelations [

	| isContainer |

	relations do: [ :relation | 
		stream 
			nextPutAll: (self ensureBehaviorNameFor: relation from relatedEntity);
			nextPutAll:  ' "';
			nextPutAll: relation to name; 
			space; 
			nextPutAll: relation oppositeRelation shortCardinalityString; 
			space; 
			nextPutAll: '"'.
		
		isContainer := relation from isContainer or: [ relation to isContainer ].
		
		stream space.
		relation to isContainer 
			ifTrue: [ stream nextPutAll: 'o' ].

		isContainer 
			ifTrue: [ stream nextPutAll: '-[#red]-'. ]
			ifFalse: [ stream nextPutAll: '-[#black]-'. ].
		
		relation from isContainer 
			ifTrue: [ stream nextPutAll: 'o' ].
		stream space.
		
		stream 
			nextPutAll: '"';
			nextPutAll: relation from name;
			space; 
			nextPutAll: relation shortCardinalityString;
			space;
			nextPutAll: '" ';
			nextPutAll: (self ensureBehaviorNameFor: relation to relatedEntity); 
			cr]
	
]
