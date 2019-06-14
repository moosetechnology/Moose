Extension { #name : #Metaclass }

{ #category : #'*Fame-SmalltalkBinding' }
Metaclass >> isMetamodelEntity [
	^ self metamodelDefinitionPragmas isNotEmpty
]

{ #category : #'*Fame-SmalltalkBinding' }
Metaclass >> metamodelDefinitionPragmas [
	^ Pragma allNamed: #MSEClass:super: in: self
]
