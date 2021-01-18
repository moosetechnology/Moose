Class {
	#name : #MooseFASTToolEntry,
	#superclass : #MooseASTEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #execution }
MooseFASTToolEntry >> execute [
	Metacello new
		baseline: 'FAST';
		repository: 'github://moosetechnology/FAST:' , self version, '/src';
		load
]

{ #category : #accessing }
MooseFASTToolEntry >> label [
	^ 'FAST Core'
]

{ #category : #accessing }
MooseFASTToolEntry >> version [
	^ 'v1.x.x'
]
