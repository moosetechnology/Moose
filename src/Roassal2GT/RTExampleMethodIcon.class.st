Class {
	#name : #RTExampleMethodIcon,
	#superclass : #GtAbstractExampleMethod,
	#category : #'Roassal2GT-Examples'
}

{ #category : #private }
RTExampleMethodIcon >> basicForm [
	| iconSelector iconProvider icon64Mime |
	iconSelector := (self selector, 'Icon') asSymbol.
	((iconProvider := self provider) class canPerform: iconSelector) ifFalse: [ ^ nil ].
	icon64Mime := [ iconProvider perform: iconSelector ]
		on: Error
		do: [ ^ nil ].
	^ [ TRPlatform current formClass fromBinaryStream: 
			(TRPlatform current mimeDecodeToBytes: icon64Mime readStream) ]
		on: Error
		do: [ nil ]
]

{ #category : #testing }
RTExampleMethodIcon >> exists [
	^ super exists
		and: [ self methodClass includesSelector: (self selector, 'Icon') asSymbol ]
]
