Class {
	#name : #FAMIXNavigationPluginTestsResource,
	#superclass : #MooseModelTestResource,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #'MooseKGB-TestFamix3-util' }
FAMIXNavigationPluginTestsResource >> getMethod: methodNameString from: aFAMIXClass [ 
	 
	| mooseName | 
	mooseName := (aFAMIXClass mooseName asString , '.' 
		, methodNameString asString) asSymbol. 
	^self model entityNamed: mooseName
]

{ #category : #'MooseKGB-TestFamix3-hook' }
FAMIXNavigationPluginTestsResource >> importModel [ 

	| factory importer classes namespaces | 
	
	factory := SmalltalkCompatibilityMetamodelFactory new.
	
	classes := #( #( #'M1P1C1FullReferencerOutSide' #'M1P2C2ReferencerOutSideRefereeInSide'
					#'M1P2C3ReferencerInSideRefereeOutSide'
					#'M1P2C4FullRefereeInSide'
					#'M1P3C5ReferencerInSideRefereeInSide'
					#'M1P3C6FullReferencerInSideOutSide'
					#'M1P3C7FullRefereeInSide'
					#'M1P3C8FullReferencerInSide' )
	"classesN2" #( #'M2P4C9FullRefereeInSide'
					#'M2P4C10FullReferencerInSide'
					#'M2P5C11FullRefereeOutSide'
					#'M2P6C12FullReferencerInSide'
					#'M2P6C13FullRefereeInSideOutSide' )
	"classesN3" #( #'M3P7C14ReferencerOutSideRefereeOutSide' )
	"classesN4" #( #'M4P8C15FullReferencerOutSide' )
	"classesN5" #( #'M5P9C16FullReferencerOutSideInSide'
					#'M5P10C17FullReferencerInSide'
					#'M5P10C18FullRefereeInSideOutSide' )
	"classesN6" #( #'M6P11C19FullRefereeOutSide'
					#'M6P12C20FullReferencerOutSide' )
	"classesN7" #( #'M7P13C21FullReferencerOutSide'
					#'M7P14C22FullRefereeOutSide' ) ).

	namespaces := #( 'Model1InteractedReferencerReferee'
		'Model2FullReferee'
		'Model3ReferencerReferee' 
		'Model4FullReferencer'
		'Model5InteractedReferencer'
		'Model6InteractedReferee'
		 'Model7FullInteracted' ) collect: [ :each | factory namespace new name: each ].
	
	importer := MoosePharoImporterTask new. 
	importer importingContext mergeClassAndMetaclass. 
	importer candidateClass: CandidateListOperator.
	importer importerClass: SmalltalkImporter.
	importer model: model; 
		addFromPackagesMatching: [:p | 'Moose-TestResources-KGB-*' match: p name];
		run.
	
	model addAll: namespaces.

	classes withIndexDo: [ :classArray :index |
		| namespace |
		namespace := namespaces at: index.
		classArray do: [ :each |
			| class |
			class := model entityNamed: 'Smalltalk::', each.
			class typeContainer: namespace
			"(model entityNamed: #Smalltalk) types remove:(model entityNamed: each)."
		] ]
]
