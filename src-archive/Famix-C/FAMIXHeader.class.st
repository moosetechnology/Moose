"
I represent a header file. Typically a .h or .hpp
"
Class {
	#name : #FAMIXHeader,
	#superclass : #FAMIXCFile,
	#instVars : [
		'module'
	],
	#category : #'Famix-C'
}

{ #category : #meta }
FAMIXHeader class >> annotation [
	<MSEClass: #Header super: #FAMIXCFile>
	<package: #FAMIX>
]

{ #category : #testing }
FAMIXHeader >> isHeader [
	^ true
]

{ #category : #accessing }
FAMIXHeader >> module [
	<MSEProperty: #module type: #FAMIXModule opposite: #header>
	<MSEComment: 'Module that contains the definition of this header file'>
	^ module
]

{ #category : #accessing }
FAMIXHeader >> module: anObject [
	module := anObject
]
