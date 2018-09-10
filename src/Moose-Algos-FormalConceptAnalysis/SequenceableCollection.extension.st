Extension { #name : #SequenceableCollection }

{ #category : #'*moose-algos-formalconceptanalysis' }
SequenceableCollection >> selectMask: anInteger [

	| selection |
	selection := WriteStream on: (self species withSize: self size).
	anInteger bitMaskDo: [ :index | selection nextPut: (self at: index) ].
	^selection contents
]
