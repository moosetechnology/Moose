"
This stores the source as an actual string variable. It is to be used when it is not possible to link to the actual source.
"
Class {
	#name : #FAMIXSourceTextAnchor,
	#superclass : #FAMIXSourceAnchor,
	#instVars : [
		'source'
	],
	#category : #'Famix-SourceAnchor'
}

{ #category : #meta }
FAMIXSourceTextAnchor class >> annotation [
	<MSEClass: #SourceTextAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXSourceTextAnchor >> lineCount [
	^ self sourceText ifNotNil: #lineCount ifNil: [ self notExistentMetricValue ]
]

{ #category : #accessing }
FAMIXSourceTextAnchor >> source [
	<MSEProperty: #source type: #String>
	<MSEComment: 'Actual source code of the source entity'>
	^ source
]

{ #category : #accessing }
FAMIXSourceTextAnchor >> source: anObject [
	source := anObject
]

{ #category : #accessing }
FAMIXSourceTextAnchor >> sourceText [
	^ self source
]
