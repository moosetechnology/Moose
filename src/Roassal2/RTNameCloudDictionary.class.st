Class {
	#name : #RTNameCloudDictionary,
	#superclass : #RTObject,
	#category : #'Roassal2-Builder-NameCloud'
}

{ #category : #hooks }
RTNameCloudDictionary >> unnecessaryWords [
	"Override to return the list of unnecessary words"
	self subclassResponsibility
]
