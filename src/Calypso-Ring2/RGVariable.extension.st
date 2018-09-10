Extension { #name : #RGVariable }

{ #category : #'*Calypso-Ring2' }
RGVariable >> definitionString [
	"non special globals are defined by the symbol"
	^self isSpecial
		ifTrue: [super definitionString]
		ifFalse: [self name printString]

]

{ #category : #'*Calypso-Ring2' }
RGVariable >> isReadIn: aCompiledCode [
"TODO"
	^aCompiledCode readsSlot: self
]

{ #category : #'*Calypso-Ring2' }
RGVariable >> isWrittenIn: aCompiledCode [

"TODO"
	^aCompiledCode writesSlot: self
]
