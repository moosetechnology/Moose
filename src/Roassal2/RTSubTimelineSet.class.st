"
RTSubTimelineSet new a set of events for the timeline. 
It takes a list of objects, lineIdentifier, start, end, and level.

Consider the following example:
[ [ [ 
	data := #(#(c1 0 5 1) #(c1 3 8 2) #(c2 0 9 1) #(c2 3 5 2) #(c2 6 8 2)).

	b := RTTimeline new.
	
	s := RTSubTimelineSet new.
	s objects: data.
	s lineIdentifier: #first.
	s start: #second.
	s end: #third.
	s level: #fourth.
	b add: s.
	
	b axisX 
		numberOfLabels: 5;
		labelRotation: -45;
		labelConversion: [ :v | Date year: 2015 day: v ]. 
	b
]]]
"
Class {
	#name : #RTSubTimelineSet,
	#superclass : #RTTimelineSet,
	#instVars : [
		'level'
	],
	#category : #'Roassal2-Builder-Timeline'
}

{ #category : #configuration }
RTSubTimelineSet >> gapBetweenLevels [
	^ 1
]

{ #category : #accessing }
RTSubTimelineSet >> level [
	^ level
]

{ #category : #accessing }
RTSubTimelineSet >> level: symbolOrBlockOrValue [
	"The argument will be evaluated on each element of objects."
	level := symbolOrBlockOrValue
]

{ #category : #'accessing - computed' }
RTSubTimelineSet >> numberOfLevels [
	^ self level rtValue: (self objects detectMax: [ :eachObject |
									self level rtValue: eachObject ]) 
]

{ #category : #rendering }
RTSubTimelineSet >> setRenderedHeight: timelineBuilder [
	shapeBuilder
		height:
			[ :obj | 
			(timelineBuilder extent y / timelineBuilder numberOfLines
				- self gapBetweenTimeLines) / self numberOfLevels - self gapBetweenLevels ]
]

{ #category : #rendering }
RTSubTimelineSet >> setRenderedYFor: element builder: timelineBuilder [
	^ (super setRenderedYFor: element builder: timelineBuilder)
		+ ((self level rtValue: element model) - 1 * element height)
]
