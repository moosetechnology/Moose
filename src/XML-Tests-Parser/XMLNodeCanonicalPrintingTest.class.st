Class {
	#name : #XMLNodeCanonicalPrintingTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #private }
XMLNodeCanonicalPrintingTest >> onCanonicalLineBreakJoin: aLineCollection [
	^ XMLWriterTest onCanonicalLineBreakJoin: aLineCollection
]

{ #category : #tests }
XMLNodeCanonicalPrintingTest >> testCharacterReferences [
	| xml |

	xml := '<!DOCTYPE doc [
<!ATTLIST normId id ID #IMPLIED>
<!ATTLIST normNames attr NMTOKENS #IMPLIED>
]>
<doc>
   <text>First line&#x0d;&#10;Second line</text>
   <value>&#x32;</value>
   <compute><![CDATA[value>"0" && value<"10" ?"valid":"error"]]></compute>
   <compute expr=''value>"0" &amp;&amp; value&lt;"10" ?"valid":"error"''>valid</compute>
   <norm attr='' &apos;   &#x20;&#13;&#xa;&#9;   &apos; ''/>
   <normNames attr=''   A   &#x20;&#13;&#xa;&#9;   B   ''/>
   <normId id='' &apos;   &#x20;&#13;&#xa;&#9;   &apos; ''/>
</doc>'.

	self assert:
		((XMLDOMParser on: xml)
			isValidating: false;
			parseDocument) canonicallyPrinted =
				(self onCanonicalLineBreakJoin:
					#('<doc>'
						'   <text>First line&#xD;'
						'Second line</text>'
						'   <value>2</value>'
						'   <compute>value&gt;"0" &amp;&amp; value&lt;"10" ?"valid":"error"</compute>'
						'   <compute expr="value>&quot;0&quot; &amp;&amp; value&lt;&quot;10&quot; ?&quot;valid&quot;:&quot;error&quot;">valid</compute>'
						'   <norm attr=" ''    &#xD;&#xA;&#x9;   '' "></norm>'
						'   <normNames attr="A &#xD;&#xA;&#x9; B"></normNames>'
						'   <normId id="'' &#xD;&#xA;&#x9; ''"></normId>'
						'</doc>')).
]

{ #category : #tests }
XMLNodeCanonicalPrintingTest >> testEntityReferences [
	| xml resolver |

	xml := '<!DOCTYPE doc [
<!ATTLIST doc attrExtEnt ENTITY #IMPLIED>
<!ENTITY ent1 "Hello">
<!ENTITY ent2 SYSTEM "world.txt">
<!ENTITY entExt SYSTEM "earth.gif" NDATA gif>
<!NOTATION gif SYSTEM "viewgif.exe">
]>
<doc attrExtEnt="entExt">
   &ent1;, &ent2;!
</doc>

<!-- Let world.txt contain "world" (excluding the quotes) --> '.

	(resolver := DTDStaticExternalEntityResolver new)
		externalEntityAtURI: 'world.txt'
		put: 'world'.
	self assert:
		((XMLDOMParser on: xml)
			externalEntityResolver: resolver copy;
			resolvesExternalEntities: true;
			isValidating: false;
			parseDocument) canonicallyPrinted =
				(self onCanonicalLineBreakJoin:
					#('<doc attrExtEnt="entExt">'
						'   Hello, world!'
						'</doc>')).

	self assert:
		((XMLDOMParser on: xml)
			externalEntityResolver: resolver copy;
			resolvesExternalEntities: true;
			isValidating: false;
			preservesCommentNodes: true;
			parseDocument) canonicallyPrinted =
				(self onCanonicalLineBreakJoin:
					#('<doc attrExtEnt="entExt">'
						'   Hello, world!'
						'</doc>'
						'<!-- Let world.txt contain "world" (excluding the quotes) -->')).
]

