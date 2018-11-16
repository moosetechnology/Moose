Class {
	#name : #DelphiDestructorHeaderNode,
	#superclass : #DelphiMethodHeaderNode,
	#instVars : [
		'destructorToken',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiDestructorHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDestructorHeader: self
]

{ #category : #generated }
DelphiDestructorHeaderNode >> destructorToken [
	^ destructorToken
]

{ #category : #generated }
DelphiDestructorHeaderNode >> destructorToken: aSmaCCToken [
	destructorToken := aSmaCCToken
]

{ #category : #generated }
DelphiDestructorHeaderNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiDestructorHeaderNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiDestructorHeaderNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiDestructorHeaderNode >> tokenVariables [
	^ #(#destructorToken #left #right)
]
