Extension { #name : #Collection }

{ #category : #'*Moose-Core' }
Collection >> asMooseGroup [
	^ MooseGroup withAll: self
]

{ #category : #'*Moose-Core' }
Collection >> commonSuperclass [
	"Answer the most specific common super class of the receiver's
	elements, returns Object on empty collections."

	| common |
	self isEmpty ifTrue: [ ^Object ].
	common := self anyOne class.
	self do: [ :each |
		Object == common ifTrue: [ ^Object ].
		[ each class includesBehavior: common ] whileFalse: [
			common := common superclass ]].
	^common
]
