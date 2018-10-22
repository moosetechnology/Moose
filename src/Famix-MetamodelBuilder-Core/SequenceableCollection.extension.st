Extension { #name : #SequenceableCollection }

{ #category : #'*Famix-MetamodelBuilder-Core' }
SequenceableCollection >> copyFromTheEndWhile: aBlock [

	| anIndex aLastIndex |
	
	aLastIndex := self size + 1.
	anIndex := self size.
	[ anIndex > 0 and: [ aBlock value: (self at: anIndex) ] ] 
		whileTrue: [ 
			aLastIndex := anIndex.
			anIndex := anIndex - 1 ].
		
	^ self copyFrom: aLastIndex to: self size
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
SequenceableCollection >> copyWhile: aBlock [

	| anIndex aLastIndex |
	
	aLastIndex := 0.
	anIndex := 1.
	[ anIndex <= self size and: [ aBlock value: (self at: anIndex) ] ] 
		whileTrue: [ 
			aLastIndex := anIndex.
			anIndex := anIndex + 1 ].
		
	^ self copyFrom: 1 to: aLastIndex
]
