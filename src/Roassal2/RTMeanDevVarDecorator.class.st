"
=-=-=-=-
| b ds |
b := RTGrapher new.

ds := RTData new.
ds interaction popup.
ds points: #(600 470 170 430 300).
ds barShape width: 20; color: Color lightGreen.
b add: ds.

b axisX noLabel; noTick.
b axisY noDecimal.

b addDecorator: RTMeanDevVarDecorator new.
b 
=-=-=-=-
"
Class {
	#name : #RTMeanDevVarDecorator,
	#superclass : #RTAbstractGrapherDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #'as yet unclassified' }
RTMeanDevVarDecorator >> render [
	| values average from to l stdev b |
	values := self datasetValues.
	average := values average.
	
	"The variation"
	stdev := values stdev.
	from := builder getPixelPositionOf: builder minX @ (average - stdev).
	to := builder getPixelPositionOf: builder maxX @ (average + stdev).
	b := self boxFrom: from to: to.
	b @ (RTPopup text: 'stdev = ', stdev asString).
	
	"The mean"
	from := builder getPixelPositionOf: builder minX @ average.
	to := builder getPixelPositionOf: builder maxX @ average.
	l := self lineFrom: from to: to.
	l @ (RTPopup text: 'average = ', average asString).
	

]
