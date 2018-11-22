Class {
	#name : #MooseEntityTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #tests }
MooseEntityTest >> testAllMooseDisplayOn [
	| t str ins |
	(MooseEntity withAllSubclasses reject: #hasAbstractMethods)
		do: [ :cls | 
			str := WriteStream on: String new.
			ins := cls new.
			self shouldnt: [ t := ins gtDisplayString ] raise: Error.
			self assert: t isByteString.
			ins gtDisplayOn: str.
			self assert: str contents equals: t ]
]

{ #category : #tests }
MooseEntityTest >> testAllMooseNameOn [
	| t str ins |
	MooseEntity allSubclasses
		do: [ :cls | 
			str := WriteStream on: String new.
			ins := cls new.
			self shouldnt: [ t := ins mooseName ] raise: Error.
			self assert: t isByteString.
			ins mooseNameOn: str.
			self assert: str contents equals: t ]
]

{ #category : #tests }
MooseEntityTest >> testAllPrintOn [
	| t str ins |
	MooseEntity withAllSubclasses
		do: [ :cls | 
			cls hasAbstractMethods ifFalse: [
				str := WriteStream on: String new.
				ins := cls new.
				self shouldnt: [ t := ins printString ] raise: Error.
				self assert: t isByteString.
				ins printOn: str.
				self assert: str contents equals: t ] ]
]

{ #category : #tests }
MooseEntityTest >> testAllPrinting [
	| str entity |
	MooseEntity withAllSubclasses
		do: [ :cls | 
			cls hasAbstractMethods ifFalse: [
				str := WriteStream on: String new.
				entity := cls new.
				entity printOn: str.
				self assert: str contents equals: entity printString ] ]
]

{ #category : #tests }
MooseEntityTest >> testAllPropertySelectors [
	| model class |
	model := MooseModel new.
	self assert: (FAMIXEntity allPropertySelectorsComputableIn: model) equals: IdentityDictionary new.
	model := FAMIXTypeGroup new.
	class := FAMIXClass new name: 'AClass'.
	model add: class.
	self assert: (FAMIXEntity allPropertySelectorsComputableIn: model) equals: IdentityDictionary new.
	model := MooseAbstractGroup new.
	class := FAMIXClass new name: 'AClass'.
	model add: class.
	self assert: (FAMIXEntity allPropertySelectorsComputableIn: model) equals: IdentityDictionary new
]

{ #category : #tests }
MooseEntityTest >> testAnnotation [
	| methodProperty |
	MooseEntity allSubclassesDo: [ :cls |
		self assert: cls annotation == cls.
	].

	self assert: MooseEntity annotation == MooseEntity.
	
	methodProperty := (MooseEntity class >> #annotation) properties.
	self assert:  (methodProperty includesKey: #abstract)
]

{ #category : #tests }
MooseEntityTest >> testAsMooseFinderItemNamed [
	| entity1 entity2 model model2 |
	entity1 := FAMIXType new.
	entity1 name: 'hello'.
	entity2 := FAMIXType new.
	entity2 name: 'hello2'.
	model := MooseModel new.
	model
		addAll:
			{entity1.
			entity2}.
	self assert: (model asMooseFinderItemNamed: 'bouba' in: model) == model.
	model2 := entity1 asMooseFinderItemNamed: 'bouba' in: model.
	self assert: model2 class == FAMIXTypeGroup.
	self assert: model2 name equals: 'Bouba: hello'.
	self assert: model2 entities asArray equals: {entity1}
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
MooseEntityTest >> testCopyFromWithin [

	| entity |
	entity := MooseEntity new.
	self assert: (entity copyFrom: nil within: nil) == entity
]

{ #category : #tests }
MooseEntityTest >> testEntityBackLink [
	"self debug: #testEntityBackLink"
	
	| e r |
	e := MooseEntity new.
	r := e privateState entity.
	self assert: (r == e)
]

{ #category : #tests }
MooseEntityTest >> testGroupFor [
	| entity1 entity2 model classGroup methodGroup |
	entity1 := FAMIXClass new.
	entity2 := FAMIXClass new.
	model := MooseModel new.
	model
		addAll:
			{entity1.
			entity2}.
	classGroup := model groupFor: #allClasses.
	self assert: classGroup class == FAMIXClassGroup.
	self
		assert:
			(classGroup entities
				includesAll:
					{entity1.
					entity2}).
	methodGroup := model groupFor: #allMethods.
	self assert: methodGroup class == MooseGroup.
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
	self assert: (element mooseModel == model).
	self assert: (element localMooseModel == model).

	model := MooseModel new.
	self assert: (model localMooseModel == model)
]

{ #category : #tests }
MooseEntityTest >> testMooseIcon [
	self assert: FAMIXEntity new mooseIcon isForm
]

{ #category : #tests }
MooseEntityTest >> testMooseIncludes [
	| t |
	t := MooseEntity new.
	self assert: (t mooseIncludes: t).
	self deny: (t mooseIncludes: MooseEntity new).
]

{ #category : #tests }
MooseEntityTest >> testMooseModel [
	| element model |
	
	element := MooseEntity new.
	model := MooseModel new.
	
	model add: element.
	self assert: (element mooseModel == model).

]

{ #category : #tests }
MooseEntityTest >> testMooseModelAccessor [
	| entity model |
	entity := MooseEntity new.
"	self assert: (MooseModel ownerOf: entity) isNil. 
	self assert: (entity mooseModel isNil).
"
	model := MooseModel new.
	self assert: (model isEmpty).
	entity mooseModel: model.
	self assert: (entity mooseModel == model).
	self deny: (model isEmpty)
	
]

{ #category : #tests }
MooseEntityTest >> testMooseName [
	"self debug: #testMooseName"

	self assert: LANNode mooseName equals: #Smalltalk::LANNode.
	self assert: Smalltalk mooseName equals: #Smalltalk.
	self assert: 'Smalltalk::LANNode' mooseName equals: #Smalltalk::LANNode.
	self assert: LANNode class mooseName equals: #Smalltalk::LANNode_class	"we could also  test here that all the famix entities  understand mooseName but for that we should create model so
	this is done in LANTest "
]

{ #category : #tests }
MooseEntityTest >> testPrintOnAndPrintString [
	| entity stream |
	entity := MooseEntity new.
	stream := WriteStream on: String new.
	entity printOn: stream.
	self assert: stream contents equals: entity printString.
	self assert: (stream contents beginsWith: 'a MooseEntity ')
]

{ #category : #tests }
MooseEntityTest >> testPrintOnWithError [
	| entity stream cls |
	cls := Class new
		basicSuperclass: MooseEntity;
		setFormat: MooseEntity format;
		classLayout: MooseEntity classLayout copy;
		yourself.
	cls compileSilently: 'mooseName   ^ 1/0'.
	cls compileSilently: 'defaultStateClass	^ MooseMemoryEfficientState'.
	entity := cls new.
	stream := WriteStream on: String new.
	entity printOn: stream.
	self
		assert: (stream contents endsWith: 'Error printing the object''')
]

{ #category : #tests }
MooseEntityTest >> testPrivateSetMooseModel [
	| entity model |
	entity := MooseEntity new.
	model := MooseModel new.
	entity privateSetMooseModel: model.
	self assert: (entity mooseModel == model).

]

{ #category : #tests }
MooseEntityTest >> testPrivateStateMutator [

	| entity state mooseState |
	entity := MooseEntity new.
	state := entity privateState.
	self assert: state notNil.
	
	mooseState := MooseMemoryEfficientState new.
	entity privateState: mooseState.
	self assert: (entity privateState == mooseState).

]

{ #category : #tests }
MooseEntityTest >> testProperty [
	| entity |
	entity := FAMIXEntity new.
	self assert: entity properties isEmpty.
	self assert: (entity propertyNamed: #aKey ifNil: [ 10 ]) equals: 10.
	entity propertyNamed: #aKey ifAbsentPut: 20.
	self assert: (entity propertyNamed: #aKey ifNil: [ 10 ]) equals: 20.
	self deny: entity properties isEmpty.
	self assert: entity complexPropertyPragmas isEmpty.
	self assert: entity notExistentMetricValue equals: -1
]

{ #category : #tests }
MooseEntityTest >> testResetIDGeneration [
	MooseEntity freshID.
	MooseEntity resetIDGeneration.
	self assert: MooseEntity freshID equals: 1
]
