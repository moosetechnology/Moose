"
self new openOn: MooseModel root
"
Class {
	#name : #MooseFinder,
	#superclass : #GLMCompositePresentation,
	#category : #'Moose-Finder'
}

{ #category : #utilities }
MooseFinder class >> announcerFor: anObject [
	^ (anObject respondsTo: #announcer) 
		ifTrue: [anObject announcer] 
		ifFalse: [Announcer new]
]

{ #category : #accessing }
MooseFinder class >> extensionsPragma [
	^ #gtInspectorPresentationOrder:
]

{ #category : #building }
MooseFinder >> compose [
	super compose.
	self pager
		title: [ :each | 'Moose Finder on ' , each mooseInterestingEntity gtDisplayString ];
		show: [ :a :each | 
			a
				title: each mooseInterestingEntity gtDisplayString , ' (' , each mooseInterestingEntity class name , ')';
				dynamicActions: [ :list | list entity mooseInterestingEntity mooseFinderActions asOrderedCollection , each gtInspectorActions asOrderedCollection ].
			each mooseInterestingEntity gtInspectorPresentationsIn: a inContext: self.
			a updateOn: MooseEntityAdded from: [ each ifNil: [ nil ] ifNotNil: [ each announcer ] ].
			a updateOn: MooseEntityRemoved from: [ each ifNil: [ nil ] ifNotNil: [ each announcer ] ].
			a updateOn: MooseEntityRenamed from: [ each ifNil: [ nil ] ifNotNil: [ each announcer ] ] ]
]

{ #category : #accessing }
MooseFinder >> panes [
	^ self first panes
]

{ #category : #asserting }
MooseFinder >> shouldDisplayPresentationCreatedBy: aMethod [

	^ self pager shouldDisplayPresentationCreatedBy: aMethod
]
