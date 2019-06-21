Class {
	#name : #FamixTestWithXGenerator,
	#superclass : #FamixTestGenerator,
	#category : #FamixTestGenerator
}

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> compileTestMethodWithXIn: aTrait from: aClass [
	aTrait compile: (self generateTestMethodWithXCodeFrom: aClass) classified: 'tests'
]

{ #category : #'generate testWithout method' }
FamixTestWithXGenerator >> compileTestMethodWithoutXIn: aTrait from: aClass [
	aTrait compile: (self generateTestMethodWithoutXCodeFrom: aClass) classified: 'tests'
]

{ #category : #utilities }
FamixTestWithXGenerator >> famixOppositeTypeOf: aClass [
	^ (aClass slots detect: [ :e | e isKindOf: FMMany ]) targetClass

]

{ #category : #utilities }
FamixTestWithXGenerator >> famixSlotNameOf: aClass [
	^ (self famixSlotOf: aClass)  name

]

{ #category : #utilities }
FamixTestWithXGenerator >> famixSlotOf: aClass [
	^ (aClass slots detect: [ :e | e isKindOf: FMMany ] ifNone: [] ) 

]

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> generateAssertionsCollectionOf: famixSlotName with: traitSlotName1 and: traitSlotName2 [
	^String streamContents: [ :aStream | aStream nextPutAll: 
	'self assert: (self entity ';
		nextPutAll: famixSlotName;
		nextPutAll:
			' notEmpty).
	self assertCollection: self entity ';
		nextPutAll: famixSlotName;
		nextPutAll: ' hasSameElements: { ';
		nextPutAll: traitSlotName1;
		nextPutAll: '. ';
		nextPutAll: traitSlotName2;
		nextPutAll: ' }.']
]

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> generateCodeForAddingSlotInCollection: traitSlotName1 for: aClass [ 
	| methodName |
	methodName := aClass methodDict keys detect: [ :s | s beginsWith: 'add'  ] ifNone: [ 'addXXX' ] .
	^ 'self entity ', methodName , ' ',  traitSlotName1 , '.'
]

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> generateCodeForSlotsInitialization: traitSlotName with: type [
	^ traitSlotName , ':= MooseEntity new copyWithTalent: ' , type name , '.'.
]

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> generateOppositeSlotNameFor: aClass [
	^(self famixSlotOf: aClass) inverseName.
	
	
]

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> generateTestMethodWithXCodeFrom: aClass [
	| famixSlotName traitSlotName1 traitSlotName2 type |
	"Example of what we want to generate
	testWithMethods
	method1 := MooseEntity new copyWithTalent: FamixTMethod.
	method2 := MooseEntity new copyWithTalent: FamixTMethod.
	self entity addMethod: method1.
	self entity addMethod: method2.
	self assert: (self entity methods notEmpty).
	self assertCollection: self entity methods hasSameElements: { method1. method2 }.
	self assert: method1 parentType equals: entity."
	famixSlotName := (self famixSlotNameOf: aClass) asString.
	traitSlotName1 := ((self slotNameOfTestTraitFrom: aClass) asString, 1 asString).
	traitSlotName2 := ((self slotNameOfTestTraitFrom: aClass) asString, 2 asString).
	type := (self famixOppositeTypeOf: aClass) .
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestMethodWithXNameFrom: aClass);
		cr;
		nextPutAll: (self generateCodeForSlotsInitialization: traitSlotName1 with: type);
		cr;
		nextPutAll: (self generateCodeForSlotsInitialization: traitSlotName2 with: type);
		cr;
		nextPutAll: (self generateCodeForAddingSlotInCollection: traitSlotName1 for: aClass );
		cr;
		nextPutAll: (self generateCodeForAddingSlotInCollection: traitSlotName2 for: aClass );
		cr;
		nextPutAll: (self generateAssertionsCollectionOf: famixSlotName with: traitSlotName1 and: traitSlotName2) ;
		cr;
		nextPutAll: 'self assert: ';
		nextPutAll: traitSlotName1 ;
		nextPutAll: ' ';
		nextPutAll: (self generateOppositeSlotNameFor: aClass);
		nextPutAll: ' equals: entity'].
	
	
]

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> generateTestMethodWithXNameFrom: aClass [
	^'test', (aClass name withoutPrefix: 'FamixT').
]

{ #category : #'generate testWithout method' }
FamixTestWithXGenerator >> generateTestMethodWithoutXCodeFrom: aClass [
	| slotName |
	slotName := (self famixSlotNameOf: aClass) asString.
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestMethodWithoutXNameFrom: aClass);
		nextPutAll: '
			self assert: (self entity ';
		nextPutAll: slotName;
		nextPutAll:
			' isEmpty)'].
	
]

{ #category : #'generate testWithout method' }
FamixTestWithXGenerator >> generateTestMethodWithoutXNameFrom: aClass [
	^'testWithout', (aClass name withoutPrefix: 'FamixTWith').
]

{ #category : #initialization }
FamixTestWithXGenerator >> initialize [ 
	self initializePackageFrom: 'Famix-Traits'.
	self initializeClassesFrom:  [ :c | (c name includesSubstring: 'TWith') and: [ (c slots select: [ :e | e isKindOf: FMMany ]) notEmpty]  ]
]

{ #category : #'as yet unclassified' }
FamixTestWithXGenerator >> runFor: aClass [
	self createTraitOfTestFor: aClass.
	traitTest compile: (self generateTestMethodWithXCodeFrom: aClass) classified: 'tests'.
	traitTest compile: (self generateTestMethodWithoutXCodeFrom: aClass) classified: 'tests'.
	self createTestFor: aClass.
	test compile: (self generateSetUpCodeFor: aClass) classified: 'overrides'.
]

{ #category : #accessing }
FamixTestWithXGenerator >> slotNameOfTestTraitFrom: aClass [ 
	^ (aClass name withoutPrefix: 'FamixTWith') asLowercase withoutSuffix: 's'
]
