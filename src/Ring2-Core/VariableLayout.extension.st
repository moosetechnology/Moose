Extension { #name : #VariableLayout }

{ #category : #'*Ring2-Core' }
VariableLayout >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGVariableLayout parent: (self host asRingMinimalDefinitionIn: anRGEnvironment)]

]
