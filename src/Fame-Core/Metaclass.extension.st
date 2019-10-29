Extension { #name : #Metaclass }

{ #category : #'*Fame-Core' }
Metaclass >> isMetamodelEntity [
	^ self metamodelDefinitionPragma isNotNil
]

{ #category : #'*Fame-Core' }
Metaclass >> metamodelDefinitionPragma [
	"29 of October 2019: The MSEClass:super: pragma is deprecated and should not be used anymore. But we still keep it for some time for backward compatibility."

	^ (Pragma allNamed: #FMClass:super: in: self) , (Pragma allNamed: #MSEClass:super: in: self)
		ifEmpty: [ nil ]
		ifNotEmpty: [ :p | 
			p size = 1 ifFalse: [ self error: 'It should not be possible to have two pragmas to define a FM3 class.' ].
			p anyOne ]
]
