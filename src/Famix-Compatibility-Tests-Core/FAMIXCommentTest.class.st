Class {
	#name : #FAMIXCommentTest,
	#superclass : #FAMIXSourcedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXCommentTest >> actualClass [
	^ FAMIXComment
]

{ #category : #tests }
FAMIXCommentTest >> testAddingComment [
	| cls |
	cls := FAMIXClass new.
	cls name: 'AClass'.
	self assert: cls mooseName == #AClass.
	self assert: cls comments isEmpty.
	cls addComment: 'This is a comment'.
	self assert: (cls comments allSatisfy: [ :c | c isKindOf: FAMIXComment ]).
	self assert: (cls comments at: 1) content equals: 'This is a comment'
]

{ #category : #tests }
FAMIXCommentTest >> testSourceText [
	| comment |
	comment := self actualClass new.
	self assert: comment sourceText isEmpty.
	comment content: 'something'.
	self assert: comment sourceText equals: 'something'.
	comment content: nil.
	self assert: comment sourceText isEmpty.
	comment
		sourceAnchor:
			(FAMIXSourceTextAnchor new
				source: 'something';
				yourself).
	self assert: comment sourceText equals: 'something'
]
