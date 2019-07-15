Class {
	#name : #MATextMorph,
	#superclass : #MAMemoMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MATextMorph >> buildMorphView [
	^ UITheme current 
			newTextEntryIn: nil 
			for: self  
			get: #string  
			set: #string: 
			class: String
			getEnabled: #enabled 
			help: self magritteDescription comment
]
