Extension { #name : #FAMIXType }

{ #category : #'*Dynamix-Core' }
FAMIXType >> instances [
	<MSEProperty: #instances type: #DynamixInstance opposite: #type>
	<multivalued> <derived>
	<MSEComment: 'Dynamic instances of this type'>
	<package: #Dynamix>
	
	^ self privateState
		attributeAt: #instances 
		ifAbsentPut: [
			FMMultivalueLink 
				on: self
				opposite: #type: ]
	 
]

{ #category : #'*Dynamix-Core' }
FAMIXType >> instances: aCollectionOfInstances [	
	self instances value: aCollectionOfInstances
]
