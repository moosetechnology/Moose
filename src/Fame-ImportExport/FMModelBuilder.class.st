Class {
	#name : #FMModelBuilder,
	#superclass : #Object,
	#instVars : [
		'client'
	],
	#category : #'Fame-ImportExport'
}

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

	client beginAttribute: attributeName.
	variant isBlock
		ifTrue: [ variant value ]
		ifFalse: [
			variant isArray
				ifTrue: [ variant do: [ :each |
					client primitive: each ] ]
				ifFalse: [ 
					client primitive: variant ]].
		
	client endAttribute: attributeName.
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
	 
	client beginDocument.
	body valueWithPossibleArgument: self.
	client endDocument.
]

{ #category : #DSL }
FMModelBuilder >> element: elementName with: body [ 
	"Addes an element with body (which is a block)."
	
	client beginElement: elementName.
	body value.
	client endElement: elementName
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

	reference isNumber
		ifTrue: [ client referenceNumber: reference ]
		ifFalse: [ client referenceName: reference asString ]
		
]
