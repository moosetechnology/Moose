Extension { #name : #SequenceableCollection }

{ #category : #'*GToolkit-Examples-Core' }
SequenceableCollection >> gtExampleSubstrings [
	^ (self gather: [ :each | each gtExampleSubstrings ])
		reject: [ :each | each isEmptyOrNil ]
]
