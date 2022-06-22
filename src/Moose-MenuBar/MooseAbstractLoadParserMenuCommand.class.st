Class {
	#name : #MooseAbstractLoadParserMenuCommand,
	#superclass : #MooseAbstractLoadModuleMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseAbstractLoadParserMenuCommand class >> label [

	^ 'Parser'
]

{ #category : #accessing }
MooseAbstractLoadParserMenuCommand class >> menuPriority [

	^ 30
]
