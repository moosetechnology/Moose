Class {
	#name : #FMModelScripter,
	#superclass : #Object,
	#instVars : [
		'client'
	],
	#category : #'Fame-Tests'
}

{ #category : #'instance creation' }
FMModelScripter class >> client: aClient [
	^ self new
		client: aClient;
		yourself
]

{ #category : #'DSL-synonyms' }
FMModelScripter >> a: attributeName of: valueOrBodyOrArray [
	
	self property: attributeName with: valueOrBodyOrArray
]

{ #category : #'DSL-synonyms' }
FMModelScripter >> add: attributeName with: valueOrBodyOrArray [
	
	self property: attributeName with: valueOrBodyOrArray
]

{ #category : #'DSL-synonyms' }
FMModelScripter >> an: attributeName of: valueOrBodyOrArray [
	
	self property: attributeName with: valueOrBodyOrArray
]

{ #category : #accessing }
FMModelScripter >> client [
	^ client
]

{ #category : #accessing }
FMModelScripter >> client: parseClient [ 
	client := parseClient
]

{ #category : #DSL }
FMModelScripter >> document: body [
	"Creates a document with body (which is a block)."

	client inDocumentDo: [ body valueWithPossibleArgument: self ]
]

{ #category : #DSL }
FMModelScripter >> element: elementName with: body [
	"Addes an element with body (which is a block)."

	client inEntity: elementName do: [ body value ]
]

{ #category : #DSL }
FMModelScripter >> id: index [

	client serial: index
]

{ #category : #'DSL-synonyms' }
FMModelScripter >> new: elementName with: body [ 
	
	self element: elementName with: body
]

{ #category : #DSL }
FMModelScripter >> property: attributeName with: variant [
	"Adds a property with primitive value or array, or with given body."

	client
		inProperty: attributeName
		do: [ variant isBlock
				ifTrue: [ variant value ]
				ifFalse: [ variant isArray ifTrue: [ variant do: [ :each | client primitive: each ] ] ifFalse: [ client primitive: variant ] ] ]
]

{ #category : #DSL }
FMModelScripter >> ref: reference [
	client referenceNumber: (reference isNumber ifTrue: [ reference ] ifFalse: [ reference asString ])
]
