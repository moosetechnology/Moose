Extension { #name : #WordLayout }

{ #category : #'*Ring2-Core' }
WordLayout >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGWordLayout parent: (self host asRingMinimalDefinitionIn: anRGEnvironment)]

]
