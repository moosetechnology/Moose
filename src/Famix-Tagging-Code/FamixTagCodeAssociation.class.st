"
Description
--------------------

I represent a one-to-one relationship between an entity and an interval of code that is tagged. 
	 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	sourceAnchor:		<aFamixSourceAnchor>		The source anchor containing the tagged code.
	start:					<aNumber>						The start position of the tagged code in the source anchor.
	stop:					<aNumber>						The end position of the tagged code in the source anchor.

"
Class {
	#name : #FamixTagCodeAssociation,
	#superclass : #FamixTagAssociation,
	#instVars : [
		'start',
		'stop',
		'sourceAnchor'
	],
	#category : #'Famix-Tagging-Code'
}

{ #category : #meta }
FamixTagCodeAssociation class >> annotation [
	<MSEClass: #IntervalAssociation super: #FamixTagAssociation>
	<package: #Tagging>
]

{ #category : #'instance creation' }
FamixTagCodeAssociation class >> newInterval: anInterval forEntity: anEntity sourceAnchor: anAnchor tag: aTAG [
	^ (self newForEntity: anEntity tag: aTAG)
		start: anInterval first;
		stop: anInterval last;
		sourceAnchor: anAnchor;
		yourself
]

{ #category : #testing }
FamixTagCodeAssociation >> hasSourceAnchor [
	^ self sourceAnchor isNotNil
]

{ #category : #testing }
FamixTagCodeAssociation >> isCodeTagAssociation [
	^ true
]

{ #category : #printing }
FamixTagCodeAssociation >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $[;
		print: self start;
		nextPutAll: ' - ';
		print: self stop;
		nextPut: $]
]

{ #category : #accessing }
FamixTagCodeAssociation >> sourceAnchor [
	<MSEProperty: #sourceAnchor type: #FamixTSourceAnchor>
	<MSEComment: 'The tagging for an interval can point a specific source anchor if there is multiple files for an entity'>
	^ sourceAnchor
]

{ #category : #accessing }
FamixTagCodeAssociation >> sourceAnchor: anObject [
	sourceAnchor := anObject
]

{ #category : #accessing }
FamixTagCodeAssociation >> start [
	<MSEProperty: #start type: #Number>
	<MSEComment: 'the start position of tagging'>
	
	^ start
]

{ #category : #accessing }
FamixTagCodeAssociation >> start: anObject [
	start := anObject
]

{ #category : #accessing }
FamixTagCodeAssociation >> stop [
	<MSEProperty: #stop type: #Number>
	<MSEComment: 'the stop position of tagging'>
	
	^ stop
]

{ #category : #accessing }
FamixTagCodeAssociation >> stop: anObject [
	stop := anObject
]
