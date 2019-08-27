Class {
	#name : #AbstractFAMIXNavigationTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #accessing }
AbstractFAMIXNavigationTest class >> resources [
	^ {FamixStNavigationTestResource}
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
AbstractFAMIXNavigationTest >> getMethod: methodNameString [
	| results |
	results := self model allMethods select: [ :method | method mooseName endsWith: methodNameString ].
	results size = 1 ifFalse: [ self error: 'Not one method named ' , methodNameString ].
	^ results anyOne
]

{ #category : #'helpers - utilites' }
AbstractFAMIXNavigationTest >> model [ 
	 
	^FamixStNavigationTestResource current model
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> n1InteractedReferencerReferee [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> n2FullReferee [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> n3ReferencerReferee [
	 
	^self model entityNamed: 
			#'Model3ReferencerReferee'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> n4FullReferencer [ 
	 
	^self model entityNamed: 
			#'Model4FullReferencer'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> n5InteractedReferencer [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> n6InteractedReferee [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> n7FullInteracted [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> nSmalltalkCore [ 
	 
	^self model entityNamed: #'Smalltalk'
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p10InteractedReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P10InteractedReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p11FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P11FullReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p12FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P12FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p13FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P13FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p14FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P14FullReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p1FullReferencer [ 
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P1FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p2InteractedReferencerReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P2InteractedReferencerReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p3InteractedReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P3InteractedReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p4FullInteracted [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P4FullInteracted'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p5FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P5FullReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p6InteractedReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P6InteractedReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p7ReferencerReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P7ReferencerReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p8FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P8FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> p9FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P9FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFAMIXNavigationTest >> pExtensions [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-PExtensions'. 
]
