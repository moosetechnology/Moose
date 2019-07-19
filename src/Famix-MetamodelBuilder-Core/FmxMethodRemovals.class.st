Class {
	#name : #FmxMethodRemovals,
	#superclass : #FmxLazyClassChange,
	#instVars : [
		'selectors'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #'instance creation' }
FmxMethodRemovals class >> className: aSymbol isClassSide: aBoolean selectors: aCollection [
	^ self new
		className: aSymbol;
		isClassSide: aBoolean;
		selectors: aCollection;
		yourself
]

{ #category : #accessing }
FmxMethodRemovals >> apply [
	| class |
	class := self realClass.
	self selectors do: [ :selector | class removeSelector: selector ]
]

{ #category : #accessing }
FmxMethodRemovals >> selectors [
	^ selectors
]

{ #category : #accessing }
FmxMethodRemovals >> selectors: anObject [
	selectors := anObject
]
