Extension { #name : #ByteLayout }

{ #category : #'*Ring2-Core' }
ByteLayout >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGByteLayout parent: (self host asRingMinimalDefinitionIn: anRGEnvironment)]

]
