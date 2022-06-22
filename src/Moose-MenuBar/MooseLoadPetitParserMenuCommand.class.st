Class {
	#name : #MooseLoadPetitParserMenuCommand,
	#superclass : #MooseAbstractLoadParserMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseLoadPetitParserMenuCommand class >> help [

	^ 'Framework for parsers building'
]

{ #category : #accessing }
MooseLoadPetitParserMenuCommand class >> label [

	^ 'Petit Parser'
]

{ #category : #'world menu' }
MooseLoadPetitParserMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #accessing }
MooseLoadPetitParserMenuCommand class >> menuPriority [

	^ super menuPriority + 1
]

{ #category : #accessing }
MooseLoadPetitParserMenuCommand >> baselineName [

	^ 'PetitParser'
]

{ #category : #accessing }
MooseLoadPetitParserMenuCommand >> repositoryURL [

	^ 'github://moosetechnology/PetitParser:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadPetitParserMenuCommand >> version [
	^ 'v3.x.x'
]
