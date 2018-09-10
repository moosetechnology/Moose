"
This is an abstract class for states to control tokenization. Subclasses must implement #nextTokenFrom: to send a tokenizing message to the argument tokenizer.
"
Class {
	#name : #XMLTokenizerState,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #accessing }
XMLTokenizerState class >> instance [
	^ instance
		ifNil: [instance := self basicNew initialize]
]

{ #category : #'instance creation' }
XMLTokenizerState class >> new [
	"all subclasses are stateless and have a single, immutable, shared instance"
	^ self instance
]

{ #category : #testing }
XMLTokenizerState >> canTerminateInput [
	^ true
]

{ #category : #changing }
XMLTokenizerState >> contentState [
	^ XMLContentState new
]

{ #category : #changing }
XMLTokenizerState >> doctypeDeclarationState [
	^ XMLDoctypeDeclarationState new
]

{ #category : #changing }
XMLTokenizerState >> externalSubsetState [
	^ XMLExternalSubsetState new
]

{ #category : #changing }
XMLTokenizerState >> internalSubsetState [
	^ XMLInternalSubsetState new
]

{ #category : #testing }
XMLTokenizerState >> isContentState [
	^ false
]

{ #category : #testing }
XMLTokenizerState >> isDoctypeDeclarationState [
	^ false
]

{ #category : #testing }
XMLTokenizerState >> isExternalSubsetState [
	^ false
]

{ #category : #testing }
XMLTokenizerState >> isInitializedState [
	^ true
]

{ #category : #testing }
XMLTokenizerState >> isInternalSubsetState [
	^ false
]

{ #category : #testing }
XMLTokenizerState >> isPostDoctypeDeclarationState [
	^ false
]

{ #category : #testing }
XMLTokenizerState >> isPrologState [
	^ false
]

{ #category : #testing }
XMLTokenizerState >> isTerminatedState [
	^ false
]

{ #category : #testing }
XMLTokenizerState >> isXMLDeclarationState [
	^ false
]

{ #category : #tokenizing }
XMLTokenizerState >> nextTokenFrom: aTokenizer [
	self subclassResponsibility
]

{ #category : #changing }
XMLTokenizerState >> postDoctypeDeclarationState [
	^ XMLPostDoctypeDeclarationState new
]

{ #category : #changing }
XMLTokenizerState >> prologState [
	^ XMLPrologState new
]

{ #category : #testing }
XMLTokenizerState >> supportsEncodingDetection [
	^ false
]

{ #category : #changing }
XMLTokenizerState >> terminatedState [
	^ XMLTerminatedState new
]
