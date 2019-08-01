Class {
	#name : #FamixJavaCommentTest,
	#superclass : #FamixJavaSourcedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaCommentTest >> actualClass [ 
		^ FamixJavaComment
]

{ #category : #tests }
FamixJavaCommentTest >> testAddingComment [
	| cls |
	cls := FamixJavaClass new.
	cls name: 'AClass'.
	self assert: cls mooseName == #AClass.
	self assert: cls comments isEmpty.
	cls addComment: (FamixJavaComment new content: 'This is a comment'; yourself ).
	self assert: (cls comments allSatisfy: [ :c | c isKindOf: FamixJavaComment ]).
	self assert: (cls comments at: 1) content equals: 'This is a comment'
]

{ #category : #tests }
FamixJavaCommentTest >> testSourceText [
	| comment |
	comment := self actualClass new.
	self assert: comment sourceText isEmpty.
	comment content: 'something'.
	self assert: comment sourceText equals: 'something'.
	comment content: nil.
	self assert: comment sourceText isEmpty.
	comment
		sourceAnchor:
			(FamixJavaSourceTextAnchor new
				source: 'something';
				yourself).
	self assert: comment sourceText equals: 'something'
]
