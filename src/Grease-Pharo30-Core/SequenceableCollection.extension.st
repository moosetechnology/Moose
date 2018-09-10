Extension { #name : #SequenceableCollection }

{ #category : #'*Grease-Pharo30-Core' }
SequenceableCollection >> beginsWithSubCollection: aSequenceableCollection [
	"Some platforms implement #beginsWith: to answer true for an empty argument."
	^ self beginsWith: aSequenceableCollection
]

{ #category : #'*Grease-Pharo30-Core' }
SequenceableCollection >> endsWithSubCollection: aSequenceableCollection [
	"Some platforms implement #endsWith: to answer true for an empty argument."
	^ self endsWith: aSequenceableCollection
]

{ #category : #'*Grease-Pharo30-Core' }
SequenceableCollection >> sorted [
	^ self sorted: [ :a :b | a <= b ]
]
