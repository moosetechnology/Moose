Class {
	#name : #ASampleClass,
	#superclass : #Object,
	#instVars : [
		'a',
		'b',
		'c',
		'd',
		'e',
		'f',
		'g'
	],
	#category : #'RoelTyper-Tests'
}

{ #category : #'assignments links' }
ASampleClass >> a [
	a := 5
]

{ #category : #'assignments links' }
ASampleClass >> b [
	b := a
]

{ #category : #'blocks typing' }
ASampleClass >> blockReturn: arg [
	"(TypeCollector typeTmpsIn: (self>>#blockReturn:) ofClass: self) "
	
	self byParam: [:bu | ^bu].
	g := arg.
	
]

{ #category : #'blocks typing' }
ASampleClass >> blockTyping [
	"(TypeCollector typeTmpsIn: (self>>#blockTyping) ofClass: self) "
	|t3 t t2|
	[:s | t2 + 1. t - 1.1] value: 5. 
]

{ #category : #'parameters links' }
ASampleClass >> byParam [
	e := 6.
	self byParam: e
]

{ #category : #'parameters links' }
ASampleClass >> byParam: aTmp [ 
	d := aTmp
]

{ #category : #'assignments links' }
ASampleClass >> c [
	c := b
]

{ #category : #'return links' }
ASampleClass >> return [
	"(TypeCollector typeTmpsIn: (self>>#return) ofClass: self)"
	^5
]

{ #category : #'temporaries typing' }
ASampleClass >> tmpTyping [
	"(TypeCollector typeTmpsIn: (self>>#tmpTyping) ofClass: self) "
	|tmp1 tmp2|
	tmp1 := 1.
	tmp2 :=  tmp1.
]

{ #category : #'return links' }
ASampleClass >> useReturn [
	"(TypeCollector typeInstvar: #f ofClass: self) types"
	^f := self return.
]
