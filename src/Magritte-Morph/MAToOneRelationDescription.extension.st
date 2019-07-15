Extension { #name : #MAToOneRelationDescription }

{ #category : #'*Magritte-Morph' }
MAToOneRelationDescription class >> defaultMorphClasses [
	^ Array with: MAExternalEditorMorph with: MAInternalEditorMorph
]
