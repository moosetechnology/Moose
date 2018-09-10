"
I am a description of a password string, possible values are instances of ==String==. My visual representation could be a password field, where there are stars printed instead of the characters the user enters.
"
Class {
	#name : #MAPasswordDescription,
	#superclass : #MAStringDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #accessing }
MAPasswordDescription class >> label [
	^ 'Password'
]

{ #category : #visiting }
MAPasswordDescription >> acceptMagritte: aVisitor [
	aVisitor visitPasswordDescription: self
]

{ #category : #testing }
MAPasswordDescription >> isObfuscated: anObject [
	^ anObject notNil
		and: [ anObject isString
		and: [ anObject isEmpty not
		and: [ anObject allSatisfy: [ :each | each = $* ] ] ] ]
]

{ #category : #testing }
MAPasswordDescription >> isSortable [
	^ false
]

{ #category : #operators }
MAPasswordDescription >> obfuscated: anObject [
	^ String new: (self toString: anObject) size withAll: $*
]
