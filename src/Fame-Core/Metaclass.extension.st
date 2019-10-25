Extension { #name : #Metaclass }

{ #category : #'*Fame-Core' }
Metaclass >> isMetamodelEntity [
	^ self metamodelDefinitionPragma isNotNil
]

{ #category : #'*Fame-Core' }
Metaclass >> metamodelDefinitionPragma [
	^ (Pragma allNamed: #MSEClass:super: in: self)
		ifEmpty: [ nil ]
		ifNotEmpty: [ :p | 
			p size = 1 ifFalse: [ self error: 'It should not be possible to have two pragmas to define a FM3 class.' ].
			p anyOne ]
]
