Class {
	#name : #MooseFinderTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'systemWindows'
	],
	#category : #'Moose-Finder-Tests'
}

{ #category : #utilities }
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

{ #category : #utilities }
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
	group ifEmpty: [ ^ self ].
	allActionMorphs := self allActionMorphsIn: group mooseMenu.
	allActionMorphs do: [ :action | self assertAction: action ]
]

{ #category : #running }
MooseFinderTest >> buildModel [
	"override this with a specific model you want to test"
	model := MooseModel new.
	^ model
]

{ #category : #utilities }
MooseFinderTest >> getAllWindows [
	^ World submorphs select: #isSystemWindow

	"The following is really costly"
	"^ SystemWindow withAllSubclasses inject: #() into: [:sum :el | sum, el allInstances ]"
]

{ #category : #utilities }
MooseFinderTest >> itemsToExclude [ 
	^ #('Distribution Map for these parts' 'Distribution Map for these elements')
]

{ #category : #running }
MooseFinderTest >> setUp [
	super setUp.
	self buildModel
]

{ #category : #tests }
MooseFinderTest >> testDelete [
	"Raise an error since it is not in the root"

	self should: [ [ MooseModel new delete ] valueSupplyingAnswer: true ] raise: Error.

	model := MooseModel new.
	self deny: (MooseModel root includes: model).
	MooseModel root add: model.
	self assert: (MooseModel root includes: model).

	[ model delete ] valueSupplyingAnswer: {('Are you sure to want to delete ' , model mooseName printString , '?') . true}.
	self deny: (MooseModel root includes: model)
]

{ #category : #tests }
MooseFinderTest >> testIcon [
	self assert: MooseGroup new mooseIcon isForm
]

{ #category : #tests }
MooseFinderTest >> testIcons [

	#( #mooseNavigation #famixNamespaceGroup
	   #mooseImportMse #mooseSourceTextPartial #mooseAdd #famixClass
	   #mooseCancel #famixInterface #famixAnnotationType
	   #famixNamespace #mooseImportFuel #mooseProperties #mooseIcon
	   #famixAttributeGroup #famixFunctionGroup #famixMethodGroup
	   #mooseSourceText #mooseDSM #mooseMetamodelGroup
	   #icons #mooseRemove #famixPackageGroup #mooseSystemComplexity
	   #famixMethod #mooseCycles #mooseMetamodelEntity
	   #resetIcons #famixAttribute #famixFunction #mooseEvaluator
	   #famixPackage #famixInterfaceGroup #mooseBlueprint #mooseAccept
	   #mooseList #famixAnnotationTypeGroup #famixClassGroup
	   #mooseDependencies #mooseImportSmalltalk ) do: [ :k | 
		self shouldnt: [ MooseIcons perform: k ] raise: Error ]
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

	self assert: MooseEntity new mooseIcon isForm
]

{ #category : #tests }
MooseFinderTest >> testProperty [

	| entity |
	entity := MooseEntity new.
	self assert: (entity propertyNamed: #aKey ifNil: [ 10 ]) equals: 10.
	entity propertyNamed: #aKey ifAbsentPut: 20.
	self assert: (entity propertyNamed: #aKey ifNil: [ 10 ]) equals: 20.
	self denyEmpty: entity properties.
	self assert: entity notExistentMetricValue equals: -1
]
