"
I am a dyanmic variable and cache descriptions defined in the current call stack. I prevent infinite recursion when a description refers to itself.
"
Class {
	#name : #MADynamicDescriptionCache,
	#superclass : #MADynamicVariable,
	#category : #'Magritte-Model-Utility'
}

{ #category : #defaults }
MADynamicDescriptionCache class >> defaultValue [
	^ IdentityDictionary new
]