{ #category : #tests }
XMLNodeCanonicalPrintingTest >> testPIsAndComments [
	| xml |

	xml := '<?xml version="1.0"?>

<?xml-stylesheet   href="doc.xsl"
   type="text/xsl"   ?>

<!DOCTYPE doc SYSTEM "doc.dtd">

<doc>Hello, world!<!-- Comment 1 --></doc>

<?pi-without-data     ?>

<!-- Comment 2 -->

<!-- Comment 3 -->'.

	self assert:
		(XMLDOMParser parse: xml)
			canonicallyPrinted =
				(self onCanonicalLineBreakJoin:
					#('<?xml-stylesheet href="doc.xsl"'
						'   type="text/xsl"   ?>'
						'<doc>Hello, world!</doc>'
						'<?pi-without-data?>')).

	self assert:
		((XMLDOMParser on: xml)
			preservesCommentNodes: true;
			parseDocument) canonicallyPrinted =
				(self onCanonicalLineBreakJoin:
					#('<?xml-stylesheet href="doc.xsl"'
						'   type="text/xsl"   ?>'
						'<doc>Hello, world!<!-- Comment 1 --></doc>'
						'<?pi-without-data?>'
						'<!-- Comment 2 -->'
						'<!-- Comment 3 -->')).
]

{ #category : #tests }
XMLNodeCanonicalPrintingTest >> testStartAndEndTags [
	| xml |

	xml := '<!DOCTYPE doc [<!ATTLIST e9 attr CDATA "default">]>
<doc>
   <e1   />
   <e2   ></e2>
   <e3   name = "elem3"   id="elem3"   />
   <e4   name="elem4"   id="elem4"   ></e4>
   <e5 a:attr="out" b:attr="sorted" attr2="all" attr="I''m"
      xmlns:b="http://www.ietf.org"
      xmlns:a="http://www.w3.org"
      xmlns="http://example.org"/>
   <e6 xmlns="" xmlns:a="http://www.w3.org">
      <e7 xmlns="http://www.ietf.org">
         <e8 xmlns="" xmlns:a="http://www.w3.org">
            <e9 xmlns="" xmlns:a="http://www.ietf.org"/>
         </e8>
      </e7>
   </e6>
</doc>'.

	self assert:
		((XMLDOMParser on: xml)
			isValidating: false;
			parseDocument) canonicallyPrinted =
				(self onCanonicalLineBreakJoin:
					#('<doc>'
						'   <e1></e1>'
						'   <e2></e2>'
						'   <e3 id="elem3" name="elem3"></e3>'
						'   <e4 id="elem4" name="elem4"></e4>'
						'   <e5 xmlns="http://example.org" xmlns:a="http://www.w3.org" xmlns:b="http://www.ietf.org" attr="I''m" attr2="all" b:attr="sorted" a:attr="out"></e5>'
						'   <e6 xmlns:a="http://www.w3.org">'
						'      <e7 xmlns="http://www.ietf.org">'
						'         <e8 xmlns="">'
						'            <e9 xmlns:a="http://www.ietf.org" attr="default"></e9>'
						'         </e8>'
						'      </e7>'
						'   </e6>'
						'</doc>')).
]

{ #category : #tests }
XMLNodeCanonicalPrintingTest >> testWhitespace [
	| xml |

	xml := '
<doc>
   <clean>   </clean>
   <dirty>   A   B   </dirty>
   <mixed>
      A
      <clean>   </clean>
      B
      <dirty>   A   B   </dirty>
      C
   </mixed>
</doc>
'.

	self assert:
		(XMLDOMParser parse: xml)
			canonicallyPrinted =
				(self onCanonicalLineBreakJoin:
					#('<doc>'
						'   <clean>   </clean>'
						'   <dirty>   A   B   </dirty>'
						'   <mixed>'
						'      A'
						'      <clean>   </clean>'
						'      B'
						'      <dirty>   A   B   </dirty>'
						'      C'
						'   </mixed>'
						'</doc>')).
]
