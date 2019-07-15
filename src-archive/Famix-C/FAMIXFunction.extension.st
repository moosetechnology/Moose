Extension { #name : #FAMIXFunction }

{ #category : #'*Famix-C' }
FAMIXFunction >> parentModule [
	<MSEProperty: #parentModule type: #FAMIXModule>
	<MSEComment: 'Module (typically a file) defining the function.'>
	^ self privateState 		
		attributeAt: #parentModule
		ifAbsentPut: [ nil ]
]

{ #category : #'*Famix-C' }
FAMIXFunction >> parentModule: aModule [
	^ self privateState 		
		attributeAt: #parentModule
		put: (
			FMMultivalueLink 
				on: self
				update: #functions
				from: self parentModule
				to: aModule
			 )
]
