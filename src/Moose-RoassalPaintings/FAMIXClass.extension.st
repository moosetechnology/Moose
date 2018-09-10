Extension { #name : #FAMIXClass }

{ #category : #'*Moose-RoassalPaintings-PackageBlueprint' }
FAMIXClass >> inheritedClasses [
	
	self flag: #fixme.
	^ #()
]

{ #category : #'*Moose-RoassalPaintings-PackageBlueprint' }
FAMIXClass >> inheritedClassesOutOfMyPackage [
	
	self flag: #fixme.
	^ #()
]

{ #category : #'*Moose-RoassalPaintings-PackageBlueprint' }
FAMIXClass >> sureInvokedClasses [
	
	self flag: #fixme.
	^ self queryAllOutgoingInvocations opposites
]

{ #category : #'*Moose-RoassalPaintings-PackageBlueprint' }
FAMIXClass >> sureInvokedClassesInto: aFAMIXPackage [ 
	
	self flag: #fixme.
	^ self sureInvokedClasses
]

{ #category : #'*Moose-RoassalPaintings-PackageBlueprint' }
FAMIXClass >> sureInvokingClasses [
	
	self flag: #fixme.
	^ self queryAllIncomingInvocations opposites
]

{ #category : #'*Moose-RoassalPaintings-PackageBlueprint' }
FAMIXClass >> sureInvokingClassesInto: aFAMIXPackage [ 
	
	self flag: #fixme.
	^ self sureInvokingClasses
]
