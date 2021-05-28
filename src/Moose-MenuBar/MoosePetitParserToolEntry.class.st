Class {
	#name : #MoosePetitParserToolEntry,
	#superclass : #MooseParserEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #execution }
MoosePetitParserToolEntry >> execute [
	Metacello new
		baseline: 'PetitParser';
		repository: 'github://moosetechnology/PetitParser:' , self version, '/src';
		onConflictUseLoaded;
		load
]

{ #category : #accessing }
MoosePetitParserToolEntry >> label [
	^ 'Petit Parser'
]

{ #category : #accessing }
MoosePetitParserToolEntry >> version [
	^ 'v2.1.x'
]
