Class {
	#name : #FamixStCommentTest,
	#superclass : #FamixStSourcedEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStCommentTest >> actualClass [ 
		^ FamixStComment
]

{ #category : #tests }
FamixStCommentTest >> testAddingComment [
	| cls |
	cls := FamixStClass new.
	cls name: 'AClass'.
	self assert: cls mooseName == #AClass.
	self assert: cls comments isEmpty.
	cls addComment: (FamixStComment new content: 'This is a comment'; yourself).
	self assert: (cls comments allSatisfy: [ :c | c isKindOf: FamixStComment ]).
	self assert: (cls comments at: 1) content equals: 'This is a comment'
]

{ #category : #tests }
FamixStCommentTest >> testSourceText [
	| comment |
	comment := self actualClass new.
	self assert: comment sourceText isEmpty.
	comment content: 'something'.
	self assert: comment sourceText equals: 'something'.
	comment content: nil.
	self assert: comment sourceText isEmpty.
	comment
		sourceAnchor:
			(FamixStSourceTextAnchor new
				source: 'something';
				yourself).
	self assert: comment sourceText equals: 'something'
]
