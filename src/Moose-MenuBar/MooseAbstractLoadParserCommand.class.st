Class {
	#name : #MooseAbstractLoadParserCommand,
	#superclass : #MooseAbstractLoadModuleCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseAbstractLoadParserCommand class >> label [

	^ 'Parser'
]

{ #category : #'world menu' }
MooseAbstractLoadParserCommand class >> menuPriority [

	^ 30
]
