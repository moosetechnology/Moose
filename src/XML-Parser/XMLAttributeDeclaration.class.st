"
This is a class for <!ATTLIST> declarations with definitions for single attributes. (An ATTLIST with multiple attribute defs is the same as a series of separate ATTLISTs for each def)
"
Class {
	#name : #XMLAttributeDeclaration,
	#superclass : #XMLDeclarationNode,
	#instVars : [
		'element',
		'attribute',
		'type',
		'defaultPragma',
		'defaultValue'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLAttributeDeclaration class >> element: anElementName attribute: anAttributeName type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	^ self new
		element: anElementName;
		attribute: anAttributeName;
		type: aType;
		defaultPragma: aDefaultPragma;
		defaultValue: aDefaultValue
]

{ #category : #accessing }
XMLAttributeDeclaration >> attribute [
	^ attribute ifNil: [attribute := '']
]

{ #category : #accessing }
XMLAttributeDeclaration >> attribute: anAttributeName [
	attribute := anAttributeName
]

{ #category : #accessing }
XMLAttributeDeclaration >> defaultPragma [
	^ defaultPragma ifNil: [defaultPragma := '']
]

{ #category : #accessing }
XMLAttributeDeclaration >> defaultPragma: aDefaultPragma [
	defaultPragma := aDefaultPragma
]

{ #category : #accessing }
XMLAttributeDeclaration >> defaultValue [
	^ defaultValue ifNil: [defaultValue := '']
]

{ #category : #accessing }
XMLAttributeDeclaration >> defaultValue: aDefaultValue [
	defaultValue := aDefaultValue
]

{ #category : #accessing }
XMLAttributeDeclaration >> element [
	^ element ifNil: [element := '']
]

{ #category : #accessing }
XMLAttributeDeclaration >> element: anElementName [
	element := anElementName
]

{ #category : #accessing }
XMLAttributeDeclaration >> type [
	^ type ifNil: [type := '']
]

{ #category : #accessing }
XMLAttributeDeclaration >> type: aType [ 
	type := aType
]

{ #category : #printing }
XMLAttributeDeclaration >> writeXMLOn: aWriter [
	aWriter attributeDeclaration
		element: self element;
		attribute: self attribute;
		type: self type;
		defaultPragma: self defaultPragma;
		defaultValue: self defaultValue;
		write
]
