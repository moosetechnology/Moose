Class {
	#name : #MooseEntityTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #tests }
MooseEntityTest >> testAllMooseDisplayOn [
	| t ins |
	(MooseEntity withAllSubclasses reject: #hasAbstractMethods)
		do: [ :cls | 
			ins := cls new.
			self shouldnt: [ t := ins gtDisplayString ] raise: Error.
			self assert: t isByteString.
			self assert: (String streamContents: [ :s | ins gtDisplayOn: s ]) equals: t ]
]

{ #category : #tests }
MooseEntityTest >> testAllMooseNameOn [
	| t ins |
	MooseEntity allSubclasses
		do: [ :cls | 
			ins := cls new.
			self shouldnt: [ t := ins mooseName ] raise: Error.
			self assert: (String streamContents: [ :s | ins mooseNameOn: s ]) equals: t ]
]

{ #category : #tests }
MooseEntityTest >> testAllPrintOn [
	| t ins |
	MooseEntity withAllSubclasses
		do: [ :cls | 
			cls hasAbstractMethods
				ifFalse: [ ins := cls new.
					self shouldnt: [ t := ins printString ] raise: Error.
					self assert: t isByteString.
					self assert: (String streamContents: [ :s | ins printOn: s ]) equals: t ] ]
]

{ #category : #tests }
MooseEntityTest >> testAllPrinting [
	| entity |
	MooseEntity withAllSubclasses
		do: [ :cls | 
			cls hasAbstractMethods
				ifFalse: [ entity := cls new.
					self assert: (String streamContents: [ :s | entity printOn: s ]) equals: entity printString ] ]
]

{ #category : #tests }
MooseEntityTest >> testAllPropertySelectors [
	| model class |
	model := FamixTest1Model new.
	self assert: (FamixTest1Entity allPropertySelectorsComputableIn: model) equals: IdentityDictionary new.
	model := FAMIXTypeGroup new.
	class := FamixTest1Class named: 'AClass'.
	model add: class.
	self assert: (FamixTest1Entity allPropertySelectorsComputableIn: model) equals: IdentityDictionary new.
	model := MooseAbstractGroup new.
	class := FamixTest1Class named: 'AClass'.
	model add: class.
	self assert: (FamixTest1Entity allPropertySelectorsComputableIn: model) equals: IdentityDictionary new
]

{ #category : #tests }
MooseEntityTest >> testAnnotation [
	| methodProperty |
	MooseEntity allSubclassesDo: [ :cls | self assert: cls annotation identicalTo: cls ].

	self assert: MooseEntity annotation identicalTo: MooseEntity.

	methodProperty := (MooseEntity class >> #annotation) properties.
	self assert: (methodProperty includesKey: #abstract)
]

{ #category : #tests }
MooseEntityTest >> testBookmark [
	| entity model bookmark |
	model := MooseModel new.
	entity := MooseEntity new.
	model add: entity.
	bookmark := entity bookmarkAs: #test.
	self assert: bookmark isBookmarked  
]

{ #category : #tests }
MooseEntityTest >> testEntityBackLink [
	"self debug: #testEntityBackLink"

	| e r |
	e := MooseEntity new.
	r := e privateState entity.
	self assert: r identicalTo: e
]

{ #category : #tests }
MooseEntityTest >> testGroupFor [
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
MooseEntityTest >> testId [
	MooseEntity setMooseID: SmallInteger maxVal - 2.
	self should:  [ 10 timesRepeat: [ MooseEntity freshID ]  ] raise: Notification.
	
	self assert: MooseEntity mooseDev notNil.
]

{ #category : #tests }
MooseEntityTest >> testIsStub [
	self deny: MooseEntity new isStub.
	self assert: (MooseEntity new privateState 
					attributeAt: #privateIsStub put: true;
					yourself) isStub
]

{ #category : #tests }
MooseEntityTest >> testLocalMooseModel [
	| element model |
	element := MooseEntity new.
	model := MooseModel new.

	"self assert: (element mooseModel isNil)."
	model add: element.
	self assert: element mooseModel identicalTo: model.
	self assert: element localMooseModel identicalTo: model.

	model := MooseModel new.
	self assert: model localMooseModel identicalTo: model
]

{ #category : #tests }
MooseEntityTest >> testMooseModel [
	| element model |
	element := MooseEntity new.
	model := MooseModel new.

	model add: element.
	self assert: element mooseModel identicalTo: model
]

{ #category : #tests }
MooseEntityTest >> testMooseModelAccessor [
	| entity model |
	entity := MooseEntity new.
	"	self assert: (MooseModel ownerOf: entity) isNil. 
	self assert: (entity mooseModel isNil).
"
	model := MooseModel new.
	self assert: model isEmpty.
	entity mooseModel: model.
	self assert: entity mooseModel identicalTo: model.
	self deny: model isEmpty
]

{ #category : #tests }
MooseEntityTest >> testMooseName [

	self assert: Smalltalk mooseName equals: #Smalltalk.

]

{ #category : #tests }
MooseEntityTest >> testPrintOn [
	| entity printString |
	entity := MooseEntity new.
	printString := String streamContents: [ :stream | entity printOn: stream ].
	self assert: printString equals: entity printString.
	self assert: (printString beginsWith: 'a MooseEntity ')
]

{ #category : #tests }
MooseEntityTest >> testPrintOnWithError [
	| entity printString |
	entity := MooseEntity new.
	entity stub mooseName willRaise: Error new.
	printString := String streamContents: [ :stream | entity printOn: stream ].
	self assert: (printString endsWith: 'Error printing the object''')
]

{ #category : #tests }
MooseEntityTest >> testPrivateSetMooseModel [
	| entity model |
	entity := MooseEntity new.
	model := MooseModel new.
	entity privateSetMooseModel: model.
	self assert: entity mooseModel identicalTo: model
]

{ #category : #tests }
MooseEntityTest >> testPrivateStateMutator [
	| entity state mooseState |
	entity := MooseEntity new.
	state := entity privateState.
	self assert: state notNil.

	mooseState := MooseMemoryEfficientState new.
	entity privateState: mooseState.
	self assert: entity privateState identicalTo: mooseState
]

{ #category : #tests }
MooseEntityTest >> testResetIDGeneration [
	MooseEntity freshID.
	MooseEntity resetIDGeneration.
	self assert: MooseEntity freshID equals: 1
]
