Extension { #name : #Metaclass }

{ #category : #'*Fame-SmalltalkBinding' }
Metaclass >> isMetamodelEntity [
	^ self metamodelDefinitions isNotEmpty
]

{ #category : #'*Fame-SmalltalkBinding' }
Metaclass >> metamodelDefinitions [
	^ Pragma allNamed: #MSEClass:super: in: self
]
