Extension { #name : #FamixTType }

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> accessorMethods [
	
	^ self methods select: #isPureAccessor
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> blueprint [
	^ FamixBlueprint new forType: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> implementationMethods [
	^ self methods select: #isInternalImplementation
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> initializers [

	^ self methods select: #isInitializer
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> interfaceMethods [
	^ self methods select: [:each | each isInternalImplementation not & each isInitializer not & each isPureAccessor not]
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> uml [
	| builder |
	builder := RSUMLClassBuilder new.
	builder classes: {self}.
	builder modelDescriptor
		instVars: #attributes;
		methodSelector: #name.
	builder build.
	^ builder canvas
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> viewBlueprint [
	<menuItem: 'Class blueprint' category: 'Visualize'>
	self blueprint openWithTitle: 'Blueprint of ' , self name
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> viewUML [
	<menuItem: 'UML class diagram' category: 'Visualize'>
	^ self uml openWithTitle: 'UML class diagram'
]
