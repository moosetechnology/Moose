"
A source anchors for Pharo models i.e. ttheir source is in the image. 

"
Class {
	#name : #FAMIXPharoAnchor,
	#superclass : #FAMIXSourceAnchor,
	#instVars : [
		'pharoEntity'
	],
	#category : #'Famix-SourceAnchor'
}

{ #category : #meta }
FAMIXPharoAnchor class >> annotation [
	<MSEClass: #PharoAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
]

{ #category : #initialization }
FAMIXPharoAnchor >> initialize [
	super initialize.
	pharoEntity := WeakArray new: 1.
]

{ #category : #accessing }
FAMIXPharoAnchor >> lineCount [
	^ self sourceText ifNotNil: #lineCount ifNil: [ self notExistentMetricValue ]
]

{ #category : #accessing }
FAMIXPharoAnchor >> pharoEntity [
	"pharoEntity var is a 1-element weak array"
	
	^ pharoEntity at: 1
]

{ #category : #accessing }
FAMIXPharoAnchor >> pharoEntity: anObject [
	"point to object weakly"
	
	pharoEntity at: 1 put: anObject 
]

{ #category : #accessing }
FAMIXPharoAnchor >> sourceText [
	^ self pharoEntity ifNotNil: #definition  
]
