Extension { #name : #GlobalVariable }

{ #category : #'*Ring2-Core' }
GlobalVariable >> asRingMinimalDefinitionIn: anRGEnvironment [ 

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGGlobalVariable named: self key asSymbol parent: anRGEnvironment].
]
