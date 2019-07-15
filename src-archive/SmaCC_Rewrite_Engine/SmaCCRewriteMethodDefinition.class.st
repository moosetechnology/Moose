Class {
	#name : #SmaCCRewriteMethodDefinition,
	#superclass : #SmaCCAbstractRewrite,
	#instVars : [
		'comment',
		'source',
		'method'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'instance creation' }
SmaCCRewriteMethodDefinition class >> comment: commentString source: aString [
	^ self new
		comment: commentString;
		source: aString;
		yourself
]

{ #category : #'instance creation' }
SmaCCRewriteMethodDefinition class >> source: aString [
	^ self new
		source: aString;
		yourself
]

{ #category : #accessing }
SmaCCRewriteMethodDefinition >> code: aString [
	self source: aString
]

{ #category : #accessing }
SmaCCRewriteMethodDefinition >> comment [
	^ comment ifNil: [ '' ]
]

{ #category : #accessing }
SmaCCRewriteMethodDefinition >> comment: aString [
	comment := aString.
	self changed: #comment
]

{ #category : #printing }
SmaCCRewriteMethodDefinition >> displayOn: aStream [
	self comment notEmpty
		ifTrue: [ aStream nextPutAll: self comment ]
		ifFalse: [ | stream |
			stream := ReadStream on: self source.
			aStream
				nextPutAll: 'Method: ';
				nextPutAll: stream nextLine ]
]

{ #category : #saving }
SmaCCRewriteMethodDefinition >> localSaveOn: aStream [
	self comment notEmpty
		ifTrue: [ aStream
				nextPut: $";
				nextPutAll: (self comment copyReplaceAll: '"' with: '""');
				nextPut: $";
				cr ].
	aStream
		nextPut: $#;
		nextPutAll: (self source copyReplaceAll: '!' with: '!!');
		nextPut: $!
]

{ #category : #accessing }
SmaCCRewriteMethodDefinition >> method [
	method isNil
		ifTrue: [ method := SmaCCRewriteMatchContext compiledMethodFor: self source ].
	^ method
]

{ #category : #rewriting }
SmaCCRewriteMethodDefinition >> performOn: aSmaCCNode continuation: aBlock [
	^ false
]

{ #category : #accessing }
SmaCCRewriteMethodDefinition >> source [
	^ source ifNil: [ 'yourself' ]
]

{ #category : #accessing }
SmaCCRewriteMethodDefinition >> source: aString [
	source := aString.
	method := nil.
	self changed: #source
]

{ #category : #rewriting }
SmaCCRewriteMethodDefinition >> updateClass: aClass [
	aClass addSelectorSilently: self method selector withMethod: self method
]
