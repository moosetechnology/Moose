"
I am a state that can be use to improve development efficiency. 

I keep the properties and the queries caches in two dictionary. Thus the user can easily flush only one kind of cache during development.
"
Class {
	#name : #MooseDevelopmentState,
	#superclass : #MooseEntityState,
	#category : #'Famix-Deprecated'
}

{ #category : #testing }
MooseDevelopmentState class >> isDeprecated [
	"Use MooseEntityState instead"

	^ true
]
