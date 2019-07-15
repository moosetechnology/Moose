Class {
	#name : #RTLayoutTranslatorTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Layouts-Tests'
}

{ #category : #tests }
RTLayoutTranslatorTest >> testDefault [

	RTLayoutTranslator allSubclasses detect: #isDefault.
	RTLayoutTranslator allSubclasses reverse detect: #isDefault.
]

{ #category : #tests }
RTLayoutTranslatorTest >> testIsDefault [

	self deny: RTLayoutTranslator isDefault
]
