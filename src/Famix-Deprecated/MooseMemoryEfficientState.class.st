"
I am a state keeping properties and queries cache in the same dictionary. 

The downside is that we cannot flush only one kind of cache.

The upside is that I use less memory. Since each MooseEntity have a state, it has a real impact in the end. 
"
Class {
	#name : #MooseMemoryEfficientState,
	#superclass : #MooseEntityState,
	#category : #'Famix-Deprecated'
}

{ #category : #testing }
MooseMemoryEfficientState class >> isDeprecated [
	"Use MooseEntityState instead"

	^ true
]
