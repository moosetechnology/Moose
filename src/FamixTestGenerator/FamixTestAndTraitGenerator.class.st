"
This class enables to generate tests for FamixTrait based on slots.


How to use it:
fttg := FamixTestAndTraitGenerator   new.
fttg runForAllClassesWith: FamixGenerator . ""the parameter is a generator""

"
Class {
	#name : #FamixTestAndTraitGenerator,
	#superclass : #FamixTestGenerator,
	#category : #FamixTestGenerator
}

{ #category : #'generate for FMMany slot' }
FamixTestAndTraitGenerator >> computeAddMethodNameFrom: aSlot [
	| normalizedName pieces lowerCasePieces |
	pieces := aSlot name cutCamelCase.
	lowerCasePieces := OrderedCollection new.
	pieces do: [ :e | lowerCasePieces add: e asLowercase  ].
	pieces removeAll.
	normalizedName := aSlot name.
	( lowerCasePieces includes: 'children' ) ifTrue: [ lowerCasePieces := lowerCasePieces copyReplaceAll: {'children'}  with: {'child'}. 
		normalizedName := (String streamContents: [ :aStream | 
	lowerCasePieces do: [:element | aStream nextPutAll: element asCamelCase] ]).
		normalizedName := normalizedName copyReplaceAll: normalizedName first asCollection  with: normalizedName first asLowercase asCollection  ].
	(normalizedName endsWith: 'sses')
		ifTrue: [ normalizedName := normalizedName withoutSuffix: 'es' ]
		ifFalse: [ (normalizedName endsWith: 'ies')
				ifTrue: [ normalizedName := (normalizedName withoutSuffix: 'ies') , 'y' ]
				ifFalse: [ normalizedName := normalizedName withoutSuffix: 's' ] ].
	^ 'add' , normalizedName capitalized, ':'
]

{ #category : #accessing }
FamixTestAndTraitGenerator >> createTraitOfTestFor: aClass [
	traitTest := Trait
		named: (self traitNameFrom: aClass)
		uses: TFamixTest
		slots: (self generateSlotsOfTraitOfTestFor: aClass) asArray
		package: self generator prefix, '-Tests-Traits'
]

{ #category : #'generate for FMMany slot' }
FamixTestAndTraitGenerator >> generateCodeForAddingSlotInCollection: traitSlotName1 for: aSlot [ 
	| method |
	method := aSlot owningClass methodDict detect: [ :s | (s selector beginsWith: ('add')) and: [ ((s ast allChildren select: #isMessage) anySatisfy: [ :node | node selector = aSlot name ]) or: [ (s ast allChildren select:#isVariable) 
		anySatisfy: [ :node | node binding name == aSlot name ] ]]  ] ifNone: [1halt. 'addXXX' ] .
	^ 'self entity ', method selector , ' ',  traitSlotName1 , '.'
]

{ #category : #'generate for FMMany slot' }
FamixTestAndTraitGenerator >> generateCodeForEmptyCollectionAssertion: aSlot [
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestEmptyCollectionNameFrom: aSlot);
		nextPutAll: '
			self assert: (self entity ';
		nextPutAll: aSlot name;
		nextPutAll:
			' isEmpty)'].
]

{ #category : #'generate for FMMany slot' }
FamixTestAndTraitGenerator >> generateCodeForFMManySlotAssertions: aSlot [

	
	"Example of what we want to generate
	self assert: (self entity methods notEmpty).
	self assertCollection: self entity methods hasSameElements: { method1. method2 }.
	self assert: method1 parentType equals: entity."
	^  String streamContents: [ :aStream | aStream 
		nextPutAll: 'self assert: (self entity ';
		nextPutAll: aSlot name;
		nextPutAll: ' notEmpty).';
		cr;
		nextPutAll: 'self assertCollection: self entity ';
		nextPutAll: aSlot name;
		nextPutAll: ' hasSameElements: {  ';
		nextPutAll: (self generateSlotNameOfTestTraitFrom: aSlot) asString , '1';
		nextPutAll: '. ' ;
		nextPutAll: (self generateSlotNameOfTestTraitFrom: aSlot) asString , '2';
		nextPutAll: ' }.';
		cr;
		nextPutAll: (self generateCodeForFMManySlotOppositeAssertion: aSlot)].
	

]

{ #category : #'generate for FMMany slot' }
FamixTestAndTraitGenerator >> generateCodeForFMManySlotInitialization: aSlot [
	| traitSlotName1 traitSlotName2 | 
	"Example of what we want to generate
	method1 := MooseEntity new copyWithTalent: FamixTMethod.
	method1 class initializeSlots: method1.
	model add: method1.
	method2 := MooseEntity new copyWithTalent: FamixTMethod.
	method2 class initializeSlots: method2.
	model add: method2.
	self entity addMethod: method1.
	self entity addMethod: method2."
	traitSlotName1 := (self generateSlotNameOfTestTraitFrom: aSlot) asString , '1'.
	traitSlotName2 := (self generateSlotNameOfTestTraitFrom: aSlot) asString , '2'.
	^ String streamContents: [ :aStream | aStream nextPutAll:  traitSlotName1 ;
		nextPutAll: ' := MooseEntity new copyWithTalent: ';
		nextPutAll: aSlot targetClass name  ;
		nextPutAll: '.';
		cr;
		nextPutAll: traitSlotName1 ;
		nextPutAll: ' class initializeSlots: ';
		nextPutAll: traitSlotName1 ;
		nextPutAll: '.';
		cr;
		nextPutAll: 'model add: ';
		nextPutAll: traitSlotName1 ;
		nextPutAll: '.';
		cr;
		nextPutAll:  traitSlotName2 ;
		nextPutAll: ' := MooseEntity new copyWithTalent: ';
		nextPutAll: aSlot targetClass name  ;
		nextPutAll: '.';
		cr;
		nextPutAll: traitSlotName2 ;
		nextPutAll: ' class initializeSlots: ';
		nextPutAll: traitSlotName2 ;
		nextPutAll: '.';
		cr;
		nextPutAll: 'model add: ';
		nextPutAll: traitSlotName2 ;
		nextPutAll: '.';
		cr;
		nextPutAll: (self generateCodeForAddingSlotInCollection: traitSlotName1 for: aSlot);
		cr;
		nextPutAll: (self generateCodeForAddingSlotInCollection: traitSlotName2 for: aSlot) ]
]

{ #category : #'generate for FMMany slot' }
FamixTestAndTraitGenerator >> generateCodeForFMManySlotOppositeAssertion: aSlot [
| oppositeSlot |
	oppositeSlot := aSlot targetClass slots detect: [ :s | s name = aSlot inverseName ].
	(oppositeSlot isKindOf: FMOne) 
	ifTrue: [ ^ String streamContents: [ :aStream | aStream    nextPutAll: 'self assert: ';
		nextPutAll: (self generateSlotNameOfTestTraitFrom: aSlot);
		nextPutAll: '1 ';
		nextPutAll: aSlot inverseName ;
		nextPutAll: ' equals: self entity'] ]
	ifFalse: [ ^ String streamContents: [ :aStream | aStream    nextPutAll: 'self assertCollection: ';
		nextPutAll: (self generateSlotNameOfTestTraitFrom: aSlot);
		nextPutAll: '1 ';
		nextPutAll: aSlot inverseName ;
		nextPutAll: ' hasSameElements: {self entity}'] ]
	

	

]

{ #category : #'generate for FMOne slot' }
FamixTestAndTraitGenerator >> generateCodeForFMOneSlotAssertions: aSlot [
	"Example of what we want to generate
	self assert: (self entity accessor notNil).
	self assert: self entity accessor equals: access.
	self assertCollection: withAccess accesses hasSameElements: { entity }  "
	^  String streamContents: [ :aStream | aStream 
		nextPutAll: 'self assert: (self entity ';
		nextPutAll: aSlot name;
		nextPutAll: ' notNil).';
		cr;
		nextPutAll: 'self assert: self entity ';
		nextPutAll: aSlot name;
		nextPutAll: ' equals: ';
		nextPutAll: aSlot name;
		nextPutAll: '.' ;
		cr;
		nextPutAll: (self generateCodeForFMOneSlotOppositeAssertion: aSlot)].
	

]

{ #category : #'generate for FMOne slot' }
FamixTestAndTraitGenerator >> generateCodeForFMOneSlotInitialization: aSlot [
	| traitSlotName | 
	"Example of what we want to generate
	access := MooseEntity new copyWithTalent: FamixTWithAccesses.
	access class initializeSlots: access.
	model add: access.
	self entity accessor: access."
	traitSlotName := aSlot name asString.
	^ String streamContents: [ :aStream | aStream nextPutAll:  traitSlotName ;
		nextPutAll: ' := MooseEntity new copyWithTalent: ';
		nextPutAll: aSlot targetClass name  ;
		nextPutAll: '. ';
		cr;
		nextPutAll: traitSlotName ;
		nextPutAll: ' class initializeSlots: ';
		nextPutAll: traitSlotName ;
		nextPutAll: '.';
		cr;
		nextPutAll: 'model add: ';
		nextPutAll: traitSlotName ;
		nextPutAll: '.';
		cr;
		nextPutAll: 'self entity ';
		nextPutAll: aSlot name;
		nextPutAll: ': ';
		nextPutAll: traitSlotName ;
		nextPutAll: '. ']
]

{ #category : #'generate for FMOne slot' }
FamixTestAndTraitGenerator >> generateCodeForFMOneSlotOppositeAssertion: aSlot [
	| oppositeSlot |
	oppositeSlot := aSlot targetClass slots detect: [ :s | s name = aSlot inverseName ].
	(oppositeSlot isKindOf: FMOne) 
	ifTrue: [ ^ String streamContents: [ :aStream | aStream    nextPutAll: 'self assert: ';
		nextPutAll: aSlot name;
		nextPutAll: ' ';
		nextPutAll: aSlot inverseName ;
		nextPutAll: ' equals: self entity'] ]
	ifFalse: [ ^ String streamContents: [ :aStream | aStream    nextPutAll: 'self assertCollection: ';
		nextPutAll: aSlot name;
		nextPutAll: ' ';
		nextPutAll: aSlot inverseName ;
		nextPutAll: ' hasSameElements: {self entity}'] ]
	

]

{ #category : #'generate for primitive slot' }
FamixTestAndTraitGenerator >> generateCodeForPrimitiveSlotAssertions: aSlot [ 
	"Example of what we want to generate
	self assert: (self entity isWrite notNil).
	self assert: self entity isWrite equals: 'aLiteral'. "
	^  String streamContents: [ :aStream | aStream 
		nextPutAll: 'self assert: (self entity ';
		nextPutAll: aSlot name;
		nextPutAll: ' notNil).';
		cr;
		nextPutAll: 'self assert: self entity ';
		nextPutAll: aSlot name;
		nextPutAll: ' equals: ''aLiteral'' .'] 
	

]

{ #category : #'generate for primitive slot' }
FamixTestAndTraitGenerator >> generateCodeForPrimitiveSlotInitialization: aSlot [
"Example of what we want to generate
	
	self entity isWrite: 'aLiteral'."
^ String streamContents: [ :aStream | aStream nextPutAll:  '"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "';
		cr;
		nextPutAll: 'self entity ';
		nextPutAll: aSlot name;
		nextPutAll: ': ''aLiteral''. ']
]

{ #category : #run }
FamixTestAndTraitGenerator >> generateSetUpInTraitFor: aClass [
	^ String streamContents: [ :aStream | aStream nextPutAll: 'setUp';
		cr;
		nextPutAll: 'super setUp.';
		cr;
		nextPutAll: '	model := MooseModel new metamodel: FamixGenerator metamodel.';
		cr;
		nextPutAll: 'self entity: (MooseEntity new copyWithTalent:'; 
		nextPutAll: aClass name;
		nextPutAll: ').';
		cr;
		nextPutAll: 'self entity class initializeSlots: self entity.';
		cr;
		nextPutAll: 'model add: entity. '
		 ]
]

{ #category : #'generate for FMOne slot' }
FamixTestAndTraitGenerator >> generateSlotNameOfTestTraitFrom: aSlot [
	^ (aSlot targetClass name withoutPrefix: self generator prefix, 'T') uncapitalized.
	 
	
]

{ #category : #accessing }
FamixTestAndTraitGenerator >> generateSlotsOfTraitOfTestFor: aClass [
	| aColl |
	aColl := OrderedCollection new.
	aClass localSlots do: [ :s | aColl
				addAll: (self generateSlotsOfTraitOfTestFrom: s) ].
	^aColl
]

{ #category : #accessing }
FamixTestAndTraitGenerator >> generateSlotsOfTraitOfTestFrom: aSlot [
	^((aSlot class == FMOne) or: [ aSlot class == FMProperty ])
		ifTrue: [ {aSlot name} ]
		ifFalse: [  {(self generateSlotNameOfTestTraitFrom: aSlot) asString , '1'.
						(self generateSlotNameOfTestTraitFrom: aSlot) asString , '2' } ]
]

{ #category : #'generate for FMMany slot' }
FamixTestAndTraitGenerator >> generateTestEmptyCollectionNameFrom: aSlot [
	^'testWithout', aSlot capitalized.
	
]

{ #category : #run }
FamixTestAndTraitGenerator >> generateTestMethodNameFrom: aSlot [
	^ 'test' , aSlot name asCamelCase.
]

{ #category : #'generate for FMMany slot' }
FamixTestAndTraitGenerator >> generateTestsEmptyCollectionForFMManySlot: aSlot [

	
	"Example of what we want to generate
	testWithMethods
	self assert: (self entity methods isEmpty)."
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestEmptyCollectionNameFrom: aSlot);
		cr;
		nextPutAll: (self generateCodeForEmptyCollectionAssertion: aSlot) ]
]

{ #category : #run }
FamixTestAndTraitGenerator >> generateTestsFor: aClass [
	aClass localSlots do: [ :aSlot | traitTest compile: (self generateTestsForASlot: aSlot) classified: 'tests']
]

{ #category : #run }
FamixTestAndTraitGenerator >> generateTestsForASlot: aSlot [
	(aSlot isKindOf: FMOne)
		ifTrue: [ ^ self generateTestsForFMOneSlot: aSlot ].
	(aSlot isKindOf: FMMany)
		ifTrue: [ ^ self generateTestsForFMManySlot: aSlot ].
	(aSlot isKindOf: InstanceVariableSlot)
		ifTrue: [ ^ self generateTestsForPrimitiveSlot: aSlot ]
]

{ #category : #'generate for FMMany slot' }
FamixTestAndTraitGenerator >> generateTestsForFMManySlot: aSlot [

	
	"Example of what we want to generate
	testWithMethods
	method1 := MooseEntity new copyWithTalent: FamixTMethod.
	method2 := MooseEntity new copyWithTalent: FamixTMethod.
	self entity addMethod: method1.
	self entity addMethod: method2.
	self assert: (self entity methods notEmpty).
	self assertCollection: self entity methods hasSameElements: { method1. method2 }.
	self assert: method1 parentType equals: entity."
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestMethodNameFrom: aSlot);
		cr;
		nextPutAll: (self generateCodeForFMManySlotInitialization: aSlot);
		cr;
		nextPutAll: (self generateCodeForFMManySlotAssertions: aSlot) ]
]

{ #category : #'generate for FMOne slot' }
FamixTestAndTraitGenerator >> generateTestsForFMOneSlot: aSlot [
	
	"Example of what we want to generate
	testAccessor
	withAccesses := MooseEntity new copyWithTalent: FamixTWithAccesses.
	model add: withAccesses.
	self entity accessor: withAccesses.
	self assert: (self entity accessor notNil).
	self assert: self entity accessor equals: withAccesses.
	self assertCollection: withAccess accesses hasSameElements: { entity } "
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestMethodNameFrom: aSlot);
		cr;
		nextPutAll: (self generateCodeForFMOneSlotInitialization: aSlot);
		cr;
		nextPutAll: (self generateCodeForFMOneSlotAssertions: aSlot) ]
]

{ #category : #'generate for primitive slot' }
FamixTestAndTraitGenerator >> generateTestsForPrimitiveSlot: aSlot [
	
	"Example of what we want to generate
	testIsWrite
	self entity isWrite: 'aLiteral'.
	self assert: (self entity isWrite notNil).
	self assert: self entity isWrite equals: 'aLiteral'. "
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestMethodNameFrom: aSlot);
		cr;
		nextPutAll: (self generateCodeForPrimitiveSlotInitialization: aSlot);
		cr;
		nextPutAll: (self generateCodeForPrimitiveSlotAssertions: aSlot) ]
]

{ #category : #run }
FamixTestAndTraitGenerator >> runFor: aClass [
	aClass allSlots
		ifNotEmpty: [ 
			self createPackageToPutGeneratedTests.
			self createTraitOfTestFor: aClass.
			self createTestFor: aClass.
			self generateTestsFor: aClass.
			test
				compile: (self generateSetUpInTraitFor: aClass)
				classified: 'overrides' ]
]
