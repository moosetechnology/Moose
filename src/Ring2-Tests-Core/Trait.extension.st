Extension { #name : #Trait }

{ #category : #'*Ring2-Tests-Core' }
Trait >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGTrait named: self name asSymbol parent: anRGEnvironment]. 
	
]
