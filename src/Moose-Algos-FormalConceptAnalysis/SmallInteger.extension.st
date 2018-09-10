Extension { #name : #SmallInteger }

{ #category : #'*moose-algos-formalconceptanalysis' }
SmallInteger >> bitMaskDo: aBlock [
	"Evaluates aBlock with the index of all bits that are set true."

	| mask |
	mask := 1.
	1 to: self class maxBits do: [ :index |
		(mask anyMask: self) ifTrue: [ aBlock value: index ].
		mask := mask << 1 ].
]

{ #category : #'*moose-algos-formalconceptanalysis' }
SmallInteger class >> maxBits [
	"proted from VW. Didn't understand the visual works related code to the method subtractorFail. Hardcoded the value in the method that is thought to be related with the number of bits in a smallinteger. Results are correct so far.."
	^31
]
