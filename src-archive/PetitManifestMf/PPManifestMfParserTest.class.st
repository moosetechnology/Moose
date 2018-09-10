Class {
	#name : #PPManifestMfParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #PetitManifestMf
}

{ #category : #'as yet unclassified' }
PPManifestMfParserTest >> parserClass [
	^ PPManifestMfParser
]

{ #category : #'as yet unclassified' }
PPManifestMfParserTest >> testDoublePairsWithCollection [
	self 
		assert: 'Header: value1,value2
Header2: value3, value4'
		is: {'Header'->#('value1' 'value2') . 'Header2'->#('value3' 'value4')}
]

{ #category : #'as yet unclassified' }
PPManifestMfParserTest >> testMultilineDoublePairsWithCollection [
	self 
		assert: 'Header: value1,
 value2
Header2: value3,
 value4' 
		is: {'Header'->#('value1' 'value2') . 'Header2'->#('value3' 'value4')}
]

{ #category : #'as yet unclassified' }
PPManifestMfParserTest >> testMultilineSinglePairWithCollection [
	self assert: 'Header: value1,
 value2' is: {'Header'->#('value1' 'value2')}
]

{ #category : #'as yet unclassified' }
PPManifestMfParserTest >> testSinglePair [
	self assert: 'Header: value' is: {'Header'->#('value')}
]

{ #category : #'as yet unclassified' }
PPManifestMfParserTest >> testSinglePairWithCollection [
	self assert: 'Header: value1, value2' is: {'Header'->#('value1' 'value2')}
]
