Class {
	#name : #XMLCommentTest,
	#superclass : #XMLNodeTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #accessing }
XMLCommentTest >> nodeClass [
	^ XMLComment
]

{ #category : #tests }
XMLCommentTest >> testAcceptNodeVisitor [
	| visitor comment message |

	visitor := XMLRecordingNodeVisitor new.
	comment := self newNode.
	self
		assert: (comment acceptNodeVisitor: visitor) == comment;
		assert: visitor messageRecorder hasMessages.

	message := visitor messageRecorder nextMessage.
	self
		assert: message selector == #visitComment:;
		assert: message arguments = (Array with: comment);
		deny: visitor messageRecorder hasMessages.
]

{ #category : #tests }
XMLCommentTest >> testCanonicallyEquals [
	super testCanonicallyEquals.
	self assert:
		((self nodeClass string: 'test') canonicallyEquals:
			(self nodeClass string: 'test')).
	self deny:
		((self nodeClass string: 'test') canonicallyEquals:
			self newNode).
]

{ #category : #tests }
XMLCommentTest >> testIsComment [
	self assert: self newNode isComment
]

{ #category : #tests }
XMLCommentTest >> testSortKey [
	self assert: (self nodeClass string: 'test') sortKey = 'test'
]

{ #category : #tests }
XMLCommentTest >> testString [
	| comment |

	comment := self nodeClass string: self markupString.
	self
		assert: comment class == self nodeClass;
		assert: comment string = self markupString.

	comment := self newNode.
	self assert: comment string = ''.

	comment string: self markupString.
	self assert: comment string = self markupString.

	comment string: ''.
	self assert: comment string = ''.
]

{ #category : #tests }
XMLCommentTest >> testWriteXMLOn [
	self
		assert: self newNode printString = '<!---->';
		assert:
			(self nodeClass string: self markupString) printString =
				('<!--', self markupString, '-->')
]
