Extension { #name : #FamixTypeGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> blueprintComplexity [
	^ FamixTypeGroupBlueprintComplexity forTypeGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> nesting [
	^ FamixTypeGroupNesting forTypeGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> systemAttraction [
	^ FamixTypeGroupSystemAttraction forTypeGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> systemComplexity [
	^ FamixTypeGroupSystemComplexity forTypeGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> uml [
	^ FamixTypeUML forTypeGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewSimpleSystemComplexityWithSelection: selectedClassGroup height: heightBlock width: widthBlock color: colorBlock on: view [
	view shape box
		height: heightBlock;
		width: widthBlock;
		borderColor: Color gray;
		if: [ :each | selectedClassGroup includes: each ] borderColor: Color red.
	view interaction menu: [ :each | each mooseMenuMorph ].
	view interaction draggable.
	view nodes: self entities.
	view interaction popup textElement: [ :e | e model printString ].
	view shape shape: RTLine new.
	view edges connectFrom: [:c | c superclass].
	view treeLayout.
	view normalizer
		normalizeColor: colorBlock
		using:
			{Color white.
			Color black}
	"view edges do: [ :e | e trachelShape pushBack ]."
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewSystemComplexityInWizard [
	<menuItem: 'Customizable System Complexity' category: 'Visualize'>
	self ifEmpty: [ ^ self ].
	^ MooseCustomizableSystemComplexityBrowser
		openOnClassGroup: self
		heightToSelect: #numberOfMethods
		widthToSelect: #numberOfAttributes
		colorToSelect: #numberOfLinesOfCode
]
