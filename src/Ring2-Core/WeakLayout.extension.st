Extension { #name : #WeakLayout }

{ #category : #'*Ring2-Core' }
WeakLayout >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGWeakLayout parent: (self host asRingMinimalDefinitionIn: anRGEnvironment)]

]
