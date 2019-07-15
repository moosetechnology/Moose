Class {
	#name : #FAMIXPropertiesTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #tests }
FAMIXPropertiesTest >> testMethodTimeStamp [
	| method |
	method := self model entityNamed: #'Model2FullReferee::M2P4C10FullReferencerInSide.m2p4c10Mtd1()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M2P4C10FullReferencerInSide compiledMethodAt: #m2p4c10Mtd1) timeStamp.
	method := self model entityNamed: #'Model2FullReferee::M2P4C9FullRefereeInSide.m2p4c9Mtd1()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M2P4C9FullRefereeInSide compiledMethodAt: #m2p4c9Mtd1) timeStamp.
	method := self model entityNamed: #'Model2FullReferee::M2P5C11FullRefereeOutSide.m2p5c11Mtd1()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M2P5C11FullRefereeOutSide compiledMethodAt: #m2p5c11Mtd1) timeStamp.
	method := self model entityNamed: #'Model2FullReferee::M2P5C11FullRefereeOutSide.m2p5c11Mtd2()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M2P5C11FullRefereeOutSide compiledMethodAt: #m2p5c11Mtd2) timeStamp.
	method := self model entityNamed: #'Model2FullReferee::M2P5C11FullRefereeOutSide.m2p5c11Mtd3()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M2P5C11FullRefereeOutSide compiledMethodAt: #m2p5c11Mtd3) timeStamp.
	method := self model entityNamed: #'Model2FullReferee::M2P5C11FullRefereeOutSide.m2p5c11Mtd4()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M2P5C11FullRefereeOutSide compiledMethodAt: #m2p5c11Mtd4) timeStamp.
	method := self model entityNamed: #'Model2FullReferee::M2P5C11FullRefereeOutSide.m2p5c11Mtd5()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M2P5C11FullRefereeOutSide compiledMethodAt: #m2p5c11Mtd5) timeStamp.
	method := self model entityNamed: #'Model3ReferencerReferee::M3P7C14ReferencerOutSideRefereeOutSide.m3p7c14Mtd1()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M3P7C14ReferencerOutSideRefereeOutSide compiledMethodAt: #m3p7c14Mtd1) timeStamp.
	method := self model entityNamed: #'Model3ReferencerReferee::M3P7C14ReferencerOutSideRefereeOutSide.m3p7c14Mtd2()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M3P7C14ReferencerOutSideRefereeOutSide compiledMethodAt: #m3p7c14Mtd2) timeStamp.
	method := self model entityNamed: #'Model3ReferencerReferee::M3P7C14ReferencerOutSideRefereeOutSide.m3p7c14Mtd3()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M3P7C14ReferencerOutSideRefereeOutSide compiledMethodAt: #m3p7c14Mtd3) timeStamp.
	method := self model entityNamed: #'Model3ReferencerReferee::M3P7C14ReferencerOutSideRefereeOutSide.m3p7c14Mtd4()'.
	self
		assert: (method propertyNamed: #timeStamp)
		equals: (M3P7C14ReferencerOutSideRefereeOutSide compiledMethodAt: #m3p7c14Mtd4) timeStamp
]
