Class {
	#name : #FAMIXSourceTextAnchor,
	#superclass : #FAMIXSourceAnchor,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXSourceTextAnchor class >> annotation [

	<MSEClass: #SourceTextAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXSourceTextAnchor class >> generatedSlotNames [
	<generated>
	'FAMIXSourceTextAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXSourceTextAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithImmediateSource)
]

{ #category : #meta }
FAMIXSourceTextAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-File' }
FAMIXSourceTextAnchor >> containerFiles [
	^ {}
]

{ #category : #accessing }
FAMIXSourceTextAnchor >> lineCount [
	^ self sourceText ifNotNil: #lineCount ifNil: [ self notExistentMetricValue ]
]
