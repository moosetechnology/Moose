Class {
	#name : #AbstractFAMIXNavigationTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #resources }
AbstractFAMIXNavigationTest class >> resources [ 
	 
	^Array with: FAMIXNavigationPluginTestsResource
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c10FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P4C10FullReferencerInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c11FullRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P5C11FullRefereeOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c12FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P6C12FullReferencerInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c13FullRefereeInSideOutSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P6C13FullRefereeInSideOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c14ReferencerOutSideRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model3ReferencerReferee::M3P7C14ReferencerOutSideRefereeOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c15FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model4FullReferencer::M4P8C15FullReferencerOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c16FullReferencerOutSideInSide [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer::M5P9C16FullReferencerOutSideInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c17FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer::M5P10C17FullReferencerInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c18FullRefereeInSideOutSide [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer::M5P10C18FullRefereeInSideOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c19FullRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee::M6P11C19FullRefereeOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c1FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P1C1FullReferencerOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c20FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee::M6P12C20FullReferencerOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c21FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted::M7P13C21FullReferencerOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c22FullRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted::M7P14C22FullRefereeOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c2ReferencerOutSideRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P2C2ReferencerOutSideRefereeInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c3ReferencerInSideRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P2C3ReferencerInSideRefereeOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c4FullRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P2C4FullRefereeInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c5ReferencerInSideRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P3C5ReferencerInSideRefereeInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c6FullReferencerInSideOutSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P3C6FullReferencerInSideOutSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c7FullRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P3C7FullRefereeInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c8FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P3C8FullReferencerInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> c9FullRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P4C9FullRefereeInSide'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesClasses' }
AbstractFAMIXNavigationTest >> cObject [ 
	 
	^self model entityNamed: #'Smalltalk::Object'
]

{ #category : #'MooseKGB-TestFamix3-util' }
AbstractFAMIXNavigationTest >> getMethod: methodNameString from: aFAMIXClass [ 
	 
	| mooseName result | 

	mooseName := (aFAMIXClass mooseName asString , '.' 
		, methodNameString asString) asSymbol. 

	result := self model entityNamed: mooseName.
	
	self assert: result notNil. 

	^ result
]

{ #category : #'MooseKGB-TestFamix3-util' }
AbstractFAMIXNavigationTest >> model [ 
	 
	^FAMIXNavigationPluginTestsResource current model
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> namespace1InteractedReferencerReferee [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> namespace2FullReferee [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> namespace3ReferencerReferee [
	 
	^self model entityNamed: 
			#'Model3ReferencerReferee'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> namespace4FullReferencer [ 
	 
	^self model entityNamed: 
			#'Model4FullReferencer'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> namespace5InteractedReferencer [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> namespace6InteractedReferee [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> namespace7FullInteracted [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> namespaceSmalltalkCore [ 
	 
	^self model entityNamed: #'Smalltalk'
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP10InteractedReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P10InteractedReferee'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP11FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P11FullReferee'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP12FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P12FullReferencer'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP13FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P13FullReferencer'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP14FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P14FullReferee'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP1FullReferencer [ 
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P1FullReferencer'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP2InteractedReferencerReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P2InteractedReferencerReferee'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP3InteractedReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P3InteractedReferencer'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP4FullInteracted [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P4FullInteracted'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP5FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P5FullReferee'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP6InteractedReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P6InteractedReferee'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP7ReferencerReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P7ReferencerReferee'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP8FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P8FullReferencer'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packageP9FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P9FullReferencer'. 
]

{ #category : #'Moose-Cook-FAMIX2-Test-resourcesNamespaces' }
AbstractFAMIXNavigationTest >> packagePExtensions [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-PExtensions'. 
]
