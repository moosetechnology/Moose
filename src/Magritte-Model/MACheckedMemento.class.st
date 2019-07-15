"
I cache values as my superclass and also remember the original values of the model at the time the cache is built. With this information I am able to detect edit conflicts and can prevent accidental loss of data by merging the changes.
"
Class {
	#name : #MACheckedMemento,
	#superclass : #MACachedMemento,
	#instVars : [
		'original'
	],
	#category : #'Magritte-Model-Memento'
}

{ #category : #testing }
MACheckedMemento >> hasConflict [
	"Answer ==true==, if there is an edit conflict."

	^ self hasChanged and: [ self isDifferent: self original to: self pullRaw ]
]

{ #category : #accessing }
MACheckedMemento >> original [
	^ original
]

{ #category : #actions }
MACheckedMemento >> reset [
	super reset.
	self setOriginal: self pullRaw
]

{ #category : #initialization }
MACheckedMemento >> setOriginal: aDictionary [
	original := aDictionary
]

{ #category : #actions }
MACheckedMemento >> validate [
	self hasConflict
		ifFalse: [ ^ super validate ].
	self reset.
	MAConflictError
		description: self magritteDescription
		signal: self magritteDescription conflictErrorMessage
]
