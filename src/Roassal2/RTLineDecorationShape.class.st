"
A DCRTLineDecorationShape contains information about trachel shape used as line heads or tails with DCRTAbstractLineDecoration

Usage: 
	DCRTLineHead shape: DCRTEmptyArrow
	or
	DCRTEmptyArrow asHead
"
Class {
	#name : #RTLineDecorationShape,
	#superclass : #RTObject,
	#category : #'Roassal2-LineDecorations'
}

{ #category : #converting }
RTLineDecorationShape class >> asHead [
	^ RTLineHead shape: self
]

{ #category : #converting }
RTLineDecorationShape class >> asTail [
	^ RTLineTail shape: self
]

{ #category : #hooks }
RTLineDecorationShape class >> trachelShapeClass [
	^ TRAbstractLineDecoratorShape
]
