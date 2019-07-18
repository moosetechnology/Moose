Class {
	#name : #TalentInstaller,
	#superclass : #Object,
	#instVars : [
		'talentedClasses'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Talents-Installer'
}

{ #category : #'as yet unclassified' }
TalentInstaller class >> reset [
	uniqueInstance ifNotNil:#unsubscribe.
	uniqueInstance := nil.
]

{ #category : #'as yet unclassified' }
TalentInstaller class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'public API' }
TalentInstaller >> addTalent: aClass toObject: anObject [
	| newObject |
	newObject := self doCopyObject: anObject withTalent: aClass.
	anObject becomeForward: newObject copyHash: true.
	^ newObject
]

{ #category : #'public API' }
TalentInstaller >> addTrait: aTrait toClass: aClass [
	| traitedClass |
	traitedClass := self doCopyClass: aClass withTrait: aTrait asTraitComposition.
	aClass becomeForward: traitedClass copyHash: true.
	^ traitedClass
]

{ #category : #operations }
TalentInstaller >> calculateNewTalentFor: aClass adding: aTalent [
	^ talentedClasses at: aClass ifPresent: [ :talent | talent + aTalent ] ifAbsent: [ aTalent ]
]

{ #category : #operations }
TalentInstaller >> calculateNewTalentFor: anObject removing: aTalent [
	^ talentedClasses at: anObject class ifPresent: [ :talent | talent without: aTalent ] ifAbsent: [ self error: 'The object has no talents' ]
]

{ #category : #'public API' }
TalentInstaller >> copyClass: aTargetClass withTrait: trait [
	^ self doCopyClass: aTargetClass withTrait: trait asTraitComposition
]

{ #category : #operations }
TalentInstaller >> copyObject: oldObject withNewClass: newClass [
	| newObject |
	
	newObject := newClass isVariable
		ifTrue: [ newClass basicNew: oldObject size ]
		ifFalse: [ newClass basicNew ].

	newClass allSlots do: [ :newSlot | oldObject class slotNamed: newSlot name ifFound: [ :oldSlot | newSlot write: (oldSlot read: oldObject) to: newObject ] ].

	newClass isVariable
		ifTrue: [ 1 to: oldObject basicSize do: [ :offset | newObject basicAt: offset put: (oldObject basicAt: offset) ] ].


	^ newObject
]

{ #category : #'public API' }
TalentInstaller >> copyObject: anObject withTalent: aClass [
	^ (self doCopyObject: anObject withTalent: aClass)
		postCopy;
		yourself
]

{ #category : #'public API' }
TalentInstaller >> copyObject: anObject withoutTalent: aClass [
	^ (self doCopyObject: anObject withoutTalent: aClass)
		postCopy;
		yourself
]

{ #category : #operations }
TalentInstaller >> doCopyClass: aTargetClass withTrait: traitToAdd [
	| originalClass calculatedTalent |

	originalClass := self findOriginalClass: aTargetClass.
	calculatedTalent := self calculateNewTalentFor: aTargetClass adding: traitToAdd.
	
	^ self extendClass: originalClass with: calculatedTalent.
]

{ #category : #operations }
TalentInstaller >> doCopyObject: anObject withTalent: aTalent [
	| newObject newClass talentToAdd |
	talentToAdd := aTalent asTraitComposition.
	newClass := self doCopyClass: anObject class withTrait: talentToAdd.
	newObject := self copyObject: anObject withNewClass: newClass.
	self talent: talentToAdd addedTo: newObject.
	^ newObject
]

{ #category : #operations }
TalentInstaller >> doCopyObject: anObject withoutTalent: aClass [
	| originalClass newObject newClass calculatedTalent talentToRemove |
	
	talentToRemove := aClass asTraitComposition.
	
	originalClass := self findOriginalClass: anObject class.
	calculatedTalent := self calculateNewTalentFor: anObject removing: talentToRemove.

	calculatedTalent ifNotNil: [ newClass := self extendClass: originalClass with: calculatedTalent ] ifNil: [ newClass := originalClass ].

	newObject := self copyObject: anObject withNewClass: newClass.

	^ newObject
]

{ #category : #operations }
TalentInstaller >> extendClass: aClass with: aTalent [
	| newClass |
	talentedClasses associations detect: [ :e | e value = aTalent ] ifFound: [ :e | ^ e key ] ifNone: [  ].

	newClass := Smalltalk anonymousClassInstaller make: [ :builder |
		builder
			superclass: aClass;
			traitComposition: aTalent;
			layoutClass: aClass classLayout class ].
		
	talentedClasses at: newClass put: aTalent.
		
	^ newClass
]

{ #category : #operations }
TalentInstaller >> findOriginalClass: aClass [
	^ talentedClasses at: aClass ifPresent: [ aClass superclass ] ifAbsent: [ aClass ]
]

{ #category : #initialization }
TalentInstaller >> initialize [
	talentedClasses := WeakKeyDictionary new.
	
	WeakArray addWeakDependent: talentedClasses.
]

{ #category : #'public API' }
TalentInstaller >> removeTalent: aClass fromObject: anObject [
	| newObject |
	newObject := self doCopyObject: anObject withoutTalent: aClass.
	anObject becomeForward: newObject copyHash: true.
	^ newObject
]

{ #category : #operations }
TalentInstaller >> talent: aTalent addedTo: anObject [
	aTalent initializeObject: anObject
]

{ #category : #'events handling' }
TalentInstaller >> unsubscribe [
	SystemAnnouncer uniqueInstance unsubscribe: self.
]
