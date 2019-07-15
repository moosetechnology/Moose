Class {
	#name : #MACheckboxMorph,
	#superclass : #MAElementMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MACheckboxMorph >> buildMorphView [
	^ UITheme current 
		newCheckboxIn: nil
		for: self
		getSelected: #selected
		setSelected: #selected:
		getEnabled: #enabled
		label: ''
		help: self magritteDescription comment
]

{ #category : #actions }
MACheckboxMorph >> enabled [
	^ true
]

{ #category : #actions }
MACheckboxMorph >> selected [
	^ (self value ifNil: [ self magritteDescription default ]) ifNil: [ false ]
]

{ #category : #actions }
MACheckboxMorph >> selected: aBoolean [
	self value: aBoolean 
]
