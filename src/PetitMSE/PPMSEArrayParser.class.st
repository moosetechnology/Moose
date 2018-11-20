Class {
	#name : #PPMSEArrayParser,
	#superclass : #PPMSEGrammar,
	#category : #PetitMSE
}

{ #category : #accessing }
PPMSEArrayParser >> attribute [
	^ super attribute 
	
	==> [:token | Array with: (token at: 2) with: (token at: 3) ]
]

{ #category : #accessing }
PPMSEArrayParser >> attributeValue [
	^ super attributeValue
	
	==> [ :tokens | 
		    (tokens size > 1 or: [ tokens isEmpty ]) 	
				ifTrue: [ tokens ] 
				ifFalse: [ tokens first ]]
]

{ #category : #values }
PPMSEArrayParser >> boolean [ 
	^ super boolean 
	
	==> [:token | token inputValue = 'true' ifTrue: [true] ifFalse: [token inputValue = 'false' ifTrue: [false] ifFalse: [nil]]] 
]

{ #category : #accessing }
PPMSEArrayParser >> element [
	^ super element
	
	==> [:token | Array with: (token at: 2) with: (token at: 3) with: (token at: 4) ]
]

{ #category : #accessing }
PPMSEArrayParser >> elementName [
	^ super elementName
	
	==> [:token | token inputValue ]
]

{ #category : #accessing }
PPMSEArrayParser >> elements [
	^ super elements
	
	==> [:token | token second ]
]

{ #category : #accessing }
PPMSEArrayParser >> id [
	^ super id
	
	==> [:token | Array with: 'id' with: (token at: 3) inputValue asNumber ]
]

{ #category : #values }
PPMSEArrayParser >> integerReference [ 
	^ super integerReference

	==> [:token | Array with: 'ref' with: token "(token at: 3) asNumber" ]
]

{ #category : #values }
PPMSEArrayParser >> nameReference [ 
	^ super nameReference

	==> [:token | Array with: 'ref' with: token ]
]

{ #category : #values }
PPMSEArrayParser >> natural [
	^ super natural
	
	==> [ :token | token value asNumber ]
]

{ #category : #values }
PPMSEArrayParser >> number [
	^ super number
	
	==> [ :token | (token inputValue copyReplaceAll: 'E' with: 'e') asNumber ]
]

{ #category : #values }
PPMSEArrayParser >> primitive [ 
	^ super primitive
]

{ #category : #accessing }
PPMSEArrayParser >> simpleName [
	^ super simpleName
	
	==> [:token | token inputValue ]
]

{ #category : #values }
PPMSEArrayParser >> string [
	^ super string
		
	==> [ :token | token second ]
]

{ #category : #basic }
PPMSEArrayParser >> stringText [
	^ super stringText
	
	==> [:token | 
		 token inputValue
			copyReplaceAll: ''''''
			with: '''' ]
]
