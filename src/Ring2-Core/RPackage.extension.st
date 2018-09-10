Extension { #name : #RPackage }

{ #category : #'*Ring2-Core' }
RPackage >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGPackageDefinition named: self name asSymbol parent: anRGEnvironment ]
]
