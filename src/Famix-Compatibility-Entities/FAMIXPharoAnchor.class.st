Class {
	#name : #FAMIXPharoAnchor,
	#superclass : #FAMIXSourceAnchor,
	#instVars : [
		'pharoEntity'
	],
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXPharoAnchor class >> annotation [

	<MSEClass: #PharoAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-File' }
FAMIXPharoAnchor >> containerFiles [
	^ {  }
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
