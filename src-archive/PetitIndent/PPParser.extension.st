Extension { #name : #PPParser }

{ #category : #'*PetitIndent' }
PPParser >> olToken [
	^ PPTokenOLParser on: self
]

{ #category : #'*PetitIndent' }
PPParser >> pop [
	"pop myself from the indent stack, fail if I am not on top of the stack"
	^ [:context | 
			| retval |
			retval := context indentStack pop.
			(retval = self) ifFalse: [ 
				PPFailure message: self asString, 'is not on top of the stack, cannot pop!'
			] ifTrue: [  
				retval
			] 
	] asParser
]

{ #category : #'*PetitIndent' }
PPParser >> push [
	"evaluate myself and if I dont' fail, push the result on the indent stack"
	^ PPPushParser on: self
]

{ #category : #'*PetitIndent' }
PPParser >> pushAsParser [
	"evaluate myself and if I dont' fail, push the parser made from result on the indent stack"
	^ PPPushAsParserParser on: self
]

{ #category : #'*PetitIndent' }
PPParser >> trimAlign [
	"
		trim blanks and check if I am aligned
	"
	^ (#align asParser, #blank asParser not, self ==> #last)

	
]

{ #category : #'*PetitIndent' }
PPParser >> trimOffside [
	"
		trim blanks and check if I am in offside position
	"
	^ 
	(#offside asParser, self ==> #last)" /
	(#startOfLine asParser not, #blank asParser star, self ==> #last)"

	
]

{ #category : #'*PetitIndent' }
PPParser >> trimOnside [
	"
		trim blanks and check if I am in onside position
	"
	^
	(#onside asParser, self ==> #last)" /
	(#startOfLine asParser not, #blank asParser star, self ==> #last)"

	
]
