Class {
	#name : #DelphiMetaclassTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'classToken',
		'ofToken',
		'name'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMetaclassTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMetaclassType: self
]

{ #category : #generated }
DelphiMetaclassTypeNode >> classToken [
	^ classToken
]

{ #category : #generated }
DelphiMetaclassTypeNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
DelphiMetaclassTypeNode >> name [
	^ name
]

{ #category : #generated }
DelphiMetaclassTypeNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiMetaclassTypeNode >> ofToken [
	^ ofToken
]

{ #category : #generated }
DelphiMetaclassTypeNode >> ofToken: aSmaCCToken [
	ofToken := aSmaCCToken
]

{ #category : #generated }
DelphiMetaclassTypeNode >> tokenVariables [
	^ #(#classToken #ofToken #name)
]
