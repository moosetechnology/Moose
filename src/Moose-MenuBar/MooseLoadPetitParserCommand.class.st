Class {
	#name : #MooseLoadPetitParserCommand,
	#superclass : #MooseAbstractLoadParserCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseLoadPetitParserCommand class >> help [

	^ 'Framework for parsers building'
]

{ #category : #'world menu' }
MooseLoadPetitParserCommand class >> label [

	^ 'Petit Parser'
]

{ #category : #'world menu' }
MooseLoadPetitParserCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #'world menu' }
MooseLoadPetitParserCommand class >> menuPriority [

	^ super menuPriority + 1
]

{ #category : #accessing }
MooseLoadPetitParserCommand >> baselineName [

	^ 'PetitParser'
]

{ #category : #accessing }
MooseLoadPetitParserCommand >> repositoryURL [

	^ 'github://moosetechnology/PetitParser:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadPetitParserCommand >> version [
	^ 'v3.x.x'
]
