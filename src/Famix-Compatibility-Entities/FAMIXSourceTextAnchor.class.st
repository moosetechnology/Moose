Class {
	#name : #FAMIXSourceTextAnchor,
	#superclass : #FAMIXSourceAnchor,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXSourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-File' }
FAMIXSourceTextAnchor >> containerFiles [
	^ {}
]

{ #category : #accessing }
FAMIXSourceTextAnchor >> lineCount [
	^ self sourceText ifNotNil: #lineCount ifNil: [ self notExistentMetricValue ]
]
