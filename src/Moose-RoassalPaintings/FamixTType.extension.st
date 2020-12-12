Extension { #name : #FamixTType }

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> accessorMethods [
	
	^ self methods select: #isPureAccessor
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> addBlueprintLegendOn: view [

	| lb |
	lb := RTLegendBuilder new.
	lb onDemand.
	lb view: view.

	lb addColoredText: 'Class Blueprint' color: Color black.
	lb addText: 'large box = class'.
	lb addText: 'Each class is composed of 5 part, from left to right'.
	lb addText: '  constructor, public methods, private methods, accessors, variables'.
	lb addLineColor: Color cyan text: 'variable access'.
	lb addLineColor: Color gray text: 'method invocation'.
	lb addColor: Color red text: 'Setter'.
	lb addColor: Color orange text: 'Getter'.
	lb addColor: Color cyan text: 'Abstract'.
	lb addColor: Color brown text: 'Overriding'.
	lb addColor: Color gray text: 'Constant'.
	lb build.
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
FamixTType >> viewBlueprint [
	<menuItem: 'Class blueprint' category: 'Visualize'>
	(FamixBlueprint new view: self) open
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTType >> viewBlueprintOn: view [
	^ FamixBlueprint new view: self on: view
]
