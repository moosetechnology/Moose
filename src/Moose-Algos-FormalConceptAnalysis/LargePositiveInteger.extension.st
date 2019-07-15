Extension { #name : #LargePositiveInteger }

{ #category : #'*moose-algos-formalconceptanalysis' }
LargePositiveInteger >> bitMaskDo: aBlock [
	"Evaluates aBlock with the index of all bits that are set true."

	| mask byte index |
	mask := #(1 2 4 8 16 32 64 128).
	index := 0.
	"-- iterate over all bytes (called digits here)"
	1 to: self digitLength do: [ :byteIndex |
		byte := self digitAt: byteIndex.
		0 ~~ byte ifTrue: [
			1 to: 8 do: [ :each |
				0 ~~ ((mask at: each) bitAnd: byte) ifTrue: [
					aBlock value: index + each ]]].
		index := index + 8.
	].
]
