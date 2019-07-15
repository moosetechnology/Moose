"
This is a base class for stateless, immutable stream converter classes. Each subclass has a single instance that is shared.
"
Class {
	#name : #XMLStatelessStreamConverter,
	#superclass : #XMLStreamConverter,
	#classInstVars : [
		'instance'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #defaults }
XMLStatelessStreamConverter class >> abstractClass [
	^ XMLStatelessStreamConverter
]

{ #category : #accessing }
XMLStatelessStreamConverter class >> instance [
	^ instance ifNil: [instance := self basicNew initialize]
]

{ #category : #'instance creation' }
XMLStatelessStreamConverter class >> new [
	"all subclasses are stateless and have a single, immutable, shared instance"
	^ self instance
]
