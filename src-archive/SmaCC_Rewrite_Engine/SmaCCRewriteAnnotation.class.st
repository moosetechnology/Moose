Class {
	#name : #SmaCCRewriteAnnotation,
	#superclass : #Object,
	#instVars : [
		'nodeClass',
		'nodeInterval',
		'rewrite'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'instance creation' }
SmaCCRewriteAnnotation class >> onNode: aSmaCCParseNode rewrite: aSmaCCRewrite [
	^ self new
		nodeClass: aSmaCCParseNode class;
		nodeInterval: (aSmaCCParseNode startPosition to: aSmaCCParseNode stopPosition);
		rewrite: aSmaCCRewrite;
		yourself
]

{ #category : #comparing }
SmaCCRewriteAnnotation >> = anObject [
	^ self class = anObject class
		and:
			[ self nodeClass = anObject nodeClass
				and:
					[ self nodeInterval = anObject nodeInterval
						and: [ self rewrite = anObject rewrite ] ] ]
]

{ #category : #comparing }
SmaCCRewriteAnnotation >> hash [
	^ (nodeClass hash bitXor: nodeInterval hash) bitXor: rewrite hash
]

{ #category : #accessing }
SmaCCRewriteAnnotation >> nodeClass [
	^ nodeClass
]

{ #category : #accessing }
SmaCCRewriteAnnotation >> nodeClass: aBehavior [
	nodeClass := aBehavior
]

{ #category : #accessing }
SmaCCRewriteAnnotation >> nodeInterval [
	^ nodeInterval
]

{ #category : #accessing }
SmaCCRewriteAnnotation >> nodeInterval: anInterval [
	nodeInterval := anInterval
]

{ #category : #printing }
SmaCCRewriteAnnotation >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: nodeClass;
		print: nodeInterval;
		nextPutAll: ', ';
		nextPutAll: rewrite displayString;
		nextPut: $)
]

{ #category : #accessing }
SmaCCRewriteAnnotation >> rewrite [
	^ rewrite
]

{ #category : #accessing }
SmaCCRewriteAnnotation >> rewrite: aSmaCCRewrite [
	rewrite := aSmaCCRewrite
]
