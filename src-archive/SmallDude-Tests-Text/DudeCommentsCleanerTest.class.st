Class {
	#name : #DudeCommentsCleanerTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Text'
}

{ #category : #testing }
DudeCommentsCleanerTest >> testContainsCommentWithinString [
	| aCommentsCleaner |
	aCommentsCleaner := DudeCommentsCleaner new.
	self
		assert: (aCommentsCleaner containsComments: 'a = b + "/*this is not a comment*/"' wasOpenComment: False)
		equals: True
]

{ #category : #testing }
DudeCommentsCleanerTest >> testContainsEndCommentButNoStart [
	| aCommentsCleaner |
	aCommentsCleaner := DudeCommentsCleaner new.
	self
		assert: (aCommentsCleaner containsComments: 'a = b + 2; this is the end of a comment*/' wasOpenComment: False)
		equals: False
]

{ #category : #testing }
DudeCommentsCleanerTest >> testContainsEndCommentStartOnSameLine [
	| aCommentsCleaner |
	aCommentsCleaner := DudeCommentsCleaner new.
	self assert: (aCommentsCleaner containsComments: 'a = b + 2; /*this is a comment*/' wasOpenComment: False) equals: True
]

{ #category : #testing }
DudeCommentsCleanerTest >> testContainsLineComment [
	| aCommentsCleaner |
	aCommentsCleaner := DudeCommentsCleaner new.
	self assert: (aCommentsCleaner containsComments: 'a = b; //this is a line comment' wasOpenComment: False) equals: True
]

{ #category : #testing }
DudeCommentsCleanerTest >> testContainsStartComment [
	| aCommentsCleaner |
	aCommentsCleaner := DudeCommentsCleaner new.
	self
		assert: (aCommentsCleaner containsComments: 'a = b + 2; /*this is the begining of a comment' wasOpenComment: False)
		equals: True
]

{ #category : #testing }
DudeCommentsCleanerTest >> testGetIndexOf [
	| aCommentsCleaner |
	aCommentsCleaner := DudeCommentsCleaner new.
	self assert: (aCommentsCleaner getIndexOf: 'bla' in: '"bla"bla bla' startingAt: 1) equals: 6
]

{ #category : #testing }
DudeCommentsCleanerTest >> testGetIndexOfWithSupplementaryStrings [
	| aCommentsCleaner |
	aCommentsCleaner := DudeCommentsCleaner new.	"A string before the searched text and another one after"
	self assert: (aCommentsCleaner getIndexOf: 'bla' in: '"bubu"bla "bla"' startingAt: 1) equals: 7
]

{ #category : #testing }
DudeCommentsCleanerTest >> testInstantisation [ 
	 
	| aCommentsCleaner | 
	aCommentsCleaner := DudeCommentsCleaner new. 
	self assert: (aCommentsCleaner = nil) not
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanBeginCommentEndCommentOnNextLine [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd /*drg'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 2) equals: 'asd '.
	self assert: (aStringList at: 3) equals: ''
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanBeginCommentEndCommentOnSecondNextLine [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd /*drg'.
	aStringList add: 'dfghdh'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 2) equals: 'asd '.
	self assert: (aStringList at: 3) equals: ''.
	self assert: (aStringList at: 4) equals: ''
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanBeginCommentLineCommentEndCommentOnNextLine [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd /*sg//drg'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 2) equals: 'asd '.
	self assert: (aStringList at: 3) equals: ''
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanLineCommentAtBegining [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: '//sgdrg'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 2) equals: ''
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanLineCommentBeginComment [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd //sg/*drg'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 2) equals: 'asd '
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanLineCommentBeginCommentEndCommentOnNextLine [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd //sg/*drg'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 2) equals: 'asd '.
	self assert: (aStringList at: 3) equals: 'asdas*/'
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanLineCommentInMiddle [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd //sgdrg'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 2) equals: 'asd '
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanSlashSlashAfterString [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd "sg//drg" asd//asd'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 1) equals: 'sdfggfd'.
	self assert: (aStringList at: 2) equals: 'asd "sg//drg" asd'.
	self assert: (aStringList at: 3) equals: 'asdas*/'
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanSlashSlashBeforeString [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'a//sd "sg//drg" asd//asd'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 1) equals: 'sdfggfd'.
	self assert: (aStringList at: 2) equals: 'a'.
	self assert: (aStringList at: 3) equals: 'asdas*/'
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanSlashSlashWithinString [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd "sg//drg" asdasd'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 1) equals: 'sdfggfd'.
	self assert: (aStringList at: 2) equals: 'asd "sg//drg" asdasd'.
	self assert: (aStringList at: 3) equals: 'asdas*/'
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanSlashStarAfterString [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd "sg/*drg" as/*dasd'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 1) equals: 'sdfggfd'.
	self assert: (aStringList at: 2) equals: 'asd "sg/*drg" as'.
	self assert: (aStringList at: 3) equals: ''
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanSlashStarBeforeString [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'as/*d "sg/*drg" as/*dasd'.
	aStringList add: 'asd*/as*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 1) equals: 'sdfggfd'.
	self assert: (aStringList at: 2) equals: 'as'.
	self assert: (aStringList at: 3) equals: 'as*/'
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanSlashStarWithinString [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd "sg/*drg" asdasd'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 1) equals: 'sdfggfd'.
	self assert: (aStringList at: 2) equals: 'asd "sg/*drg" asdasd'.
	self assert: (aStringList at: 3) equals: 'asdas*/'
]

{ #category : #testing }
DudeCommentsCleanerTest >> testSpecificCleanStarSlashStar [
	| aStringList aCommentsCleaner |
	aStringList := OrderedCollection new.
	aStringList add: 'sdfggfd'.
	aStringList add: 'asd sg*/*drg asdasd'.
	aStringList add: 'asdas*/'.
	aCommentsCleaner := DudeCommentsCleaner new.
	aStringList := aCommentsCleaner specificClean: aStringList.
	self assert: (aStringList at: 1) equals: 'sdfggfd'.
	self assert: (aStringList at: 2) equals: 'asd sg*'.
	self assert: (aStringList at: 3) equals: ''
]
