Class {
	#name : #AbstractFAMIXNavigationTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #accessing }
AbstractFAMIXNavigationTest class >> resources [
	^ {FAMIXNavigationPluginTestsResource}
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c10FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P4C10FullReferencerInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c11FullRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P5C11FullRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c12FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P6C12FullReferencerInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c13FullRefereeInSideOutSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P6C13FullRefereeInSideOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c14ReferencerOutSideRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model3ReferencerReferee::M3P7C14ReferencerOutSideRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c15FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model4FullReferencer::M4P8C15FullReferencerOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c16FullReferencerOutSideInSide [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer::M5P9C16FullReferencerOutSideInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c17FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer::M5P10C17FullReferencerInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c18FullRefereeInSideOutSide [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer::M5P10C18FullRefereeInSideOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c19FullRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee::M6P11C19FullRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c1FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P1C1FullReferencerOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c20FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee::M6P12C20FullReferencerOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c21FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted::M7P13C21FullReferencerOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c22FullRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted::M7P14C22FullRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c2ReferencerOutSideRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P2C2ReferencerOutSideRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c3ReferencerInSideRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P2C3ReferencerInSideRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c4FullRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P2C4FullRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c5ReferencerInSideRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P3C5ReferencerInSideRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c6FullReferencerInSideOutSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P3C6FullReferencerInSideOutSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c7FullRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P3C7FullRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c8FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee::M1P3C8FullReferencerInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> c9FullRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee::M2P4C9FullRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFAMIXNavigationTest >> cObject [ 
	 
	^self model entityNamed: #'Smalltalk::Object'
]

{ #category : #'helpers - utilites' }
AbstractFAMIXNavigationTest >> getMethod: methodNameString from: aFAMIXClass [
	| mooseName result |
	mooseName := (aFAMIXClass mooseName asString , '.' , methodNameString asString) asSymbol.

	result := self model entityNamed: mooseName.

	self assert: result notNil.

	^ result
]

{ #category : #'helpers - utilites' }
AbstractFAMIXNavigationTest >> model [ 
	 
	^FAMIXNavigationPluginTestsResource current model
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> namespace1InteractedReferencerReferee [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> namespace2FullReferee [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> namespace3ReferencerReferee [
	 
	^self model entityNamed: 
			#'Model3ReferencerReferee'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> namespace4FullReferencer [ 
	 
	^self model entityNamed: 
			#'Model4FullReferencer'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> namespace5InteractedReferencer [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> namespace6InteractedReferee [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> namespace7FullInteracted [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> namespaceSmalltalkCore [ 
	 
	^self model entityNamed: #'Smalltalk'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP10InteractedReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P10InteractedReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP11FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P11FullReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP12FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P12FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP13FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P13FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP14FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P14FullReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP1FullReferencer [ 
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P1FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP2InteractedReferencerReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P2InteractedReferencerReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP3InteractedReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P3InteractedReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP4FullInteracted [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P4FullInteracted'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP5FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P5FullReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP6InteractedReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P6InteractedReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP7ReferencerReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P7ReferencerReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP8FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P8FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packageP9FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P9FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> packagePExtensions [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-PExtensions'. 
]
