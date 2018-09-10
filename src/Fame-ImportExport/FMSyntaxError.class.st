Class {
	#name : #FMSyntaxError,
	#superclass : #Error,
	#instVars : [
		'parser'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #accessing }
FMSyntaxError >> parser [
	^ parser
]

{ #category : #accessing }
FMSyntaxError >> parser: anObject [
	parser := anObject
]
