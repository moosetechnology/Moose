"
FamixMetamodelBuilderEnvironment
"
Class {
	#name : #FmxMBEnvironment,
	#superclass : #Object,
	#instVars : [
		'builder'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #'instance creation' }
FmxMBEnvironment class >> for: aBuilder [

	^ self new 
		builder: aBuilder;
		yourself.
]

{ #category : #accessing }
FmxMBEnvironment >> apply [


]

{ #category : #accessing }
FmxMBEnvironment >> builder [
	^ builder
]

{ #category : #accessing }
FmxMBEnvironment >> builder: anObject [
	builder := anObject
]

{ #category : #initialization }
FmxMBEnvironment >> createClassNamed: aClassName superclass: aSuperclass traitNames: traitNames slots: slots in: packageName overwrite: shouldOverwrite [

	| aClass existingClass composition |
	
	existingClass := self ringEnvironment ask behaviorNamed: aClassName asSymbol.
	
	(existingClass notNil and: [ shouldOverwrite not]) 
		ifTrue: [ ^ existingClass ].
		
	aClass := self ringEnvironment ensureClassNamed: aClassName.
	aClass superclass: aSuperclass.

	composition := RGTraitComposition parent: aClass.
	aClass traitComposition: composition.
	traitNames do: [ :each |
		composition addTransformation: (self ringEnvironment ensureTraitNamed: each) ].	
	
	aClass package: (self ringEnvironment ensurePackageNamed: packageName).
	aClass layout makeResolved.
	slots do: [ :slotInBadEnvironment |
		| slot |
		slot := slotInBadEnvironment isSpecial
			ifTrue: [ 			
				(RGUnknownSlot named: slotInBadEnvironment name parent: aClass layout) 
					expression: slotInBadEnvironment expression;
					yourself ]
			ifFalse: [ 
				RGInstanceVariableSlot named: slotInBadEnvironment name parent: aClass layout ].
		aClass layout addSlot: slot.
		slot propertyNamed: #isGenerated put: true ].

	^ aClass
]
