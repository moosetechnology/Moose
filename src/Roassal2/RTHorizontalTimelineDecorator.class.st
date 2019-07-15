"
RTHorizontalTimelineDecorator defines a separation between lined up group of events. Such a decoration simply needs to have a particular identifier. 

[[[ 
	data := #(#(c1 0 5) #(c1 6 8) #(c2 0 5) #(c2 8 10) #(c3 0 10) #(c4 5 10) #(c5 5 8)).

	b := RTTimeline new.
	
	s := RTTimelineSet new.
	s objects: data.
	s lineIdentifier: #first.
	s start: #second.
	s end: #third.
	b add: s.
	
	b axisX 
		numberOfLabels: 5;
		labelRotation: -45;
		labelConversion: [ :v | Date year: 2015 day: v ]. 

	p := RTHorizontalTimelineDecorator new.
	p addLineAboveIdentifier: 'c3'.
	p addLineAboveIdentifier: 'c2'.
	p shape line width: 3; color: (Color red).
	b addDecorator: p.

	b
]]]
"
Class {
	#name : #RTHorizontalTimelineDecorator,
	#superclass : #RTAbstractLineDecorator,
	#instVars : [
		'identifiers'
	],
	#category : #'Roassal2-Builder-Timeline'
}

{ #category : #adding }
RTHorizontalTimelineDecorator >> addLineAboveIdentifier: anIdentifier [
	"anIdentifier could be any object, not only a string"

	identifiers add: anIdentifier
]

{ #category : #initialization }
RTHorizontalTimelineDecorator >> gapBetweenTimeLines [
	^ 3
]

{ #category : #initialization }
RTHorizontalTimelineDecorator >> initialize [
	super initialize.
	identifiers := OrderedCollection new.
]

{ #category : #hooks }
RTHorizontalTimelineDecorator >> render [	
	| from to lineIdentifiers offset |
	lineIdentifiers := builder lineIdentifiers.
	identifiers do: [ :id |
		values add: (lineIdentifiers indexOf: id)
	].

	values do: [ :aValue |
		from := builder getPixelPositionOf: builder minX @ aValue.
		to := builder getPixelPositionOf: builder maxX @ aValue.
		offset := 0 @ (self gapBetweenTimeLines / 2).
		self lineFrom: from - offset to: to - offset ]
		
	
]
