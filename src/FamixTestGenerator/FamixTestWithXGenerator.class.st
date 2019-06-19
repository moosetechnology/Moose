Class {
	#name : #FamixTestWithXGenerator,
	#superclass : #FamixTestGenerator,
	#category : #FamixTestGenerator
}

{ #category : #'as yet unclassified' }
FamixTestWithXGenerator >> famixSlotNameOf: aClass [
	^ (aClass slots detect: [ :e | e isKindOf: FMMany ]) name

]

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> generateCodeForSlotsInitialization: aSlotName with: aTypeName [
	^ String streamContents: [ :aStream | aStream nextPutAll: 'aSlotName := MooseEntity new copyWithTalent: ' ;
		nextPutAll: aTypeName;
		nextPutAll: '.']
]

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> generateTestMethodWithXCodeFrom: aClass [
	| famixSlotName traitSlotName1 traitSlotName2 typeName |
	famixSlotName := (self famixSlotNameOf: aClass) asString.
	traitSlotName1 := (self slotNameOfTestTraitFrom: aClass) asString, 1 asString.
	traitSlotName2 := (self slotNameOfTestTraitFrom: aClass) asString, 2 asString.
	typeName := ''.
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestMethodWithXNameFrom: aClass);
		cr;
		nextPutAll: (self generateCodeForSlotsInitialization: traitSlotName1 with: typeName);
		cr;
		nextPutAll: (self generateCodeForSlotsInitialization: traitSlotName2 with: typeName);
		cr;
		nextPutAll: 'self assert: (self entity ';
		nextPutAll: famixSlotName;
		nextPutAll:
			' notEmpty).
	self assertCollection: self entity';
		nextPutAll: famixSlotName;
		nextPutAll: ' hasSameElements: { ';
		nextPutAll: traitSlotName1;
		nextPutAll: '. ';
		nextPutAll: traitSlotName2;
		nextPutAll: ' }'].
	
]

{ #category : #'generate testWith method' }
FamixTestWithXGenerator >> generateTestMethodWithXIn: aTrait from: aClass [
	aTrait compile: (self generateTestMethodWithXCodeFrom: aClass) classified: 'tests'
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
			' isEmpty'].
	
]

{ #category : #'generate testWithout method' }
FamixTestWithXGenerator >> generateTestMethodWithoutXIn: aTrait from: aClass [
	aTrait compile: (self generateTestMethodWithoutXCodeFrom: aClass) classified: 'tests'
]

{ #category : #'generate testWithout method' }
FamixTestWithXGenerator >> generateTestMethodWithoutXNameFrom: aClass [
	^'testWithout', (aClass name withoutPrefix: 'FamixTWith').
]

{ #category : #initialization }
FamixTestWithXGenerator >> initialize [ 
	self initializePackageFrom: 'Famix-Traits'.
	classes := self initializeClassesFrom:  [ :c | c name includesSubstring: 'TWith' ] 
]

{ #category : #accessing }
FamixTestWithXGenerator >> slotNameOfTestTraitFrom: aClass [ 
	^ (aClass name withoutPrefix: 'FamixTWith') asLowercase withoutSuffix: 's'
]
