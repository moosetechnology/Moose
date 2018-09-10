Class {
	#name : #PPNestedStmtListsParserTest,
	#superclass : #PPCompositeParserTest,
	#instVars : [
		'aPPContext'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #'as yet unclassified' }
PPNestedStmtListsParserTest >> parserClass [
	^ PPNestedStmtListsParser
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParserTest >> testCommand [
	self parse: 'abc' rule: #command.
	
	self assert: result = 'abc'.
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParserTest >> testCommand2 [
	self parse: 'abcA' rule: #command.
	self parse: 'abcA1' rule: #command.	
	self parse: 'abcA2' rule: #command.
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParserTest >> testList [
	self parse: 
'
 stmtA
 stmtB
 stmtC
' rule: #list.


	self assert: result size = 3.
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParserTest >> testList2 [
	self parse: 
'
 stmtA
 stmtB
    stmtC1
    stmtC2
 stmtD
' rule: #list.


	self assert: result size = 4.
	self assert: result third size = 2.
]

{ #category : #'as yet unclassified' }
PPNestedStmtListsParserTest >> testList3 [
	self parse: 
'
 stmtA
 stmtB
    stmtC1
      stmtC11
 stmtD
    stmtE1
    stmtE2
 stmtF
 stmtG
' rule: #list.


	self assert: result size = 7.
	self assert: result third size = 2.
	self assert: result third second size = 1.
	self assert: result third second first = 'stmtC11'.
	self assert: result fourth = 'stmtD'.
	self assert: result fifth size = 2.
]
