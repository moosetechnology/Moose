Class {
	#name : #FAMIXFunctionTest,
	#superclass : #FAMIXNamedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXFunctionTest >> actualClass [
	^ FAMIXFunction
]

{ #category : #tests }
FAMIXFunctionTest >> testHandlingOfWrongSourceAnchor [
	"some exporters populate the name of a file in the sourceAnchor, 
	and this test checks that Moose can handle this situation"

	| function |
	function := self actualClass new.
	function sourceAnchor: (FAMIXSourceTextAnchor new source: 'pathtosomefile').
	self assert: function sourceText equals: 'pathtosomefile'
]

{ #category : #tests }
FAMIXFunctionTest >> testIsMethod [
	self assert: self actualClass new isMethod equals: false
]

{ #category : #tests }
FAMIXFunctionTest >> testIsPublic [
	| entity |
	entity := self actualClass new.
	entity isPublic: true.
	self deny: entity isPublic 
]
