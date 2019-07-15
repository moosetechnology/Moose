Extension { #name : #Class }

{ #category : #'*Ring2-Core' }
Class >> asRingMinimalCommentDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: ('classComment:', self name) asSymbol ifAbsentRegister: [
		RGComment parent: (self asRingMinimalDefinitionIn: anRGEnvironment).
	]. 
	
]

{ #category : #'*Ring2-Core' }
Class >> asRingMinimalDefinitionIn: anRGEnvironment [

	^ anRGEnvironment backend definitionFor: self ifAbsentRegister: [
		RGClass named: self name asSymbol parent: anRGEnvironment]. 
	
]

{ #category : #'*Ring2-Core' }
Class >> ensureRingDefinitionIn: anRGEnvironment [

	^ anRGEnvironment ask behaviors 
		detect: [:each | each name = self name] 
		ifNone: [ 
			| behaviorModel |
			behaviorModel := self asRingMinimalDefinitionIn: anRGEnvironment.
			anRGEnvironment addBehavior: behaviorModel.
			behaviorModel]
]
