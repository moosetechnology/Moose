Extension { #name : #FamixTType }

{ #category : #'*Famix-Visualizations' }
FamixTType >> accessorMethods [
	
	^ self methods select: #isPureAccessor
]

{ #category : #'*Famix-Visualizations' }
FamixTType >> blueprint [

	^ FamixTypeBlueprint forType: self
]

{ #category : #'*Famix-Visualizations' }
FamixTType >> inspectorShowBlueprint [

	<inspectorPresentationOrder: 10 title: 'Blueprint'>
	^ self blueprint asInspectorPresenter
]

{ #category : #'*Famix-Visualizations' }
FamixTType >> uml [

	^ FamixTypeUML forType: self
]
