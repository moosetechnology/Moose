Class {
	#name : #TRMorphWidgetFactory,
	#superclass : #TRObject,
	#category : #'Trachel-Core'
}

{ #category : #public }
TRMorphWidgetFactory class >> menuForAssociations: associations on: element [
	"associations is a list of association following: #aSymbol -> [ :model | ... ]
	The block contains in the association is evaluated with the model provided by the element."
	
		| v |
		v := TRPlatform current menuMorphClass new.
		associations do: [ :assoc | 
			v 
				add: assoc key
				target: assoc value
				selector: #cull:
				argument: element
		].
		
		v popUpInWorld.
]
