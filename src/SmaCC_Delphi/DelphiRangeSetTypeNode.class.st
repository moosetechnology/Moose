Class {
	#name : #DelphiRangeSetTypeNode,
	#superclass : #DelphiSetTypeNode,
	#instVars : [
		'setValue'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiRangeSetTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRangeSetType: self
]

{ #category : #generated }
DelphiRangeSetTypeNode >> nodeVariables [
	^ #(#setValue)
]

{ #category : #generated }
DelphiRangeSetTypeNode >> setValue [
	^ setValue
]

{ #category : #generated }
DelphiRangeSetTypeNode >> setValue: aDelphiRangeTypeNode [
	self setValue notNil
		ifTrue: [ self setValue parent: nil ].
	setValue := aDelphiRangeTypeNode.
	self setValue notNil
		ifTrue: [ self setValue parent: self ]
]
