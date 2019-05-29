Class {
	#name : #FamixMetamodelGeneratorCleanGeneratedStrategy,
	#superclass : #FamixAbstractMetamodelGeneratorCleaningStrategy,
	#instVars : [
		'addedMethods'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> cleanBeforeGeneration: aMetamodelGenerator [
	aMetamodelGenerator generatedPackage ifNil: [ ^ self ].

	aMetamodelGenerator generatedPackage classes
		do: [ :class | 
			((class methods, class class methods) reject: [ :method | method pragmas anySatisfy: [ :pragma | pragma keyword = #generated ] ] thenCollect: [ :m | FmxCleaningMethodInfo source: m sourceCode protocol: m protocol isInstanceSide: m methodClass isInstanceSide ])
				ifNotEmpty: [ :methods | addedMethods at: class printString put: methods ] ].

	aMetamodelGenerator generatedPackage removeFromSystem
]

{ #category : #initialization }
FamixMetamodelGeneratorCleanGeneratedStrategy >> initialize [
	super initialize.
	addedMethods := Dictionary new
]

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> postGeneration: aMetamodelBuilder [
	aMetamodelBuilder generatedPackage classes
		do: [ :class | 
			addedMethods
				at: class printString
				ifPresent: [ :methods | methods do: [ :method | (method isInstanceSide ifTrue: [ class ] ifFalse: [ class class ]) compile: method sourceCode classified: method protocol ] ] ]
]
