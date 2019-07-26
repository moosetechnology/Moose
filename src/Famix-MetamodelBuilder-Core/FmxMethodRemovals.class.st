"
Description
--------------------

I represent a change that would remove methods of a class during a Famix generation.

Examples
--------------------

	FmxMethodRemovals className: FmxMethodRemovals isClassSide: true selectors: {#apply}
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	selectors:		<aCollectionOfSelectors>		The list of selectors to remove from the class.

"
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
