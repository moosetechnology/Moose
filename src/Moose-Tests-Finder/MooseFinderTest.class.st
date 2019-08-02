Class {
	#name : #MooseFinderTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'systemWindows'
	],
	#category : #'Moose-Tests-Finder'
}

{ #category : #utils }
MooseFinderTest >> allActionMorphsIn: aMorph [
	| answer |
	answer := OrderedCollection new.
	aMorph submorphs do: [ :s | 
		s subMenu 
			ifNil: [ answer add: s]
			ifNotNil: [ answer addAll: (self allActionMorphsIn: s subMenu)]
	].
	^ answer
]

{ #category : #utils }
MooseFinderTest >> assertAction: action [
	| tsystemWindows |
	(self itemsToExclude includes: action contents)
		ifTrue: [ ^ self ].
		
	tsystemWindows := self getAllWindows.
	[
		self 
			shouldnt: [([action doButtonAction] on: Notification do: [:ex | ])] 
			raise: Error
			description: action contents ]
		ensure: [(self getAllWindows copyWithoutAll: tsystemWindows) do: #delete.]
]

{ #category : #tests }
MooseFinderTest >> assertAllActionsOf: group [
	
	| allActionMorphs |

	group isEmpty ifTrue: [^ self ].
	allActionMorphs := self allActionMorphsIn: group mooseMenu.
	allActionMorphs 
		do: [ :action | self assertAction: action ]
]

{ #category : #running }
MooseFinderTest >> buildModel [
	"override this with a specific model you want to test"
	model := MooseModel new.
	^ model
]

{ #category : #utils }
MooseFinderTest >> getAllWindows [
	^ World submorphs select: #isSystemWindow

	"The following is really costly"
	"^ SystemWindow withAllSubclasses inject: #() into: [:sum :el | sum, el allInstances ]"
]

{ #category : #utils }
MooseFinderTest >> itemsToExclude [ 
	^ #('Distribution Map for these parts' 'Distribution Map for these elements')
]

{ #category : #running }
MooseFinderTest >> setUp [
	super setUp.
	self buildModel
]

{ #category : #running }
MooseFinderTest >> tearDown [
	super tearDown.
"	World doOneCycle."
"	(self getAllWindows copyWithoutAll: systemWindows) do: #delete."
]

{ #category : #tests }
MooseFinderTest >> testAsMooseFinderItemNamed [
	| entity1 entity2 model2 |
	entity1 := FamixJavaType new.
	entity1 name: 'hello'.
	entity2 := FamixJavaType new.
	entity2 name: 'hello2'.
	model := FamixJavaMooseModel new.
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
MooseFinderTest >> testDelete [

	"Raise an error since it is not in the root"
	self should: [[MooseModel new delete] valueSupplyingAnswer: true ] raise: Error.
	
	model := MooseModel new.
	self deny: (MooseModel root includes: model).
	MooseModel root add: model.
	self assert: (MooseModel root includes: model).

	[model delete] valueSupplyingAnswer: {'Are you sure to want to delete ', model mooseName printString, '?' . true}.
	self deny: (MooseModel root includes: model).

]

{ #category : #tests }
MooseFinderTest >> testIcon [
	self assert: MooseGroup new mooseIcon isForm
]

{ #category : #tests }
MooseFinderTest >> testIcons [
	#(#mooseNavigation #mooseSearch #famixNamespaceGroup #mooseImportMse #mooseSourceTextPartial #mooseAdd #famixClass #mooseCancel #famixInterface #famixAnnotationType #famixNamespace #mooseImportFuel #mooseProperties #mooseIcon #famixAttributeGroup #famixFunctionGroup #famixMethodGroup #mooseInspect #mooseSourceText #mooseDSM #mooseMetamodelGroup #icons #mooseRemove #famixPackageGroup #mooseSystemComplexity #famixMethod #mooseCycles #mooseMetamodelEntity #resetIcons #famixAttribute #famixFunction #mooseEvaluator #famixPackage #famixInterfaceGroup #mooseBlueprint #mooseAccept #mooseList #famixAnnotationTypeGroup #famixClassGroup #mooseDependencies #mooseImportSmalltalk)
		do: [ :k | self shouldnt: [ MooseIcons perform: k ] raise: Error ]
]

{ #category : #tests }
MooseFinderTest >> testMenuEntriesForAllClasses [

	self skip.
	"this test is failing randomly depending on order of other tests"

	self assertAllActionsOf: model allClasses
]

{ #category : #tests }
MooseFinderTest >> testMenuEntriesForClasses [

	self skip.
	"this test is failing randomly depending on order of other tests"

	self assertAllActionsOf: model allModelClasses
]

{ #category : #tests }
MooseFinderTest >> testMenuEntriesForMethods [

	self skip.
	"this test is failing randomly depending on order of other tests"

	self assertAllActionsOf: model allMethods
]

{ #category : #tests }
MooseFinderTest >> testMenuEntriesForNamespaces [

	self skip.
	"this test is failing randomly depending on order of other tests"

	self assertAllActionsOf: model allNamespaces
]

{ #category : #tests }
MooseFinderTest >> testMenuEntriesForPackages [

	self skip.
	"this test is failing randomly depending on order of other tests"

	self assertAllActionsOf: model allPackages
]

{ #category : #tests }
MooseFinderTest >> testMooseIcon [
	self assert: FAMIXEntity new mooseIcon isForm
]

{ #category : #tests }
MooseFinderTest >> testProperty [
	| entity |
	entity := FamixStEntity new.
	self assert: entity properties isEmpty.
	self assert: (entity propertyNamed: #aKey ifNil: [ 10 ]) equals: 10.
	entity propertyNamed: #aKey ifAbsentPut: 20.
	self assert: (entity propertyNamed: #aKey ifNil: [ 10 ]) equals: 20.
	self deny: entity properties isEmpty.
	self assert: entity complexPropertyPragmas isEmpty.
	self assert: entity notExistentMetricValue equals: -1
]
