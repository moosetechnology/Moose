"
self new openOn: MooseModel root
"
Class {
	#name : #MooseFinder,
	#superclass : #GLMCompositePresentation,
	#category : #'Moose-Finder'
}

{ #category : #utils }
MooseFinder class >> announcerFor: anObject [
	^ (anObject respondsTo: #announcer) 
		ifTrue: [anObject announcer] 
		ifFalse: [Announcer new]
]

{ #category : #building }
MooseFinder >> compose [
	self pager 
"		act: [:b | b update] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Update';
"		title: [:each | 'Moose Finder on ', each mooseInterestingEntity gtDisplayString];
		show: [ :a :each |
			a 	
				title: ((each mooseInterestingEntity gtDisplayString), ' (', 
							each mooseInterestingEntity class name, ')');
				dynamicActions: [ :list | list entity mooseInterestingEntity mooseFinderActions ].
			each mooseInterestingEntity mooseFinderPresentationsIn: a inContext: self.
			a 
				updateOn: MooseEntityAdded 
				from: [ each isNil ifFalse: [each announcer] ifTrue: [nil] ].
			a 
				updateOn: MooseEntityRemoved 
				from: [ each isNil ifFalse: [each announcer] ifTrue: [nil] ].
			a	
				updateOn: MooseEntityRenamed 
				from: [ each isNil ifFalse: [each announcer] ifTrue: [nil] ]].

]

{ #category : #accessing }
MooseFinder >> panes [
	^ self first panes
]
