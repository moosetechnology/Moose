"
A conditional shape can provide element(s) (instances of RTElement) with different shape(s) depending on a provided condition.

For example:
-=-=-=-=
| myRTGroup myObj |
myObj := #(1 2 3 'hola' 'chau').
myRTGroup := RTConditionalShape
	condition: [ : ref | ref isCollection ifTrue: [ RTEllipse ] ifFalse: [ RTBox ] ]
	elementsOn: myObj.
-=-=-=-=

Here is an example:
-=-=-=-=
v := RTView new.
v @ RTDraggableView.
shape := RTCompositeShape new.
shape add: RTLabel new.
shape add: (RTConditionalShape new 
    condition: [ : m | m hasComment 
        ifTrue: [ RTEllipse new color: (Color blue alpha: 0.3); size: 30 ] 
        ifFalse: [ RTBox new color: (Color red alpha: 0.3); size: 20 ] ]).
shape vertical.
es := shape elementsOn: RTShape withAllSubclasses.
RTFlowLayout on: es.
v addAll: es.
v
-=-=-=-=

Internal Representation and Key Implementation Points.

    Instance Variables
	condition:		<Object>


    Implementation Points
"
Class {
	#name : #RTConditionalShape,
	#superclass : #RTShape,
	#instVars : [
		'condition'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTConditionalShape >> condition [
	^ condition
]

{ #category : #accessing }
RTConditionalShape >> condition: anObject [
	condition := anObject
]

{ #category : #hooks }
RTConditionalShape >> trachelShapeClass [
	"Cancelled method"
]

{ #category : #public }
RTConditionalShape >> trachelShapeFor: anElement [
	| rtShape trachelShape |
	
	rtShape := self condition value: anElement model.
	trachelShape :=  rtShape trachelShapeClass new.
	rtShape updateFor: anElement trachelShape: trachelShape.
	^ trachelShape
]

{ #category : #hooks }
RTConditionalShape >> updateFor: edgeOrElement trachelShape: trachelShape [
	"Cancelled methods"
]
