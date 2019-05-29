Class {
	#name : #FamixMetamodelGeneratorCleanGeneratedStrategy,
	#superclass : #FamixAbstractMetamodelGeneratorCleaningStrategy,
	#instVars : [
		'addedMethods',
		'addedTraits',
		'addedInstVar',
		'addedClassVar',
		'addedClassInstVar'
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
				ifNotEmpty: [ :methods | addedMethods at: class name put: methods ].
			(class traitComposition allTraits difference: (aMetamodelGenerator traitsGeneratedIn: class)) ifNotEmpty: [ :traits | addedTraits at: class name put: traits ].
			
			(class slotNames difference: (aMetamodelGenerator instanceVariableNamesGeneratedIn: class))
				ifNotEmpty: [ :instVarNames | addedInstVar at: class name put: (instVarNames collect: [ :instVarName | class slotNamed: instVarName ]) ].
			class classVariables ifNotEmpty: [ :classVariables | addedClassVar at: class name put: classVariables ].
			class class instanceVariables ifNotEmpty: [ :classInstVariables | addedClassInstVar at: class name put: classInstVariables ] ].

	aMetamodelGenerator generatedPackage removeFromSystem
]

{ #category : #initialization }
FamixMetamodelGeneratorCleanGeneratedStrategy >> initialize [
	super initialize.
	addedMethods := Dictionary new.
	addedTraits := Dictionary new.
	addedInstVar := Dictionary new.
	addedClassVar := Dictionary new.
	addedClassInstVar := Dictionary new
]

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> postGeneration: aMetamodelBuilder [
	aMetamodelBuilder generatedPackage classes
		do: [ :class | 
			addedMethods
				at: class name
				ifPresent: [ :methods | methods do: [ :method | (method isInstanceSide ifTrue: [ class ] ifFalse: [ class class ]) compile: method sourceCode classified: method protocol ] ].
				
			addedTraits at: class name ifPresent: [ :traits | class traitComposition: (traits inject: class traitComposition into: [ :trait1 :trait2 | trait1 + trait2 ]) ].
			
			addedInstVar at: class name ifPresent: [ :instVariables | instVariables do: [ :instVar | class addSlot: instVar ]  ].
			addedClassVar at: class name ifPresent: [ :classVariables | classVariables do: [ :classVar | class addClassVariable: classVar ]  ].
			addedClassInstVar at: class name ifPresent: [ :classInstVariables | classInstVariables do: [ :classInstVar | class class addSlot: classInstVar ]  ]. ]
]
