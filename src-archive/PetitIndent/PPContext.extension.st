Extension { #name : #PPContext }

{ #category : #'*PetitIndent' }
PPContext >> MPPStack [
	^ self globalAt: #mppstack ifAbsentPut: [ Stack with: 1 ]
]

{ #category : #'*PetitIndent' }
PPContext >> column [
	^ stream column
]

{ #category : #'*PetitIndent' }
PPContext >> indentStack [
	^ self propertyAt: #indentStack ifAbsentPut: [ IndentStack new ]
]

{ #category : #'*PetitIndent' }
PPContext >> lastIndent [
	^ self indentTraces lastIndent
]
