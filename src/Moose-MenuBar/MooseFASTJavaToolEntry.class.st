Class {
	#name : #MooseFASTJavaToolEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #execution }
MooseFASTJavaToolEntry >> execute [
	Metacello new
		baseline: 'FASTJava';
		repository: 'github://moosetechnology/FAST-Java:' , self version, '/src';
		load
]

{ #category : #accessing }
MooseFASTJavaToolEntry >> label [
	^ 'FAST Java'
]

{ #category : #accessing }
MooseFASTJavaToolEntry >> version [
	^ 'v0.0.1'
]
