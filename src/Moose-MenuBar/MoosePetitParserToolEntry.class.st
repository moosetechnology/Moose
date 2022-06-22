Class {
	#name : #MoosePetitParserToolEntry,
	#superclass : #MooseParserEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MoosePetitParserToolEntry class >> help [

	^ 'Framework for parsers building'
]

{ #category : #'world menu' }
MoosePetitParserToolEntry class >> label [

	^ 'Petit Parser'
]

{ #category : #'world menu' }
MoosePetitParserToolEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MoosePetitParserToolEntry class >> menuPriority [

	^ super menuPriority + 1
]

{ #category : #accessing }
MoosePetitParserToolEntry >> baselineName [

	^ 'PetitParser'
]

{ #category : #accessing }
MoosePetitParserToolEntry >> repositoryURL [

	^ 'github://moosetechnology/PetitParser:' , self version , '/src'
]

{ #category : #accessing }
MoosePetitParserToolEntry >> version [
	^ 'v3.x.x'
]
