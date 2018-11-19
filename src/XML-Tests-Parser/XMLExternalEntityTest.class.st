"
These tests use HTTP and the file system and are skipped by default. This enables them:
	self stopSkipping
"
Class {
	#name : #XMLExternalEntityTest,
	#superclass : #XMLSkippableTest,
	#instVars : [
		'tempFileManager'
	],
	#category : #'XML-Tests-Parser'
}

{ #category : #testing }
XMLExternalEntityTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLExternalEntityTest class >> skippableTests [
	^ #(testExternalSubsetReadLimit
			testOnFileNamed
			testOnURL
			testOnURLUpToLimit
			testParsingDocBookArticle
			testParsingDocBookExample
			testParsingEncodedFile
			testParsingEncodedFileWithBOM
			testParsingEncodedFileWithEncodingAttribute
			testParsingEncodedFileWithEncodingAttributeAndBOM
			testParsingExternalEntities
			testParsingExternalEntitiesLimit
			testParsingFile
			testParsingRetrievedURL
			testParsingStrictXHTMLDocument
			testParsingStrictXHTMLStyledDocument
			testParsingURL)
]

{ #category : #accessing }
XMLExternalEntityTest >> defaultTimeLimit [
	"this is needed for Pharo5+ to prevent it from timing out
	the long-running HTTP tests when skipping is disabled"
	^ self defaultTimeout seconds
]

{ #category : #accessing }
XMLExternalEntityTest >> defaultTimeout [
	"this is needed for Squeak to prevent it from timing out
	the long-running HTTP tests when skipping is disabled"
	^ 60 * 10
]

{ #category : #source }
XMLExternalEntityTest >> docBookArticleSource [
	^ '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE article PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://docbook.org/xml/4.5/docbookx.dtd">
<article>
	<articleinfo>
		<title>About Pharo</title>
		<author>
			<honorific>Dr.</honorific>
			<firstname>Stephane</firstname>
			<surname>Ducasse</surname>
		</author>
	</articleinfo>
	<section>
		<title>Mission</title>
		<para>Pharo''s goal is to deliver a clean, innovative, free open-source environment. Here is the to be revised Pharo vision document.</para>
		<para>By providing a stable and small core system, excellent developing tools, and maintained releases, Pharo is an attractive platform to build and deploy mission critical applications.</para>
		<para>Pharo fosters a healthy ecosystem of both private and commercial contributors who advance and maintain the core system and its external packages.</para>
	</section>
	<section>
		<title>Pharo features</title>
		<para>A dynamic, pure object-oriented programming language in the tradition of Smalltalk</para>
		<para>An IDE (integrated development environment)</para>
		<para>A huge library and set of external packages</para>
	</section>
	<section>
		<title>Pharo and Business</title>
		<para>The goal of Pharo is to sustain and grow business.</para>
		<para>Pharo is supported by the industrial Pharo consortium.</para>
		<para>Pharo has also an association of users: Pharo association</para>
    </section>
</article>'
]

{ #category : #source }
XMLExternalEntityTest >> docBookExampleSource [
	^ '<!DOCTYPE example
	PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
	"http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd">
	<example>
		<title>An Example</title>
		<programlisting>
		XMLDocument root:
			((XMLElement named: ''test'')
				addNode: ''An example'' asXMLString;
				yourself)
		</programlisting>
	</example>'
]

{ #category : #accessing }
XMLExternalEntityTest >> encodingNames [
	^ #('UTF-8' 'UTF-16' 'UTF-16-LE' 'UTF-32' 'UTF-32-LE')
]

{ #category : #accessing }
XMLExternalEntityTest >> feedURL [
	^ 'http://www.squeaksource.com/feed.rss'
]

{ #category : #source }
XMLExternalEntityTest >> musicXMLDocument [
	^ '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE score-partwise PUBLIC
    "-//Recordare//DTD MusicXML 3.0 Partwise//EN"
    "http://www.musicxml.org/dtds/partwise.dtd">
<score-partwise version="3.0">
  <part-list>
    <score-part id="P1">
      <part-name>Music</part-name>
    </score-part>
  </part-list>
  <part id="P1">
    <measure number="1">
      <attributes>
        <divisions>1</divisions>
        <key>
          <fifths>0</fifths>
        </key>
        <time>
          <beats>4</beats>
          <beat-type>4</beat-type>
        </time>
        <clef>
          <sign>G</sign>
          <line>2</line>
        </clef>
      </attributes>
      <note>
        <pitch>
          <step>C</step>
          <octave>4</octave>
        </pitch>
        <duration>4</duration>
        <type>whole</type>
      </note>
    </measure>
  </part>
</score-partwise>
'.
]

{ #category : #source }
XMLExternalEntityTest >> strictXHTMLDocumentSource [
	^ '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Virtual Library</title>
  </head>
  <body>
    <p>Moved to <a href="http://example.org/">example.org</a>.</p>
  </body>
</html>'
]

{ #category : #source }
XMLExternalEntityTest >> strictXHTMLStyledDocumentSource [
	^ '<?xml-stylesheet href="http://www.w3.org/StyleSheets/TR/W3C-REC.css" type="text/css"?>
<?xml-stylesheet href="#internalStyle" type="text/css"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>An internal stylesheet example</title>
<style type="text/css" id="internalStyle">
  code {
    color: green;
    font-family: monospace;
    font-weight: bold;
  }
</style>
</head>
<body>
<p>
  This is text that uses our 
  <code>internal stylesheet</code>.
</p>
</body>
</html>'
]

{ #category : #accessing }
XMLExternalEntityTest >> tempFileManager [
	^ tempFileManager ifNil: [tempFileManager := XMLTempFileManager new]
]

{ #category : #tests }
XMLExternalEntityTest >> testExternalSubsetReadLimit [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testExternalSubsetReadLimit.

	self tempFileManager newFileHandleDo: [:fileHandle |
		| xml externalSubset parser |

		externalSubset := '<?xml encoding="UTF-8"?><!ELEMENT test EMPTY>'.
		self tempFileManager
			createFileWithContents: externalSubset
			forHandle: fileHandle.
		xml := '<!DOCTYPE test SYSTEM "', fileHandle path, '"><test/>'.

		self
			shouldnt: [
				(parser := SAXHandler on: xml)
					externalEntityResolver externalSubsetReadLimit:
						externalSubset size.
				parser
					resolvesExternalEntities: true;
					parseDocument]
			raise: XMLLimitException.

		self
			should: [
				(parser := SAXHandler on: xml)
					externalEntityResolver externalSubsetReadLimit:
						externalSubset size - 1.
				parser
					resolvesExternalEntities: true;
					parseDocument]
			raise: XMLLimitException].
]

{ #category : #tests }
XMLExternalEntityTest >> testOnFileNamed [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testOnFileNamed.

	self tempFileManager newFileHandleDo: [:fileHandle | | parser |
		self tempFileManager
			createFileWithContents: '<test/>'
			forHandle: fileHandle.
		self
			shouldnt: [parser := SAXHandler onFileNamed: fileHandle path]
			raise: XMLFileException.
		self
			assert: parser documentURI = fileHandle path;
			assert: parser documentURI asXMLURI isLocal].
]

{ #category : #tests }
XMLExternalEntityTest >> testOnURL [
	| parser |

	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testOnURL.

	self
		shouldnt: [parser := SAXHandler onURL: self feedURL]
		raise: XMLHTTPException.
	self
		assert: parser documentURI = self feedURL;
		deny: parser documentURI asXMLURI isLocal.
]

{ #category : #tests }
XMLExternalEntityTest >> testOnURLUpToLimit [
	| parser size |

	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testOnURLUpToLimit.

	size :=
		(self feedURL asXMLURI
			getUpToLimit: nil
			decoding: false) size.
	self
		shouldnt: [
			parser :=
				SAXHandler
					onURL: self feedURL
					upToLimit: size]
		raise: XMLLimitException.
	self assert: parser documentReadLimit = size.

	self
		should: [
			(SAXHandler
				onURL: self feedURL
				upToLimit: size - 1)
				parseDocument]
		raise: XMLLimitException.
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingDocBookArticle [
	"This uses HTTP so is skipped by default"

	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingDocBookArticle.

	self
		shouldnt: [
			(SAXHandler on: self docBookArticleSource)
				resolvesExternalEntities: true;
				removeLimits;
				parseDocument]
		raise: XMLParserException.
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingDocBookExample [
	"This uses HTTP so is skipped by default"

	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingDocBookExample.

	self
		shouldnt: [
			(SAXHandler on: self docBookExampleSource)
				resolvesExternalEntities: true;
				removeLimits;
				parseDocument]
		raise: XMLParserException.
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingEncodedFile [
	"This test creates/deletes a file so is skipped by default"
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingEncodedFile.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self encodingNames do: [:encoding | | document documentFromFile |
			document := XMLDOMParser parse: self wideCharacterXML.
			fileHandle writeStreamDo: [:stream |
				stream
					streamConverter: encoding asXMLStreamConverter;
					nextPutAll: document printString].
			self
				shouldnt: [
					documentFromFile :=
						XMLDOMParser parseFileNamed: fileHandle path]
				raise: XMLFileException.
			self
				assert: documentFromFile encoding = '';
				assert: documentFromFile printString = document printString]].
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingEncodedFileWithBOM [
	"This test creates/deletes a file so is skipped by default"
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingEncodedFileWithBOM.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self encodingNames do: [:encoding | | document documentFromFile |
			document := XMLDOMParser parse: self wideCharacterXML.
			fileHandle writeStreamDo: [:stream |
				stream
					streamConverter: encoding asXMLStreamConverter;
					nextPutByteOrderMark;
					nextPutAll: document printString].
			self
				shouldnt: [
					documentFromFile :=
						XMLDOMParser parseFileNamed: fileHandle path]
				raise: XMLFileException.
			self
				assert: documentFromFile encoding = '';
				assert: documentFromFile printString = document printString]].
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingEncodedFileWithEncodingAttribute [
	"This test creates/deletes a file so is skipped by default"
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingEncodedFileWithEncodingAttribute.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self encodingNames do: [:encoding | | document documentFromFile |
			document := XMLDOMParser parse: self wideCharacterXML.
			document encoding: encoding.
			fileHandle writeStreamDo: [:stream |
				stream
					streamConverter: encoding asXMLStreamConverter;
					nextPutAll: document printString].
			self
				shouldnt: [
					documentFromFile :=
						XMLDOMParser parseFileNamed: fileHandle path]
				raise: XMLFileException.
			self
				assert: documentFromFile encoding = encoding;
				assert: documentFromFile printString = document printString]].
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingEncodedFileWithEncodingAttributeAndBOM [
	"This test creates/deletes a file so is skipped by default"
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingEncodedFileWithEncodingAttributeAndBOM.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self encodingNames do: [:encoding | | document documentFromFile |
			document := XMLDOMParser parse: self wideCharacterXML.
			document encoding: encoding.
			fileHandle writeStreamDo: [:stream |
				stream
					streamConverter: encoding asXMLStreamConverter;
					nextPutByteOrderMark;
					nextPutAll: document printString].
			self
				shouldnt: [
					documentFromFile :=
						XMLDOMParser parseFileNamed: fileHandle path]
				raise: XMLFileException.
			self
				assert: documentFromFile encoding = encoding;
				assert: documentFromFile printString = document printString]].
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingExternalEntities [
	"This test uses HTTP so is skipped by default."
	| entityCacheCopy |

	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingExternalEntities.

	DTDCachingExternalEntityResolver clearEntityCache.
	self assert: DTDCachingExternalEntityResolver entityCache isEmpty.

	SAXHandler
		parse: self musicXMLDocument
		usingNamespaces: true
		validation: true
		externalEntities: true.
	self deny: DTDCachingExternalEntityResolver entityCache isEmpty.

	"ensure there is no re-requesting of cached entities"
	entityCacheCopy := DTDCachingExternalEntityResolver entityCache copy.
	SAXHandler
		parse: self musicXMLDocument
		usingNamespaces: true
		validation: true
		externalEntities: true.
	DTDCachingExternalEntityResolver entityCache keysAndValuesDo: [:key :value |
		self assert:
			(entityCacheCopy
				at: key
				ifAbsent: [self fail]) == value].
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingExternalEntitiesLimit [
	"This test uses HTTP so is skipped by default."
	| handler parser limitedResolver totalResolvedExternalEntities |

	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingExternalEntitiesLimit.

	DTDCachingExternalEntityResolver clearEntityCache.

	(handler := SAXHandler on: self musicXMLDocument)
		resolvesExternalEntities: true.
	parser := handler parser.
	(limitedResolver := parser driver externalEntityResolver)
		maxExternalEntities: nil.
	parser parseDocument.
	totalResolvedExternalEntities := limitedResolver totalResolvedExternalEntities.
	self assert: totalResolvedExternalEntities > 0.

	"should report the same number of resolved entities each time, even if
	they were cached, to ensure deterministic behavior regardless of which
	resolver is used or the state of the cache"
	(handler := SAXHandler on: self musicXMLDocument)
		resolvesExternalEntities: true.
	parser := handler parser.
	(limitedResolver := parser driver externalEntityResolver)
		maxExternalEntities: totalResolvedExternalEntities.
	parser parseDocument.
	self assert:
		limitedResolver totalResolvedExternalEntities =
			totalResolvedExternalEntities.

	(handler := SAXHandler on: self musicXMLDocument)
		resolvesExternalEntities: true.
	parser := handler parser.
	(limitedResolver := parser driver externalEntityResolver)
		maxExternalEntities: totalResolvedExternalEntities - 1.
	self
		should: [parser parseDocument]
		raise: XMLLimitException.
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingFile [
	"This test creates/deletes a file so is skipped by default"
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingFile.

	self tempFileManager newFileHandleDo: [:fileHandle | | document |
		self
			should: [XMLDOMParser parseFileNamed: fileHandle path]
			raise: XMLFileException.

		self tempFileManager
			createFileWithContents: self musicXMLDocument
			forHandle: fileHandle.
		self
			shouldnt: [document := XMLDOMParser parseFileNamed: fileHandle path]
			raise: XMLFileException.
		self assert: (document root isNamed: 'score-partwise')].
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingStrictXHTMLDocument [
	"This uses HTTP so is skipped by default"

	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingStrictXHTMLDocument.

	self
		shouldnt: [
			(SAXHandler on: self strictXHTMLDocumentSource)
				resolvesExternalEntities: true;
				removeLimits;
				parseDocument]
		raise: XMLParserException.
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingStrictXHTMLStyledDocument [
	"This uses HTTP so is skipped by default"

	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingStrictXHTMLStyledDocument.

	self
		shouldnt: [
			(SAXHandler on: self strictXHTMLStyledDocumentSource)
				resolvesExternalEntities: true;
				removeLimits;
				parseDocument]
		raise: XMLParserException.
]

{ #category : #tests }
XMLExternalEntityTest >> testParsingURL [
	"This uses HTTP so is skipped by default"
	| doc |

	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testParsingURL.

	self
		shouldnt: [doc := XMLDOMParser parseURL: self feedURL]
		raise: XMLHTTPException.
	self assert: (doc root isNamed: 'rss').
]

{ #category : #source }
XMLExternalEntityTest >> wideCharacterXML [
	^ '<?xml version="1.0"?>
		<currency>
			<name>Euro</name>
			<symbol>{1}</symbol>
			<sub>
				<name>Cent</name>
				<symbol>{2}</symbol>
				<total>100</total>
			</sub>
		</currency>'
			format:
				(Array
					with: 16r20AC asCharacter
					with: 16rA2 asCharacter)
]
