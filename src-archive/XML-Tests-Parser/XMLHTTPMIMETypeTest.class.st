Class {
	#name : #XMLHTTPMIMETypeTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-HTTP'
}

{ #category : #asserting }
XMLHTTPMIMETypeTest >> assertMIMEType: aFirstMIMEType doesNotEqual: aSecondMIMEType [
	self
		deny: aFirstMIMEType = aSecondMIMEType;
		deny: aSecondMIMEType = aFirstMIMEType
]

{ #category : #asserting }
XMLHTTPMIMETypeTest >> assertMIMEType: aFirstMIMEType equals: aSecondMIMEType [
	self
		assert: aFirstMIMEType = aSecondMIMEType;
		assert: aSecondMIMEType = aFirstMIMEType
]

{ #category : #tests }
XMLHTTPMIMETypeTest >> testCharset [
	self assert:
		(XMLHTTPMIMEType
			mainType: 'text'
			subType: 'plain') charset = XMLHTTPMIMEType defaultCharset.
	self assert:
		(XMLHTTPMIMEType
			mainType: 'text'
			subType: 'plain'
			parameters:
				(OrderedCollection with: 'charset' -> 'utf8')) charset = 'utf8'.
	self assert:
		(XMLHTTPMIMEType
			mainType: 'text'
			subType: 'plain'
			parameters:
				(OrderedCollection
					with: 'charset' -> 'utf16'
					with: 'charset' -> 'utf8')) charset = 'utf16'.
]

{ #category : #tests }
XMLHTTPMIMETypeTest >> testEquals [
	self
		assertMIMEType:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'plain')
		doesNotEqual:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'html').
	self
		assertMIMEType:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'xml')
		doesNotEqual:
			(XMLHTTPMIMEType
				mainType: 'application'
				subType: 'xml').
	self
		assertMIMEType:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'plain')
		equals:
			(XMLHTTPMIMEType
				mainType: 'Text'
				subType: 'PLAIN').

	self
		assertMIMEType:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'plain'
				parameters: (OrderedCollection with: 'charset' -> 'utf-8'))
		doesNotEqual:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'plain'
				parameters: (OrderedCollection with: 'charset' -> 'utf-16')).
	self
		assertMIMEType:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'plain'
				parameters:
					(OrderedCollection
						with: 'charset' -> 'utf-8'
						with: 'name' -> 'value'))
		doesNotEqual:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'plain'
				parameters:
					(OrderedCollection
						with: 'name' -> 'value'
						with: 'charset' -> 'utf-16')).
	self
		assertMIMEType:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'plain'
				parameters:
					(OrderedCollection
						with: 'charset' -> 'utf-8'
						with: 'name' -> 'value'))
		equals:
			(XMLHTTPMIMEType
				mainType: 'Text'
				subType: 'PLAIN'
				parameters:
					(OrderedCollection
						with: 'Name' -> 'value'
						with: 'CHARSET' -> 'utf-8')).
	self
		assertMIMEType:
			(XMLHTTPMIMEType
				mainType: 'text'
				subType: 'plain'
				parameters:
					(OrderedCollection
						with: 'charset' -> 'utf-8'
						with: 'charset' -> 'utf-8'
						with: 'name' -> 'value'))
		equals:
			(XMLHTTPMIMEType
				mainType: 'Text'
				subType: 'PLAIN'
				parameters:
					(OrderedCollection
						with: 'Charset' -> 'utf-8'
						with: 'NAME' -> 'value'
						with: 'charset' -> 'utf-8')).
]

{ #category : #tests }
XMLHTTPMIMETypeTest >> testHash [
	self assert:
		(XMLHTTPMIMEType
			mainType: 'text'
			subType: 'plain') hash =
			(XMLHTTPMIMEType
				mainType: 'Text'
				subType: 'PLAIN') hash.

	self assert:
		(XMLHTTPMIMEType
			mainType: 'text'
			subType: 'plain'
			parameters:
				(OrderedCollection
					with: 'charset' -> 'utf-8'
					with: 'name' -> 'value')) hash =
			(XMLHTTPMIMEType
				mainType: 'Text'
				subType: 'PLAIN'
				parameters:
					(OrderedCollection
						with: 'Name' -> 'value'
						with: 'CHARSET' -> 'utf-8')) hash.

	self assert:
		(XMLHTTPMIMEType
			mainType: 'text'
			subType: 'plain'
			parameters:
				(OrderedCollection
					with: 'charset' -> 'utf-8'
					with: 'charset' -> 'utf-8'
					with: 'name' -> 'value')) hash =
			(XMLHTTPMIMEType
				mainType: 'Text'
				subType: 'PLAIN'
				parameters:
					(OrderedCollection
						with: 'Charset' -> 'utf-8'
						with: 'NAME' -> 'value'
						with: 'charset' -> 'utf-8')) hash.
]

{ #category : #tests }
XMLHTTPMIMETypeTest >> testMainType [
	#('{1}'
		' {1} '
		'{1}/'
		' {1} / '
		'{1};'
		' {1} ; '
		'{1}/xml'
		' {1} / xml '
		'{1};charset=utf8'
		' {1} ; charset=utf8 ')
		do: [:template |
			#(#('application') #('Application') #('APPLICATION'))
				do: [:values |
					self assert:
						(XMLHTTPMIMEType fromString:
							(template format: values)) mainType = 'application']].
	#(''
		' '
		'/'
		' / '
		';'
		' ; '
		'/xml'
		' / xml '
		';charset=utf8'
		' ; charset=utf8 '
		'/xml;charset=utf8'
		' / xml ; charset=utf8 ')
		do: [:each |
			self assert: (XMLHTTPMIMEType fromString: each) mainType = ''].
]

