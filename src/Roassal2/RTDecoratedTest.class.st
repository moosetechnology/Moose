"
A RTDecoratedTest is a test class for testing the behavior of RTDecorated
"
Class {
	#name : #RTDecoratedTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTDecoratedTest >> testShapeTooltipAction [
	| view element decoration yellowElement yellowPosition |
	view := RTView new.
	element := RTBox new size: 50; color: Color blue; element.
	decoration := RTDecoration new 
						shape: (RTEllipse new color: Color red; borderColor: Color black; size: 10)
							tooltip: 'Set red color' 
							action: [ :anElement | 
											anElement trachelShape color: Color red.
											anElement signalUpdate. ];
						shape: (RTEllipse new color: Color yellow; borderColor: Color black; size: 10)
							tooltip: 'Set yellow color'
							action: [ :anElement | 
											anElement trachelShape color: Color yellow.
											anElement signalUpdate. ];
						shape: (RTEllipse new color: Color green; borderColor: Color black; size: 10)
							tooltip: 'Set green color'
							action: [ :anElement | 
											anElement trachelShape color: Color green.
											anElement signalUpdate. ].
	element @ decoration @ RTDraggable.
	view add: element.
	"enter to the element -> display the decoration"
	self assert: view elements size equals: 1.
	element testCaseAnnounce: TRMouseEnter.
	self assert: view elements size equals: 4.
	"click on the yellow element"
	yellowElement := view elements detect: [ :eachElement |
		eachElement trachelShape color = Color yellow ].
	yellowElement testCaseAnnounce: TRMouseClick.
	self assert: element trachelShape color equals: Color yellow.
	"let's move the element -> the decoration should also move"
	yellowPosition := yellowElement position.
	element translateBy: 50@50.
	self assert: yellowElement position equals: yellowPosition + (50 @ 50).
	"leave the element -> remove the decoration"
	element testCaseAnnounce: TRMouseLeave.
	self assert: view elements size equals: 1.
]
