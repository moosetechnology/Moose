Class {
	#name : #MoosePetitParserToolEntry,
	#superclass : #MooseParserEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MoosePetitParserToolEntry class >> menuCommandOn: aBuilder [
	"method needed because for the pragma"
	<worldMenu>
	^self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MoosePetitParserToolEntry class >> menuPriority [ 
	^super menuPriority + 1
]

{ #category : #execution }
MoosePetitParserToolEntry >> execute [
	Metacello new
		baseline: 'PetitParser';
		repository: 'github://moosetechnology/PetitParser:' , self version, '/src';
		onConflictUseIncoming;
		load
]

{ #category : #accessing }
MoosePetitParserToolEntry >> label [
	^ 'Petit Parser'
]

{ #category : #accessing }
MoosePetitParserToolEntry >> version [
	^ 'v3.x.x'
]
