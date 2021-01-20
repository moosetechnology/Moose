Extension { #name : #FamixTType }

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> accessorMethods [
	
	^ self methods select: #isPureAccessor
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> blueprint [
	^ FamixTypeBlueprint forType: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> uml [
	^ FamixTypeUML forType: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> viewBlueprint [
	<menuItem: 'Class blueprint' category: 'Visualize'>
	self blueprint open
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> viewUML [
	<menuItem: 'UML class diagram' category: 'Visualize'>
	^ self uml open
]
