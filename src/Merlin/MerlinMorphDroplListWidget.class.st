Class {
	#name : #MerlinMorphDroplListWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'dropList',
		'formatDictionary'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph contents' }
MerlinMorphDroplListWidget >> dropList [

	^ dropList ifNil: [dropList := self newDropListOn: self wizardPart list: #formatedList ]
]

{ #category : #accessing }
MerlinMorphDroplListWidget >> formatDictionary [

	^ formatDictionary ifNil: [formatDictionary := IdentityDictionary new]
]

{ #category : #'accessing - morph contents' }
MerlinMorphDroplListWidget >> setMorphSize [
	self wizardPart horizontalSize
		ifNotNil: [ 
			self dropList
				hResizing: #rigid;
				vResizing: #shrinkWrap;
				width: self wizardPart horizontalSize ]
]

{ #category : #'accessing - morph contents' }
MerlinMorphDroplListWidget >> specificMorphContents [ 

	self setMorphSize.
	^ self dropList 
]
