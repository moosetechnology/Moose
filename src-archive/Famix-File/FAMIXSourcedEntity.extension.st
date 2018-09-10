Extension { #name : #FAMIXSourcedEntity }

{ #category : #'*Famix-File' }
FAMIXSourcedEntity >> containerFiles [
	"this method returns a collection because a source entity can be defined in single as well as multiple files. Hence we support the language that allow the separation of declaration and definition"

	<MSEProperty: #containerFiles type: #FAMIXFile>
	<multivalued>
	<MSEComment: 'List of files containing the entity'>
	"<container> -> should not be on this side..."
	
	^ self sourceAnchor ifNotNil: [ self sourceAnchor containerFiles ] ifNil: [ #() ]
]

{ #category : #'*Famix-File' }
FAMIXSourcedEntity >> containerFiles: aColl [
	"This method is a hack for now because we need an opposite to the files."

	
]
