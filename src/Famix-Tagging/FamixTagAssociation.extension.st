Extension { #name : #FamixTagAssociation }

{ #category : #'*MooseTagging-Ston' }
FamixTagAssociation >> stonOn: stonWriter [
	stonWriter writeObject: self do: [ stonWriter encodeMap: (self stonMapForTagModel: stonWriter tagModel) ]
]
