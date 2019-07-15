"
I am called on every Morphic repaint cycle so you can update your visualization accordingly.

==#start== method is called when the animation has been added to the view (so you can prepare your animation)

==#refresh== is called on every repaint cycle (depending on the configured FPS many times every second)

==#hasCompleted== should return ==true== once your animation has completed it's purpose, then it is automatically removed/detached from the view.
"
Class {
	#name : #RTAnimation,
	#superclass : #RTObject,
	#instVars : [
		'cycleLength',
		'element'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #actions }
RTAnimation >> addedIn: trachelCanvas [
	"do nothing"
]

{ #category : #accessing }
RTAnimation >> after: aBlock [

]

{ #category : #accessing }
RTAnimation >> element [
	^ element
]

{ #category : #testing }
RTAnimation >> hasCompleted [
	self subclassResponsibility
]

{ #category : #public }
RTAnimation >> inView: aView [
	aView addAnimation: self
]

{ #category : #refreshing }
RTAnimation >> refresh [
	"called on every Morphic repaint cycle"
]

{ #category : #actions }
RTAnimation >> start [
	"Initialize and start your animation, called when the animation has been attached to the view."
	"To be overriden"
]
