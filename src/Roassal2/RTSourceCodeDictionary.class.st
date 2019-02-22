Class {
	#name : #RTSourceCodeDictionary,
	#superclass : #RTNameCloudDictionary,
	#category : #'Roassal2-Builder-NameCloud'
}

{ #category : #hooks }
RTSourceCodeDictionary >> unnecessaryWords [
	^ #(
	'self' 'super' 'ifTrue:' 'ifFalse:' 'ifTrue' 'ifFalse'
	)
]