{ #category : #tests }
XMLHTTPMIMETypeTest >> testParameters [
	#(';{1}={2};{3}={4}'
		' ; {1} = {2} ; {3} = {4} '
		';{1}={2};{3}={4};'
		' ; {1} = {2} ; {3} = {4} ; '
		'application;{1}={2};{3}={4}'
		' application ; {1} = {2} ; {3} = {4} '
		'application;{1}={2};{3}={4};'
		' application ; {1} = {2} ; {3} = {4} ; '
		'/xml;{1}={2};{3}={4}'
		' / xml ; {1} = {2} ; {3} = {4} '
		'/xml;{1}={2};{3}={4};'
		' / xml ; {1} = {2} ; {3} = {4} ; '
		'application/xml;{1}={2};{3}={4}'
		' application / xml ; {1} = {2} ; {3} = {4} '
		'application/xml;{1}={2};{3}={4};'
		' application / xml ; {1} = {2} ; {3} = {4} ; ')
		do: [:template |
			#(#('charset' 'utf8' 'custom' 'value')
				#('Charset' 'Utf8' 'Custom' 'Value')
				#('CHARSET' 'UTF8' 'CUSTOM' 'VALUE')
				#('charset' '' '' 'value')
				#('' 'utf8' 'custom' '')
				#('' '' '' '')
				#('name' '" quoted value "' 'name2' '"quoted/value"')
				#('name' '"quoted;value"' 'name2' '"quoted=value"')
				#('name' '"quoted\"value"' 'name2' '"quotedvalue\\"')
				#('duplicate' 'one' 'DUPLICATE' 'two' 'Duplicate' 'three'))
				do: [:values | | mimeType parameters attributes |
					mimeType :=
						XMLHTTPMIMEType fromString:
							(template format: values).
					"no GS #pairsCollect:"
					parameters := OrderedCollection new.
					attributes := Set new.
					values pairsDo: [:key :value | | attribute |
						attribute := key asLowercase.
						(attributes includes: attribute)
							ifFalse: [
								parameters addLast: attribute -> value.
								attributes add: attribute]].
					self assert: mimeType parameters = parameters]].
	#(''
		' '
		'/'
		' / '
		';'
		' ; '
		'application'
		' application '
		'application/'
		' application / '
		'application;'
		' application ; '
		'/xml'
		'  / xml '
		'/xml;'
		' / xml ; '
		'application/xml'
		' application / xml '
		'application/xml;'
		' application /xml ; '
		';"invalid"=value'
		' ; "invalid" = value '
		'application;"invalid"=value'
		' application ; "invalid" = value '
		'application/xml;"invalid"=value'
		' application / xml ; "invalid" = value ')
		do: [:each |
			self assert: (XMLHTTPMIMEType fromString: each) parameters isEmpty].
]

{ #category : #tests }
XMLHTTPMIMETypeTest >> testPrintOn [
	self assert:
		(XMLHTTPMIMEType
			mainType: 'text'
			subType: 'plain') printString = 'text/plain'.
	self assert:
		(XMLHTTPMIMEType
			mainType: 'text'
			subType: 'plain'
			parameters:
				(OrderedCollection with: 'charset' -> 'utf8')) printString =
					'text/plain; charset=utf8'.
	self assert:
		(XMLHTTPMIMEType
			mainType: 'text'
			subType: 'plain'
			parameters:
				(OrderedCollection
					with: 'charset' -> 'utf8'
					with: 'name' -> 'value')) printString =
						'text/plain; charset=utf8; name=value'.
]

{ #category : #tests }
XMLHTTPMIMETypeTest >> testSubType [
	#('/{1}'
		' / {1} '
		'application/{1}'
		' application / {1} '
		'/{1};'
		' / {1} ; '
		'/{1};charset=utf8'
		' / {1} ; charset=utf8 '
		'application/{1};charset=utf8'
		' application / {1} ; charset=utf8')
		do: [:template |
			#(#('xml') #('Xml') #('XML'))
				do: [:values |
					self assert:
						(XMLHTTPMIMEType fromString:
							(template format: values)) subType = 'xml']].
	#(''
		' '
		'/'
		' / '
		';'
		' ; '
		'application'
		' application '
		'application/'
		' application / '
		';charset=utf8'
		' ; charset=utf8 '
		'application/;charset=utf8'
		' application / ; charset=utf8 ')
		do: [:each |
			self assert: (XMLHTTPMIMEType fromString: each) subType = ''].
]
