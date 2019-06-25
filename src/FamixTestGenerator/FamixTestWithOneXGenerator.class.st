Class {
	#name : #FamixTestWithOneXGenerator,
	#superclass : #FamixTestWithXGenerator,
	#category : #FamixTestGenerator
}

{ #category : #accessing }
FamixTestWithOneXGenerator >> createTraitOfTestFor: aClass [
	traitTest := Trait
		named: (self traitNameFrom: aClass)
		uses: TFamixTest
		slots: {(self slotNameOfTestTraitFrom: aClass) asString }
		category: 'Famix-Tests-Traits'
]

{ #category : #utilities }
FamixTestWithOneXGenerator >> famixSlotOf: aClass [
	^ (aClass slots detect: [ :e | e isKindOf: FMOne ] ifNone: [] ) 

]

{ #category : #'generate testWith method' }
FamixTestWithOneXGenerator >> generateAssertionsFor: famixSlotName with: traitSlotName [
	"self assert: (self entity declaredSourceLanguage notNil).
	self assert: self entity declaredSourceLanguage equals: sourceLanguage."
	
	^ String streamContents: [ :aStream | aStream nextPutAll: 'self assert: (self entity ' ;
		nextPutAll: famixSlotName  ;
		nextPutAll: ' notNil).' ;
		cr;
		nextPutAll: 'self assert: self entity ';
		nextPutAll: famixSlotName ;
		nextPutAll: ' equals: ';
		nextPutAll: traitSlotName;
		nextPutAll: '.' ]
]

{ #category : #'generate testWith method' }
FamixTestWithOneXGenerator >> generateCodeForAffectingValue: famixSlotName for: traitSlotName [
	"self entity declaredSourceLanguage: sourceLanguage."
	^ String streamContents: [ :aStream | aStream nextPutAll: 'self entity ' ;
		nextPutAll: traitSlotName ;
		nextPutAll: ': ';
		nextPutAll: famixSlotName;
		nextPutAll: '.' ]
]

{ #category : #'generate testWith method' }
FamixTestWithOneXGenerator >> generateTestMethodWithXCodeFrom: aClass [
	| famixSlotName traitSlotName  type |
	"Example of what we want to generate
	testWithSourceLanguage
	sourceLanquage := MooseEntity new copyWithTalent: FamixTSourceLanguage.
	self entity declaredSourceLanguage: sourceLanguage.
	self assert: (self entity declaredSourceLanguage notNil).
	self assert: self entity declaredSourceLanguage equals: sourceLanguage.
	self assertCollection: sourceLanguage sourcedEntities hasSameElements: {entity}."
	famixSlotName := (self famixSlotNameOf: aClass) asString. "declaredSourceLanguage"
	traitSlotName := ((self slotNameOfTestTraitFrom: aClass) asString). "sourceLanguage"
	type := (self famixOppositeTypeOf: aClass) .
	^ String streamContents: [ :aStream | aStream nextPutAll:  (self generateTestMethodWithXNameFrom: aClass);
		cr;
		nextPutAll: (self generateCodeForSlotsInitialization: traitSlotName with: type);
		cr;
		nextPutAll: (self generateCodeForAffectingValue: traitSlotName for: famixSlotName  );
		cr;
		nextPutAll: (self generateAssertionsFor: famixSlotName with: traitSlotName) ;
		cr;
		nextPutAll: 'self assert: ';
		nextPutAll: traitSlotName  ;
		nextPutAll: ' ';
		nextPutAll: (self generateOppositeSlotNameFor: aClass);
		nextPutAll: ' equals: entity'].
	
]

{ #category : #initialization }
FamixTestWithOneXGenerator >> initialize [ 
	super initialize.
	self initializeClassesFrom:  [ :c | (c name includesSubstring: 'TWith') and: [ (c slots select: [ :e | (e isKindOf: FMOne) and: [(e targetClass slots select: [ :s | s isKindOf: FMOne  ] ) notEmpty] ]) notEmpty]  ]
]

{ #category : #run }
FamixTestWithOneXGenerator >> runFor: aClass [
	self createTraitOfTestFor: aClass.
	traitTest compile: (self generateTestMethodWithXCodeFrom: aClass) classified: 'tests'.
	self createTestFor: aClass.
	test compile: (self generateSetUpCodeFor: aClass) classified: 'overrides'.
]
