Class {
	#name : #FameNameConventionBetweenFM3AndSmalltalkRule,
	#superclass : #RBBlockLintRule,
	#category : #'Fame-Rules'
}

{ #category : #accessing }
FameNameConventionBetweenFM3AndSmalltalkRule class >> uniqueIdentifierName [
	^ 'NameConventionBetweenFM3AndSmalltalk'
]

{ #category : #private }
FameNameConventionBetweenFM3AndSmalltalkRule >> addClass: aClass toMetaBuilderCollection: aCollectionOfClasses [

	|  classToAdd pragma compiledMethod |
	"we add the class itself"
	aCollectionOfClasses addIfNotPresent:  aClass  .
	
	"We add all classes described in properties pargmas :"
	aClass methodDict valuesDo: [:each | 
		
		pragma := Pragma inMethod: each
		named: #(#MSEProperty:type:opposite: #MSEProperty:type: ).
		pragma ifNotNil:[
			classToAdd := (pragma	argumentAt: 2) asString.
			(#('String' 'Number' 'Boolean' 'Object'  ) includes: classToAdd)
				ifFalse:  [
					classToAdd = 'FM3.Property'
						ifTrue: [
							(aCollectionOfClasses includes: FM3PropertyDescription)
							ifFalse: [self addClass: FM3PropertyDescription toMetaBuilderCollection: aCollectionOfClasses].  ]
						ifFalse: [
							
							classToAdd := Smalltalk classNamed: classToAdd.
							(aCollectionOfClasses includes: classToAdd)
							ifFalse: [self addClass: classToAdd toMetaBuilderCollection: aCollectionOfClasses. ]].
					
			]
		]].
	"we add the superclass and all classes linked to it: "
	compiledMethod := ( aClass classSide compiledMethodAt: #annotation ifAbsent: [nil] ).
	compiledMethod ifNotNil: [
		pragma := compiledMethod pragmaAt: #MSEClass:super: .
			pragma ifNotNil: [
				|argument|
				argument := pragma argumentAt: 2.
				argument = #Object ifFalse: [
					(argument includes: $.)
					ifTrue:[
						classToAdd := ''.
						(argument substrings: #($.)) 
							do: [:each | classToAdd := classToAdd,each].
						classToAdd := 	(Smalltalk classNamed: classToAdd)		
					]
					ifFalse:[classToAdd := (Smalltalk classNamed: argument asString).].
					
					(aCollectionOfClasses  includes: classToAdd) ifFalse:
						[self addClass: classToAdd toMetaBuilderCollection: aCollectionOfClasses].
				].
			].
	].
	
]

{ #category : #running }
FameNameConventionBetweenFM3AndSmalltalkRule >> checkClass: aContext [
	| class pragmas pragma metaName |

	class := aContext.
	pragmas := Pragma allNamed: #MSEClass:super: in: class.
	pragmas ifEmpty: [ ^ self ].
	pragmas size > 1 ifTrue: [ result addClass: class. ^ self ].
	
	pragma := pragmas first.
	metaName := pragma argumentAt: 1.
	(pragma method pragmaAt: #package:)
		ifNotNil: [ :packagePragma ||packageName| 
			packageName := packagePragma argumentAt: 1.
			packageName , metaName = class instanceSide name
				ifFalse: [ result addClass: class selector: pragma selector ]]
		ifNil: [ 
			"this happens if the package: pragma is missing"
			result addClass: class selector: pragma selector ]
]

{ #category : #accessing }
FameNameConventionBetweenFM3AndSmalltalkRule >> group [
	^ 'Fame'
]

{ #category : #accessing }
FameNameConventionBetweenFM3AndSmalltalkRule >> name [

	^ 'FM3 class doesnt respect the fame name convention between FM3 and Smalltalk '
]

{ #category : #accessing }
FameNameConventionBetweenFM3AndSmalltalkRule >> rationale [

	^ 'check (for a class metadescribed with FM3 pragmas) if the FM3 class generated respect the convention between FM3  and Smalltalk:
	A FM3 class should be named PACKAGE.CLASSNAME whereas the smalltalk class associated should  be named PACKAGECLASSNAME. It is also an error to declare a FM3 meta-description without a package.'
]
