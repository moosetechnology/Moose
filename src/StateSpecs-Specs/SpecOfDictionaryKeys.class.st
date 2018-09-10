"
I describe any dictionare which contains particular key.

	(Dictionary newFromPairs: #(key value)) should includeKey: #key

My instances can be created by 

	SpecOfDictionaryKeys requiredKey: #key
 
Internal Representation and Key Implementation Points.

    Instance Variables
	requiredKey:		<Object>
"
Class {
	#name : #SpecOfDictionaryKeys,
	#superclass : #SpecOfCollection,
	#instVars : [
		'requiredKey'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfDictionaryKeys class >> requiredKey: anObject [ 
	^self new requiredKey: anObject
]

{ #category : #testing }
SpecOfDictionaryKeys >> basicMatches: aCollection [ 
	^aCollection includesKey: requiredKey
]

{ #category : #displaying }
SpecOfDictionaryKeys >> defaultTitle [
	^'include key ' , requiredKey stringForSpecTitle
]

{ #category : #accessing }
SpecOfDictionaryKeys >> requiredKey [
	^requiredKey
]

{ #category : #accessing }
SpecOfDictionaryKeys >> requiredKey: anObject [ 
	requiredKey := anObject
]
