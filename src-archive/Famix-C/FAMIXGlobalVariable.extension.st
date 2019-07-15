Extension { #name : #FAMIXGlobalVariable }

{ #category : #'*Famix-C' }
FAMIXGlobalVariable >> parentModule [
	<MSEProperty: #parentModule type: #FAMIXModule>
	<MSEComment: 'Module (typically a file) defining the global variable.'>
	^ self privateState 		
		attributeAt: #parentModule
		ifAbsentPut: [ nil ]
]

{ #category : #'*Famix-C' }
FAMIXGlobalVariable >> parentModule: aModule [
	^ self privateState 		
		attributeAt: #parentModule
		put: (FMMultivalueLink 
				on: self
				update: #globalVariables
				from: self parentModule
				to: aModule)
]
