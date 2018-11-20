Class {
	#name : #MultipleOptionPart,
	#superclass : #OptionPart,
	#instVars : [
		'selectedOptions'
	],
	#category : #'Merlin-Parts'
}

{ #category : #accessing }
MultipleOptionPart >> basicSelectedOptions [

	^ selectedOptions ifNil: [selectedOptions := OrderedCollection withAll: self selectedOptions]
]

{ #category : #accessing }
MultipleOptionPart >> basicSelectedOptions: aCollectionOfSelectedOptions [


	"self optionsAndModels keysAndValuesDo: [:anOption :aModel | 
		aModel contents = (aCollectionOfSelectedOptions includes: anOption) 
			ifTrue: [
				aModel safeContents: aModel contents not
			]
		]."
	selectedOptions := aCollectionOfSelectedOptions.
	self selectedOptions: aCollectionOfSelectedOptions   
]

{ #category : #accessing }
MultipleOptionPart >> deselectAllOptions [

	self optionsAndModels valuesDo: [:aModel |
		aModel contents: false
		]
]

{ #category : #accessing }
MultipleOptionPart >> deselectOption: anOption [

	self setOption: anOption to: false   
]

{ #category : #accessing }
MultipleOptionPart >> selectAllOptions [

	self optionsAndModels valuesDo: [:aModel |
		aModel contents: true
		]
]

{ #category : #accessing }
MultipleOptionPart >> selectOption: anOption [

	self setOption: anOption to: true   
]

{ #category : #accessing }
MultipleOptionPart >> selectedOptions [

	|tmpResult|
	tmpResult := OrderedCollection  new.
	self optionsAndModels keysAndValuesDo: [:anOption :aModel |
		(aModel contents = true) ifTrue: [tmpResult add: anOption]
		] .
	^ tmpResult
]

{ #category : #accessing }
MultipleOptionPart >> selectedOptions: aCollectionOfOptions [


	self optionsAndModels keysAndValuesDo: [:anOption :aModel |
		(aCollectionOfOptions includes: anOption)
			ifTrue: [aModel safeContents: true  ]
			ifFalse: [aModel safeContents: false  ]
		] .
]

{ #category : #accessing }
MultipleOptionPart >> setOption: anOption to: trueOrFalse [

	(self optionsAndModels at: anOption) contents: trueOrFalse 
]

{ #category : #accessing }
MultipleOptionPart >> setOptions: aCollectionOfOptions to: trueOrFalse [

	aCollectionOfOptions do: [:anOption |
		self setOption: anOption to: trueOrFalse   
		]
]

{ #category : #updating }
MultipleOptionPart >> update: aChange [

	(self options includes: aChange) ifTrue: [
		self hasChanged: (aChange -> (self modelOfOption: aChange) contents)  
		] 
]
