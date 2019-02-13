"
A RTResizeable is an interaction to enable resizing element.
Here is an example:
-=-=-=-=
v := RTView new.

s := RTBox new color: Color blue; width: [ :c | c numberOfVariables * 5 ]; height: #numberOfMethods.
e := s elementOn: RTView.

e @ RTResizeable.
v add: e.
-=-=-=-=

"
Class {
	#name : #RTSimpleResizable,
	#superclass : #RTInteraction,
	#category : #'Roassal2-Interactions-Resize'
}

{ #category : #hooks }
RTSimpleResizable >> createHandleFor: element [

	| handle |
	handle := (RTEllipse new size: 10) element.
	handle addCallback: (TRTranslationCallback block: [ :shape :step | 
		| tStep newSize |
		tStep := handle position - element encompassingRectangle bottomRight + (handle extent / 2).
		newSize := (element extent + (tStep)) max: (20 @ 20).
		element translateBy: (tStep / 2).
		element extent: newSize ]).
	handle @ RTDraggable.
	handle when: TRMouseLeave do: [ :evt | self removeResizeHandleOn: element ].

	^ handle
]

{ #category : #hooks }
RTSimpleResizable >> initializeElement: element [
	element when: TRMouseEnter do: [ :evt | self showResizeHandleOn: element ].
	element when: TRMouseLeave do: [ :evt | self removeResizeHandleOn: element ].
]

{ #category : #hooks }
RTSimpleResizable >> removeResizeHandleOn: element [
	| handle |
	(element attributes includesKey: #resizeHandle) ifFalse: [ ^ self ].
	handle := element attributeAt: #resizeHandle.
	handle remove.
	element attributes removeKey: #resizeHandle.
	element view signalUpdate
]

{ #category : #hooks }
RTSimpleResizable >> showResizeHandleOn: element [
	| handle |
	self removeResizeHandleOn: element.
	
	handle := self createHandleFor: element.
	
	element view add: handle.
	handle translateTo: element encompassingRectangle bottomRight - (handle extent / 2).
	element attributeAt: #resizeHandle put: handle. 
	element view signalUpdate
]
