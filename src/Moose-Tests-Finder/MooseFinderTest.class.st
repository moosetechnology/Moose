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
MooseFinderTest >> testMenuEntriesForAllClasses [

	self assertAllActionsOf: model allClasses
]

{ #category : #tests }
MooseFinderTest >> testMenuEntriesForClasses [

	self assertAllActionsOf: model allModelClasses
]

{ #category : #tests }
MooseFinderTest >> testMenuEntriesForMethods [

	self assertAllActionsOf: model allMethods
]

{ #category : #tests }
MooseFinderTest >> testMenuEntriesForNamespaces [

	self assertAllActionsOf: model allNamespaces
]

{ #category : #tests }
MooseFinderTest >> testMenuEntriesForPackages [

	self assertAllActionsOf: model allPackages
]
