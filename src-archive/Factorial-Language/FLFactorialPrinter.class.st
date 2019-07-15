"
I implement the pretty printer of the FL language. 
"
Class {
	#name : #FLFactorialPrinter,
	#superclass : #FLFactorialGrammar,
	#category : #'Factorial-Language'
}

{ #category : #grammar }
FLFactorialPrinter >> apply [
	^ super apply ==> [ :nodes | nodes first , nodes second , (nodes third inject: String new into: [ :r :e | r , ' ' , e ]) , nodes fourth ]
]

{ #category : #grammar }
FLFactorialPrinter >> binary [
	^ super binary ==> [ :nodes | nodes first , nodes second , ' ' , nodes third , ' ' , nodes fourth , nodes fifth ]
]

{ #category : #grammar }
FLFactorialPrinter >> condition [
	^ super condition ==> [ :nodes | nodes first , ' ' , nodes second , ' ' , nodes third , ' ' , nodes fourth , ' ' , nodes fifth , ' ' , nodes sixth ]
]

{ #category : #grammar }
FLFactorialPrinter >> function [
	^ super function ==> [ :nodes | nodes first , (nodes second inject: String new into: [ :r :e | r , ' ' , e ]) , ' ' , nodes third , ' ' , nodes fourth ]
]
