Class {
	#name : #FamixSlotDeprecation,
	#superclass : #Deprecation,
	#category : #'Famix-BasicInfrastructure'
}

{ #category : #accessing }
FamixSlotDeprecation >> messageText [
	^ String
		streamContents: [ :str | 
			self shouldTransform ifTrue: [ str nextPutAll: 'Automatic deprecation code rewrite: ' ].
			str
				nextPutAll: 'The instance variable ';
				nextPutAll: context receiver name;
				nextPutAll: ' accessed in ';
				nextPutAll: context sender method name;
				nextPutAll: ' has been deprecated. ';
				nextPutAll: explanationString ]
]
