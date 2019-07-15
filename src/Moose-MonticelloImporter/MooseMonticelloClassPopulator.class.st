Class {
	#name : #MooseMonticelloClassPopulator,
	#superclass : #MooseMonticelloVisitor,
	#category : #'Moose-MonticelloImporter'
}

{ #category : #accessing }
MooseMonticelloClassPopulator >> visitClassDefinition: def [
	importer 
		createClassNamed: def className asSymbol
		ivs: (def variables collect: [:each | each name ])
		superclassName: def superclassName
]
