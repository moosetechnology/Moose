Class {
	#name : #SingleOptionAtLeastOneSelectionPart,
	#superclass : #SingleOptionPart,
	#category : #'Merlin-Parts'
}

{ #category : #accessing }
SingleOptionAtLeastOneSelectionPart >> options: aCollectionOfOptions [

	super options: aCollectionOfOptions.
	self selectOption: aCollectionOfOptions anyOne  
]

{ #category : #updating }
SingleOptionAtLeastOneSelectionPart >> update: aChange [

	(self options includes: aChange) ifTrue: [
		"(self modelOf: aChange) contents
			ifTrue: [self selectOption: aChange]
			ifFalse: []."
			self selectOption: aChange
		
		]
]
