"
Description
--------------------

I am a partial cleaning strategy. 

If used by a MM generator, I'll try to save all the informations added by a user in a MM, remove the generated MM, regenerate the MM and add back all the info I saved to it.

To do that I'll save:
- Non generated methods 
- Non generated variables
- Non generated Traits usage
- Non generated classes
"
Class {
	#name : #FamixMetamodelGeneratorCleanGeneratedStrategy,
	#superclass : #FamixAbstractMetamodelGeneratorCleaningStrategy,
	#instVars : [
		'addedMethods',
		'addedInstVar',
		'addedClassVar',
		'addedClassInstVar',
		'addedClasses',
		'addedTraitsUsers'
	],
	#category : #'Famix-MetamodelBuilder-Core-Cleaning'
}

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> cleanAfterGeneration [
	(self temporaryPackageName asPackageIfAbsent: [ ^ self ]) removeFromSystem
]

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> cleanBeforeGeneration: aMetamodelGenerator [
	aMetamodelGenerator generatedPackage ifNil: [ ^ self ].

	"We need to select the classes because RPackage return also traits alongside with its classes. We use #defineClasses and not #classes to not get extensions."
	aMetamodelGenerator generatedPackage definedClasses
		do: [ :class | 
			class isMetamodelEntity
				ifTrue: [ addedMethods addAll: (class localMethods , class class localMethods reject: #hasGeneratedPragma thenCollect: [ :m | self methodInfoFor: m ]).
					class customTraits ifNotEmpty: [ :traits | addedTraitsUsers at: class name put: traits ].
					class famixCustomSlots ifNotEmpty: [ :slots | addedInstVar at: class name put: slots ].
					class classVariables ifNotEmpty: [ :classVariables | addedClassVar at: class name put: classVariables ].
					class class instanceVariables ifNotEmpty: [ :classInstVariables | addedClassInstVar at: class name put: classInstVariables ] ]
				ifFalse: [ addedClasses add: class ] ].

	addedMethods addAll: (aMetamodelGenerator generatedPackage extensionMethods collect: [ :method | self methodInfoFor: method ]).

	addedClasses ifNotEmpty: [ :classes | (RPackageOrganizer default createPackageNamed: self temporaryPackageName) importClasses: classes ].
	aMetamodelGenerator generatedPackage removeFromSystem
]

{ #category : #initialization }
FamixMetamodelGeneratorCleanGeneratedStrategy >> initialize [
	super initialize.
	addedMethods := Set new.
	addedTraitsUsers := Dictionary new.
	addedInstVar := Dictionary new.
	addedClassVar := Dictionary new.
	addedClassInstVar := Dictionary new.
	addedClasses := Set new
]

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> methodInfoFor: aMethod [
	^ FmxCleaningMethodInfo
		source: aMethod sourceCode
		protocol: aMethod protocol
		isInstanceSide: aMethod methodClass isInstanceSide
		methodClass: (aMethod methodClass isClassSide ifTrue: [ aMethod methodClass soleInstance ] ifFalse: [ aMethod methodClass ]) name
]

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> postGeneration: aMetamodelBuilder [
	aMetamodelBuilder generatedPackage classes
		do: [ :class | 
			addedTraitsUsers at: class name ifPresent: [ :traits | class traitComposition: (traits inject: class traitComposition into: [ :trait1 :trait2 | trait1 + trait2 ]) ].

			addedInstVar at: class name ifPresent: [ :instVariables | instVariables do: [ :instVar | class addSlot: instVar ] ].
			addedClassVar at: class name ifPresent: [ :classVariables | classVariables do: [ :classVar | class addClassVariable: classVar ] ].
			addedClassInstVar at: class name ifPresent: [ :classInstVariables | classInstVariables do: [ :classInstVar | class class addSlot: classInstVar ] ] ].

	addedMethods do: #install.
	addedClasses ifNotEmpty: [ :classes | aMetamodelBuilder generatedPackage importClasses: classes ]
]

{ #category : #accessing }
FamixMetamodelGeneratorCleanGeneratedStrategy >> temporaryPackageName [
	^ 'Famix-MetamodelBuilder-Temporary-Classes-Package-Holder'
]

{ #category : #action }
FamixMetamodelGeneratorCleanGeneratedStrategy >> withCleaningDo: aBlock with: aMetamodelGenerator [
	[ super withCleaningDo: aBlock with: aMetamodelGenerator ]
		ensure: [ self cleanAfterGeneration ]
]
