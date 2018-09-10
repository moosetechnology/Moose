Class {
	#name : #PPMSEPrettyPrinter,
	#superclass : #PPMSEArrayParser,
	#instVars : [
		'stream'
	],
	#category : #PetitMSE
}

{ #category : #'as yet unclassified' }
PPMSEPrettyPrinter class >> ignoredNames [ 
	^ super ignoredNames , #(stream)
]

{ #category : #'as yet unclassified' }
PPMSEPrettyPrinter >> element [ 
	^ super element 
	
	==> [:token | stream cr; nextPutAll: token printString ]
]

{ #category : #'as yet unclassified' }
PPMSEPrettyPrinter >> elements [
	^ super elements 
	
	==> [:token | stream contents ]
]

{ #category : #'as yet unclassified' }
PPMSEPrettyPrinter >> initialize [ 
	super initialize.   
	stream := String new writeStream.
]
