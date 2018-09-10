"
basic class for generated importing contexts
"
Class {
	#name : #FmxImportingContext,
	#superclass : #Object,
	#instVars : [
		'imports'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #accessing }
FmxImportingContext >> import: aClass [
	
	self import: aClass traversed: Set new
	
]

{ #category : #accessing }
FmxImportingContext >> import: aClass traversed: traversedClasses [

	(traversedClasses includes: aClass)
		ifTrue: [ ^ self ].
		
	self imports add: aClass.
	traversedClasses add: aClass.
		
	aClass requirements do: [ :each |
		self import: each traversed: traversedClasses ].
	
]

{ #category : #accessing }
FmxImportingContext >> imports [
	^ imports
]

{ #category : #accessing }
FmxImportingContext >> imports: anObject [
	imports := anObject
]

{ #category : #initialization }
FmxImportingContext >> initialize [

	super initialize.
	
	imports := Set new.
]

{ #category : #testing }
FmxImportingContext >> shouldImport: aClass [

	^ self imports includes: aClass
]
