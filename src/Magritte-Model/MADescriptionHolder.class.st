Class {
	#name : #MADescriptionHolder,
	#superclass : #MAValueHolder,
	#category : #'Magritte-Model-Utility'
}

{ #category : #'acessing-magritte' }
MADescriptionHolder class >> descriptionClasses [
	^ MAElementDescription withAllConcreteClasses asOrderedCollection
]

{ #category : #groups }
MADescriptionHolder class >> groupChoice [
	^ Set new
		add: MABooleanDescription;
		add: MASingleOptionDescription;
		add: MAMultipleOptionDescription;
		add: MAToOneRelationDescription;
		add: MAToManyRelationDescription;
		add: MAToManyScalarRelationDescription;		
		yourself
]

{ #category : #groups }
MADescriptionHolder class >> groupMagnitude [
	^ Set new
		add: MANumberDescription;
		add: MADurationDescription;
		add: MADateDescription;
		add: MATimeDescription;
		add: MATimeStampDescription;
		add: MADateAndTimeDescription;
		yourself
]

{ #category : #groups }
MADescriptionHolder class >> groupMisc [
	^ Set new
		add: MAFileDescription;
		add: MAClassDescription;
		add: MATableDescription;
		yourself
]

{ #category : #groups }
MADescriptionHolder class >> groupOf: aClass [ 
	(self groupText includes: aClass)
		ifTrue: [ ^ 'Text' ].
	(self groupChoice includes: aClass)
		ifTrue: [ ^ 'Choice' ].
	(self groupMagnitude includes: aClass)
		ifTrue: [ ^ 'Magnitude' ].
	(self groupPick includes: aClass)
		ifTrue: [ ^ 'Pick' ].
	(self groupMisc includes: aClass)
		ifTrue: [ ^ 'Miscellaneous' ].
	^ 'Other'
]

{ #category : #groups }
MADescriptionHolder class >> groupPick [
	^ Set new
		add: MAColorDescription;
		add: MATokenDescription;
		yourself
]

{ #category : #groups }
MADescriptionHolder class >> groupText [
	^ Set new
		add: MAStringDescription;
		add: MAMemoDescription;
		add: MASymbolDescription;
		add: MAPasswordDescription;
		yourself

]

{ #category : #'acessing-magritte' }
MADescriptionHolder >> descriptionValue [
	<magritteDescription>
	^ MASingleOptionDescription new
		reference: MAClassDescription new;
		options: self class descriptionClasses;
		selectorAccessor: 'contents';
		groupBy: #grouping;
		label: 'Type';
		priority: 20;
		yourself
]

{ #category : #initialization }
MADescriptionHolder >> initialize [
	super initialize.
	self contents: self class descriptionClasses first
]
