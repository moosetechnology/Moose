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
FamixTestWithXGenerator >> generateTestMethodWithXCodeFrom: aClass [
	| slotName |
	slotName := (self famixSlotNameOf: aClass) asString.
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestMethodWithXNameFrom: aClass);
		nextPutAll: '
			self assert: (self entity ';
		nextPutAll: slotName;
		nextPutAll:
			' notEmpty).
	self assertCollection: self entity';
		nextPutAll: slotName;
		nextPutAll: ' hasSameElements: { ';
		nextPutAll: (self slotNameOfTestTraitFrom: aClass) asString, 1 asString;
		nextPutAll: '. ';
		nextPutAll: (self slotNameOfTestTraitFrom: aClass) asString, 2 asString;
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
