Class {
	#name : #FMModelBuilder,
	#superclass : #Object,
	#instVars : [
		'client'
	],
	#category : #'Fame-Tests'
}

{ #category : #'instance creation' }
FMModelBuilder class >> client: aClient [
	^ self new
		client: aClient;
		yourself
]

{ #category : #'DSL-synonyms' }
FMModelBuilder >> a: attributeName of: valueOrBodyOrArray [
	
	self attribute: attributeName with: valueOrBodyOrArray
]

{ #category : #'DSL-synonyms' }
FMModelBuilder >> add: attributeName with: valueOrBodyOrArray [
	
	self attribute: attributeName with: valueOrBodyOrArray
]

{ #category : #'DSL-synonyms' }
FMModelBuilder >> an: attributeName of: valueOrBodyOrArray [
	
	self attribute: attributeName with: valueOrBodyOrArray
]

{ #category : #DSL }
FMModelBuilder >> attribute: attributeName with: variant [
	"Adds an attribute with primitive value or array, or with given body."

	client
		inAttribute: attributeName
		do: [ variant isBlock
				ifTrue: [ variant value ]
				ifFalse: [ variant isArray ifTrue: [ variant do: [ :each | client primitive: each ] ] ifFalse: [ client primitive: variant ] ] ]
]

{ #category : #accessing }
FMModelBuilder >> client [
	^ client
]

{ #category : #accessing }
FMModelBuilder >> client: parseClient [ 
	client := parseClient
]

{ #category : #DSL }
FMModelBuilder >> document: body [
	"Creates a document with body (which is a block)."

	client inDocumentDo: [ body valueWithPossibleArgument: self ]
]

{ #category : #DSL }
FMModelBuilder >> element: elementName with: body [
	"Addes an element with body (which is a block)."

	client inElement: elementName do: [ body value ]
]

{ #category : #DSL }
FMModelBuilder >> id: index [

	client serial: index
]

{ #category : #'DSL-synonyms' }
FMModelBuilder >> new: elementName with: body [ 
	
	self element: elementName with: body
]

{ #category : #DSL }
FMModelBuilder >> ref: reference [
	client referenceNumber: (reference isNumber ifTrue: [ reference ] ifFalse: [ reference asString ])
]
