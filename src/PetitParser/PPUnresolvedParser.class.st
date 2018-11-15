"
This is a temporary placeholder or forward reference to a parser that has not been defined yet. If everything goes well it will eventually be replaced with the real parser instance.
"
Class {
	#name : #PPUnresolvedParser,
	#superclass : #PPParser,
	#category : #'PetitParser-Tools'
}

{ #category : #testing }
PPUnresolvedParser >> isUnresolved [
	^ true
]

{ #category : #parsing }
PPUnresolvedParser >> parseOn: aStream [
	self error: self printString , ' need to be resolved before execution.'
]
