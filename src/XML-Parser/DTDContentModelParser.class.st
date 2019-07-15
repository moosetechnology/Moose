"
This is a base class for DTD content model parsers that turn element declarations into XMLElementValidators.
"
Class {
	#name : #DTDContentModelParser,
	#superclass : #Object,
	#instVars : [
		'element',
		'contentModel'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDContentModelParser class >> element: anElement contentModel: aContentModel [
	^ self new
		setElement: anElement
		contentModel: aContentModel
]

{ #category : #accessing }
DTDContentModelParser class >> parserClassForContentModel: aContentModel [
	"the tokenizer removes all spaces from the content model
	and checks it for well-formedness"
	(aContentModel at: 1) == $(
		ifTrue: [
			(aContentModel at: 2) == $# "#PCDATA mixed content"
				ifTrue: [^ DTDMixedContentModelParser]
				ifFalse: [^ DTDElementContentModelParser]]
		ifFalse: [^ DTDLiteralContentModelParser]
]

{ #category : #defaults }
DTDContentModelParser class >> standaloneExternalClass [
	^ self
]

{ #category : #parsing }
DTDContentModelParser >> parse [
	self subclassResponsibility
]

{ #category : #initialization }
DTDContentModelParser >> setElement: anElement contentModel: aContentModel [
	element := anElement.
	contentModel := aContentModel.
]
