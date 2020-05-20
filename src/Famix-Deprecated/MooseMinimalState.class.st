"
Is a kind of NullPattern
"
Class {
	#name : #MooseMinimalState,
	#superclass : #MooseEntityState,
	#classInstVars : [
		'singelton'
	],
	#category : #'Famix-Deprecated'
}

{ #category : #testing }
MooseMinimalState class >> isDeprecated [
	"Use MooseEntityState instead"

	^ true
]
