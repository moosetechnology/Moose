Class {
	#name : #GLMWrapper,
	#superclass : #GLMImplicitBrowser,
	#category : #'Glamour-Browsers-Pharo8'
}

{ #category : #adding }
GLMWrapper >> addDefaultPane [
	self addPane: (GLMPane named: #default)
]

{ #category : #adding }
GLMWrapper >> defaultPane [ 
	^ self panes anyOne 
]

{ #category : #adding }
GLMWrapper >> initialize [
	super initialize.
	self addDefaultPane.
]

{ #category : #adding }
GLMWrapper >> innerPortEvent: aPortEvent [ 
	"We forward all inner ports to the outside world"
	aPortEvent portName = #entity ifFalse: [
		"We don't want to resend the transmission, but use a new SimpleTransmission." 
		(self pane port: aPortEvent portName) value: aPortEvent value]
]

{ #category : #adding }
GLMWrapper >> outerPortEvent: aPortEvent [ 
	"We only treat the #entity port, and for it we simply trigger 
	a transmission to the default pane"

	super outerPortEvent: aPortEvent.
	aPortEvent port name = #entity ifFalse: [^self].
	self newTransmission
		addActiveOrigin: (aPortEvent port); 
		destination: (self panes anyOne port: #entity); 
		transmit
]

{ #category : #adding }
GLMWrapper >> renderGlamorouslyOn: aRenderer [ 
	^ aRenderer renderWrapper: self
]
