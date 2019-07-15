Extension { #name : #Interval }

{ #category : #'*Grease-Pharo30-Core' }
Interval >> any [
	"#first (used by SequenceableCollection>>anyOne) is an accessor of
	Interval and does not error on an empty Interval."
	
	^ self at: 1
]
