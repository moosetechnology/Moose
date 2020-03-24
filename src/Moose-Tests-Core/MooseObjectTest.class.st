Class {
	#name : #MooseObjectTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #testing }
MooseObjectTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
MooseObjectTest >> actualClass [
	^ MooseObject
]

{ #category : #tests }
MooseObjectTest >> testAllMooseDisplayOn [
	| t ins |
	self withConcreteSubclasses
		do: [ :cls | 
			ins := cls new.
			self shouldnt: [ t := ins gtDisplayString ] raise: Error.
			self assert: t isByteString.
			self assert: (String streamContents: [ :s | ins gtDisplayOn: s ]) equals: t ]
]

{ #category : #tests }
MooseObjectTest >> testAllMooseNameOn [
	| t ins |
	self actualClass allSubclasses
		do: [ :cls | 
			ins := cls new.
			self shouldnt: [ t := ins mooseName ] raise: Error.
			self assert: (String streamContents: [ :s | ins mooseNameOn: s ]) equals: t ]
]

{ #category : #tests }
MooseObjectTest >> testAllPrintOn [
	| t ins |
	self withConcreteSubclasses
		do: [ :cls | 
			ins := cls new.
			self shouldnt: [ t := ins printString ] raise: Error.
			self assert: t isByteString.
			self assert: (String streamContents: [ :s | ins printOn: s ]) equals: t ]
]

{ #category : #tests }
MooseObjectTest >> testAllPrinting [
	| entity |
	self withConcreteSubclasses
		do: [ :cls | 
			entity := cls new.
			self assert: (String streamContents: [ :s | entity printOn: s ]) equals: entity printString ]
]

{ #category : #tests }
MooseObjectTest >> testEntityBackLink [
	"self debug: #testEntityBackLink"

	| e r |
	e := self actualClass new.
	r := e privateState entity.
	self assert: r identicalTo: e
]

{ #category : #tests }
MooseObjectTest >> testGroupFor [
	| entity1 entity2 model classGroup methodGroup |
	entity1 := FamixTest1Class new.
	entity2 := FamixTest1Class new.
	model := FamixTest1Model new.
	model addAll: {entity1 . entity2}.
	classGroup := model groupFor: #allClasses.
	self assert: classGroup class identicalTo: FAMIXClassGroup.
	self assert: (classGroup entities includesAll: {entity1 . entity2}).
	methodGroup := model groupFor: #allMethods.
	self assert: methodGroup class identicalTo: MooseGroup.
	self assert: methodGroup isEmpty
]

{ #category : #tests }
MooseObjectTest >> testId [
	self actualClass setMooseID: SmallInteger maxVal - 2.
	self should: [ 10 timesRepeat: [ self actualClass freshID ] ] raise: Notification
]

{ #category : #tests }
MooseObjectTest >> testMooseName [
	self assert: Smalltalk mooseName equals: #Smalltalk
]

{ #category : #tests }
MooseObjectTest >> testPrintOnWithError [
	| entity printString |
	entity := self actualClass new.
	entity stub mooseName willRaise: Error new.
	printString := String streamContents: [ :stream | entity printOn: stream ].
	self assert: (printString endsWith: 'Error printing the object''')
]

{ #category : #tests }
MooseObjectTest >> testPrivateStateMutator [
	| entity state mooseState |
	entity := self actualClass new.
	state := entity privateState.
	self assert: state notNil.

	mooseState := MooseMemoryEfficientState new.
	entity privateState: mooseState.
	self assert: entity privateState identicalTo: mooseState
]

{ #category : #tests }
MooseObjectTest >> testResetIDGeneration [
	self actualClass freshID.
	self actualClass resetIDGeneration.
	self assert: self actualClass freshID equals: 1
]

{ #category : #tests }
MooseObjectTest >> withConcreteSubclasses [
	^ self actualClass withAllSubclasses reject: #isAbstract
]
