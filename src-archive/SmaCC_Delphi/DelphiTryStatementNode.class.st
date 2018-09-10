Class {
	#name : #DelphiTryStatementNode,
	#superclass : #DelphiMultiStatementNode,
	#instVars : [
		'tryToken',
		'except',
		'finally',
		'endToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiTryStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTryStatement: self
]

{ #category : #generated }
DelphiTryStatementNode >> endToken [
	^ endToken
]

{ #category : #generated }
DelphiTryStatementNode >> endToken: aSmaCCToken [
	endToken := aSmaCCToken
]

{ #category : #generated }
DelphiTryStatementNode >> except [
	^ except
]

{ #category : #generated }
DelphiTryStatementNode >> except: aDelphiExceptNode [
	self except notNil
		ifTrue: [ self except parent: nil ].
	except := aDelphiExceptNode.
	self except notNil
		ifTrue: [ self except parent: self ]
]

{ #category : #generated }
DelphiTryStatementNode >> finally [
	^ finally
]

{ #category : #generated }
DelphiTryStatementNode >> finally: aDelphiFinallyNode [
	self finally notNil
		ifTrue: [ self finally parent: nil ].
	finally := aDelphiFinallyNode.
	self finally notNil
		ifTrue: [ self finally parent: self ]
]

{ #category : #generated }
DelphiTryStatementNode >> nodeVariables [
	^ #(#except #finally)
]

{ #category : #generated }
DelphiTryStatementNode >> tokenVariables [
	^ #(#tryToken #endToken)
]

{ #category : #generated }
DelphiTryStatementNode >> tryToken [
	^ tryToken
]

{ #category : #generated }
DelphiTryStatementNode >> tryToken: aSmaCCToken [
	tryToken := aSmaCCToken
]
