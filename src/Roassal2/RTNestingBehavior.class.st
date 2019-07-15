"
A RTNestingBehavior is the root of classes to describes behavior when nesting.

Consider the following example:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
| v  es |
v := RTView new.
es := RTBox elementsOn: (1 to: 50).
back := (RTBox new color: Color red; size: 100) element.
v add: back.
v addAll: es.

RTFlowLayout new on: es.

RTNest new
	behavior: (RTTopLeftBehavior new);
	on: back nest: es.

""behavior: (RTTopLeftBehavior new);""

es @ RTPopup @ RTDraggable.
v
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTNestingBehavior,
	#superclass : #RTObject,
	#category : #'Roassal2-Core'
}

{ #category : #utility }
RTNestingBehavior >> centerOn: backElement elements: elements [
	"Public method. This method does the following actions:
		- resize the backElement to encompasse all the elements
		- translate all the elements on top of backElement
		- perform a layout if one is set"

	self centerOnTrachelShape: backElement trachelShape elements: elements
	
]

{ #category : #utility }
RTNestingBehavior >> centerOnTrachelShape: trachelShape elements: elements [
	"Public method. This method does the following actions:
		- resize the backElement to encompasse all the elements
		- translate all the elements on top of backElement
		- perform a layout if one is set"
	| encompassingRectangle off padding |
	padding := 5.
	encompassingRectangle := elements encompassingRectangle.

	trachelShape extent: (encompassingRectangle width + (padding * 2)) @ (encompassingRectangle height + (padding * 2)).

	off := trachelShape encompassingRectangle center - encompassingRectangle center. 
	off := off asIntegerPoint.
	elements do: [ :e | e translateBy: off ].
	
]

{ #category : #utility }
RTNestingBehavior >> makeElements: elements draggableBy: backElement [
	^ (backElement isKindOf: TRShape)
		ifTrue: [ self makeElements: elements draggableByTrachelShape: backElement ]
		ifFalse: [ self makeElements: elements draggableByTrachelShape: backElement trachelShape ]
]

{ #category : #utility }
RTNestingBehavior >> makeElements: elements draggableByTrachelShape: trachelShape [
	| callback |
	callback := TRTranslationCallback block: [ :shape :step | elements do: [ :e | e translateBy: step ] ].
	trachelShape addCallback: callback 
]

{ #category : #hooks }
RTNestingBehavior >> on: backElement setNested: elements [
	"Override this method to express a particular behavior"
	self centerOn: backElement elements: elements.
	self makeElements: elements draggableBy: backElement.
	self resize: backElement for: elements
]

{ #category : #utility }
RTNestingBehavior >> resize: backElement bounds: encompassingRectangle [
	"it translates backElement, but does not trigger events."
	| newRec padding |
	padding := 5.
	newRec := (encompassingRectangle topLeft - (padding @ padding)) extent: 
					((encompassingRectangle width + (padding * 2)) @ 
					 (encompassingRectangle height + (padding * 2))).

	backElement
		extent: (encompassingRectangle width + (padding * 2)) @ (encompassingRectangle height + (padding * 2)).	
	backElement translateTo: encompassingRectangle center
]

{ #category : #utility }
RTNestingBehavior >> resize: backElement for: elements [
	self resize: backElement bounds: elements encompassingRectangle.

]
