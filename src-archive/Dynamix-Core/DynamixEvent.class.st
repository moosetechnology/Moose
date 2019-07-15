"
DMXEvent is an abstract representation of a dynamic event.

In its abstract form, it holds children events and a reference to the parent event. This structure models an execution tree.

As an extra piece of information, it also provides information regarding the duration of the execution:
- the duration can be encoded as a number in the duration instance variable or,
- as start and stop timestamps in the respective instance variables.

The source instance variable can hold a reference to possible information source. For example, the source can point to a log entry or a raw event.
"
Class {
	#name : #DynamixEvent,
	#superclass : #DynamixEntity,
	#instVars : [
		'parent',
		'children',
		'start',
		'stop',
		'duration',
		'source'
	],
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixEvent class >> annotation [
	<MSEClass: #Event super: #DynamixEntity>
	<package: #Dynamix>
]

{ #category : #'accessing-derived' }
DynamixEvent >> accumulatedLeavesDuration [
	<MSEProperty: #accumulatedLeavesDuration type: #Number> <derived>
	<MSEComment: 'This is a derived measure of duration that simply sums up the duration of all leaves'>
	| sum |
	sum := 0.
	self withAllChildrenDo: [:each | 
		each isLeaf ifTrue: [ sum := sum + each duration ]].
	^ sum
]

{ #category : #accessing }
DynamixEvent >> activations [
	^ self children 
]

{ #category : #accessing }
DynamixEvent >> addChild: event [

	children := self children copyWith: event.
	^self lastChild. 
]

{ #category : #accessing }
DynamixEvent >> allActivations [

	| stream |
	stream := OrderedCollection new writeStream.
	self allChildrenDo: [ :each | (each isActivation and: [each method notNil] ) ifTrue: [ stream nextPut: each ]].
	^stream contents
]

{ #category : #accessing }
DynamixEvent >> allChildren [
	<navigation: 'All children'>
	| stream |
	stream := OrderedCollection new writeStream.
	self allChildrenDo: [ :each | stream nextPut: each ].
	^stream contents
]

{ #category : #enumerating }
DynamixEvent >> allChildrenDo: aBlock [

	self childrenDo: [ :each |
		aBlock value: each.
		each allChildrenDo: aBlock ]
]

{ #category : #enumerating }
DynamixEvent >> allLeavesDo: aBlock [
	self withAllChildrenDo: [:each | each isLeaf ifTrue: [aBlock value: each] ].

]

{ #category : #enumerating }
DynamixEvent >> allNonleavesDo: aBlock [
	self withAllChildrenDo: [:each | each isLeaf ifFalse: [aBlock value: each] ].
]

{ #category : #enumerating }
DynamixEvent >> allParentsDo: aBlock [
	self parent isNil ifTrue: [^ self].
	aBlock value: self parent.
	self parent allParentsDo: aBlock
]

{ #category : #accessing }
DynamixEvent >> behaviour [
	^ nil
]

{ #category : #accessing }
DynamixEvent >> children [
	<MSEProperty: #children type: #DynamixEvent opposite: #parent> <derived> <multivalued>
	<MSEComment: 'Points to the events that are triggered from this event'>
	
	^ children
]

{ #category : #accessing }
DynamixEvent >> children: anObject [
	children value: anObject.
]

{ #category : #enumerating }
DynamixEvent >> childrenDo: aBlock [
	children notNil ifTrue: [ children do: aBlock ]
]

{ #category : #private }
DynamixEvent >> compact [

	self children isEmpty 
		ifTrue: [ children := nil ]
		ifFalse: [ children := self children asArray ]
]

{ #category : #converting }
DynamixEvent >> copyChildrenFilterSelect: aBlock parent: newParent [

	^children ifNotNil: [ 
		| stream |
		stream := (OrderedCollection new: children size * 2) writeStream.
		children do: [ :each |
			(aBlock value: each)
				ifTrue: [ 
					| newEvent |
					newEvent := each copy.
					newEvent children: (each copyChildrenFilterSelect: aBlock parent: newEvent).
					newEvent parent: newParent.
					stream nextPut: newEvent ]
				ifFalse: [
					| newChildren |
					newChildren := each copyChildrenFilterSelect: aBlock parent: newParent.
					newChildren ifNotNil: [ stream nextPutAll: newChildren ].
				]].
		stream contents ].
]

{ #category : #'accessing-derived' }
DynamixEvent >> depth [
	^ self isRoot
		ifTrue: [ 0 ]
		ifFalse: [ self parent depth + 1 ]
]

{ #category : #accessing }
DynamixEvent >> duration [
	"the duration between the start and stop of the activation.
	we are checking for the duration first, because some importers
	can possibly only set the duration instead of populating
	the start and stop time"
	
	^ duration ifNil: [
		duration := (self start notNil and: [self stop notNil]) 
			ifTrue: [self stop - self start]
			ifFalse: [-1] ]
]

{ #category : #accessing }
DynamixEvent >> duration: anObject [
	duration := anObject
]

{ #category : #initialize }
DynamixEvent >> initialize [
	super initialize.
	children := FMMultivalueLink 
		on: self
		opposite: #parent:
]

{ #category : #testing }
DynamixEvent >> isActivation [
	^self subclassResponsibility
]

{ #category : #testing }
DynamixEvent >> isLeaf [
	^ self children isEmpty
]

{ #category : #testing }
DynamixEvent >> isReturn [ 
	^ false
]

{ #category : #testing }
DynamixEvent >> isRoot [
	^ self parent isNil
]

{ #category : #testing }
DynamixEvent >> isSelfMessage [
	^ false
]

{ #category : #testing }
DynamixEvent >> isTrace [ 
	^ false
]

{ #category : #accessing }
DynamixEvent >> lastChild [
	"gets the last message event before the return"
	self children isEmpty ifTrue: [^self].
	^(self children last).
]

{ #category : #ui }
DynamixEvent >> mooseFinderChildrenTreeIn: composite [ 
	<moosePresentationOrder: 80>
	composite tree 
		titleIcon: MooseIcons mooseTree;
		title: 'Children tree';
		rootsExpanded;
		display: [:entity | {entity mooseInterestingEntity}];
		format: [:each | each gtDisplayString];
		children: [ :each | each children ];
		icon: #mooseIcon
]

{ #category : #accessing }
DynamixEvent >> nestingLevel [

	^ self isRoot 
		ifTrue: [ 0 ] 
		ifFalse: [ self parent nestingLevel + 1 ]
]

{ #category : #checking }
DynamixEvent >> numberOfMessageSends [
	| aNum |
	aNum := 0.
	^aNum.
]

{ #category : #checking }
DynamixEvent >> numberOfReturns [
	| aNum |
	aNum := 0.
"	self children do: [
		:eachChild  | (eachChild isKindOf: Return ) ifTrue: [aNum := aNum + 1]]."
	^aNum.
]

{ #category : #accessing }
DynamixEvent >> parent [
	<MSEProperty: #parent type: #DynamixEvent opposite: #children>
	<MSEComment: 'The parent simply points to the event from where this event was triggered'>

	^ parent
]

{ #category : #accessing }
DynamixEvent >> parent: anEvent [
	parent := FMMultivalueLink 
		on: self
		update: #children
		from: self parent
		to: anEvent
]

{ #category : #enumerating }
DynamixEvent >> parentsDetect: aBlock ifNone: anotherBlock [
	"This traverses the parents and stops when the first one matches aBlock.
	If none is found, we return the result of anotherBlock"
	
	self allParentsDo: [:each | 
		(aBlock value: each) ifTrue: [^ each] ].
	^ anotherBlock value
]

{ #category : #accessing }
DynamixEvent >> source [
	^ source
]

{ #category : #accessing }
DynamixEvent >> source: anObject [
	source := anObject
]

{ #category : #accessing }
DynamixEvent >> start [
	^ start
]

{ #category : #accessing }
DynamixEvent >> start: anObject [
	start := anObject
]

{ #category : #accessing }
DynamixEvent >> stop [
	^ stop
]

{ #category : #accessing }
DynamixEvent >> stop: anObject [
	stop := anObject
]

{ #category : #'accessing-derived' }
DynamixEvent >> trace [ 
	"the assumption is that the root of an event tree is a trace entity"
	
	^ self parent notNil 
		ifTrue: [ self parent trace ]
		ifFalse: [ nil ]
]

{ #category : #'accessing-derived' }
DynamixEvent >> withAllChildren [
	^ self allChildren copyWith: self
]

{ #category : #enumerating }
DynamixEvent >> withAllChildrenDo: aBlock [
	aBlock value: self.
	self allChildrenDo: aBlock
]

{ #category : #enumerating }
DynamixEvent >> withAllParentsDo: aBlock [
	aBlock value: self.
	self allParentsDo: aBlock
]

{ #category : #enumerating }
DynamixEvent >> withParentsDetect: aBlock ifNone: anotherBlock [
	"This traverses the parents including myself and stops when the first one matches aBlock.
	If none is found, we return the result of anotherBlock"
	
	self withAllParentsDo: [:each | 
		(aBlock value: each) ifTrue: [^ each] ].
	^ anotherBlock value
]
