Extension { #name : #ImmediateLayout }

{ #category : #'*Ring2-Core' }
ImmediateLayout >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGImmediateLayout parent: (self host asRingMinimalDefinitionIn: anRGEnvironment)]

]
