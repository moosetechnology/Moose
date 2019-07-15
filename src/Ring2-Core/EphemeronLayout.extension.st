Extension { #name : #EphemeronLayout }

{ #category : #'*Ring2-Core' }
EphemeronLayout >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGEphemeronLayout parent: (self host asRingMinimalDefinitionIn: anRGEnvironment)]

]
