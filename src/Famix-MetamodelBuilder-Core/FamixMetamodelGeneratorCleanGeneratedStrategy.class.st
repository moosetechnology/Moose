Class {
	#name : #FamixMetamodelGeneratorCleanGeneratedStrategy,
	#superclass : #FamixAbstractMetamodelGeneratorCleaningStrategy,
	#instVars : [
		'addedMethods',
		'addedTraits'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> cleanBeforeGeneration: aMetamodelGenerator [
	aMetamodelGenerator generatedPackage ifNil: [ ^ self ].

	"We need to select the classes because RPackage return also traits alongside with its classes."
	aMetamodelGenerator generatedPackage classes
		do: [ :class | 
			(class methods , class class methods
				reject: [ :method | method pragmas anySatisfy: [ :pragma | pragma keyword = #generated ] ]
				thenCollect: [ :m | FmxCleaningMethodInfo source: m sourceCode protocol: m protocol isInstanceSide: m methodClass isInstanceSide ])
				ifNotEmpty: [ :methods | addedMethods at: class printString put: methods ].
			(class traitComposition allTraits difference: (aMetamodelGenerator traitsGeneratedIn: class)) ifNotEmpty: [ :traits | addedTraits at: class printString put: traits ] ].



	aMetamodelGenerator generatedPackage removeFromSystem
]

{ #category : #initialization }
FamixMetamodelGeneratorCleanGeneratedStrategy >> initialize [
	super initialize.
	addedMethods := Dictionary new.
	addedTraits := Dictionary new
]

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> postGeneration: aMetamodelBuilder [
	aMetamodelBuilder generatedPackage classes
		do: [ :class | 
			addedMethods
				at: class printString
				ifPresent: [ :methods | methods do: [ :method | (method isInstanceSide ifTrue: [ class ] ifFalse: [ class class ]) compile: method sourceCode classified: method protocol ] ].
				
			addedTraits at: class printString ifPresent: [ :traits | class traitComposition: (traits inject: class traitComposition into: [ :trait1 :trait2 | trait1 + trait2 ]) ] ]
]
