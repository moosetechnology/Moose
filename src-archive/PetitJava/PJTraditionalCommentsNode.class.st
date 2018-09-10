"
{'*'. {{Character cr. nil}. {{nil. Character space}. {{nil. Character space}. {{nil. Character space}. {{nil. Character space}. {{nil. Character space}. {'*'. {{nil. Character space}. {#(nil $@). {#(nil $p). {#(nil $a). {#(nil $r). {#(nil $a). {#(nil $m). {{nil. Character space}. {#(nil $a). {#(nil $r). {#(nil $g). {#(nil $s). {{nil. Character space}. {{Character cr. nil}. {{nil. Character space}. {{nil. Character space}. {{nil. Character space}. {{nil. Character space}. {{nil. Character space}. {'*'. {{nil. Character space}. {#(nil $@). {#(nil $r). {#(nil $e). {#(nil $t). {#(nil $u). {#(nil $r). {#(nil $n). {{nil. Character space}. {#(nil $v). {#(nil $o). {#(nil $i). {#(nil $d). {{Character cr. nil}. {{nil. Character space}. {{nil. Character space}. {{nil. Character space}. {{nil. Character space}. {{nil. Character space}. #('*' '/')}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
"
Class {
	#name : #PJTraditionalCommentsNode,
	#superclass : #PJCommentsNode,
	#category : #'PetitJava-AST'
}

{ #category : #'as yet unclassified' }
PJTraditionalCommentsNode >> comment: anArray [
	| temp temp2 |
	temp := OrderedCollection new.
	temp2 := anArray.
	temp2
		ifNotNil: [ 
			[ temp2 first = '*' and: temp2 second = '/' ]
				whileFalse: [ 
					temp2 first = '*'
						ifFalse: [ temp2 first second ifNotNil: [ temp add: temp2 first second ] ]
						ifTrue: [ temp2 first first ifNotNil: [ temp add: temp2 first first ] ].
					temp2 := temp2 second ].
			comment := (temp collect: #asciiValue) asByteArray asString ].
	anArray isNil
		ifTrue: [ comment := '' ]
]

{ #category : #'as yet unclassified' }
PJTraditionalCommentsNode >> printOn: aStream [
	^	aStream 
		nextPutAll: 'comment value ==> ';
		nextPutAll: self comment.
  
]
