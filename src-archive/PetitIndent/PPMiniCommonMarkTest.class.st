Class {
	#name : #PPMiniCommonMarkTest,
	#superclass : #PPCompositeParserTest,
	#instVars : [
		'context',
		'quote',
		'string',
		'expected'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #'as yet unclassified' }
PPMiniCommonMarkTest >> assertResult: expectedResult [
	self assert: expectedResult = result.
	
"
	(TextDiffBuilder from: result to: expectedResult) buildDisplayPatch.
"
]

{ #category : #'as yet unclassified' }
PPMiniCommonMarkTest >> context [
	^ context
]

{ #category : #'as yet unclassified' }
PPMiniCommonMarkTest >> parse: input rule: rule to: expectedResult [
	self parse: input rule: rule.
	self assert: expectedResult = result.
	
"
	(TextDiffBuilder from: result to: expectedResult) buildDisplayPatch.
"
]

{ #category : #'as yet unclassified' }
PPMiniCommonMarkTest >> parserClass [
	^ PPMiniCommonMark
]

{ #category : #'as yet unclassified' }
PPMiniCommonMarkTest >> setUp [
	context := PPContext new.
	
	quote := self parserInstanceFor: #quote
]

{ #category : #'test-code' }
PPMiniCommonMarkTest >> testCode [
	self parse: '    abc' rule: #code.
	self assert: result = '<code>abc
</code>'.
	
	self parse: '    abc
     def' rule: #code.
	self assert: result = '<code>abc
 def
</code>'.

   self parse: '    this is a
     code' rule: #code.
	self assert: result = '<code>this is a
 code
</code>'.

   self parse: '     this is

    a code' rule: #code.
	self assert: result = '<code> this is

a code
</code>'.

   self parse: '     this is

    a code
' rule: #code.
	self assert: result = '<code> this is

a code
</code>'.


	

	self parse: '    chunk1

    chunk2
  
 
 
    chunk3' rule: #code.

	self assert: result = '<code>chunk1

chunk2



chunk3
</code>'.

   self parse: '    chunk1
      
      chunk2' rule: #code.
	self assert: result = '<code>chunk1
  
  chunk2
</code>'.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocument1 [
	string := 
'
Hi There

    this is a
     code
'.

	expected := '<p>Hi There</p>
<code>this is a
 code
</code>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocument2 [
	string := 
'
    indented code

paragraph

    more code
'.

	expected := '<code>indented code
</code>
<p>paragraph</p>
<code>more code
</code>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocument3 [
	string := 
'
   foo

bar

'.

	expected := '<p>foo</p>
<p>bar</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentCode01 [
	string := 
'
    
    foo
    
'.

	expected := '<code>foo
</code>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentCode02 [
	string := 
'
    foo
  bar
'.

	expected := '<code>foo
</code>
<p>bar</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentCode03 [
	string := 
'
    # foo
'.

	expected := '<code># foo
</code>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentCode04 [
	string := 
'
 >     Foo
'.

	expected := '<blockquote>
<code>Foo
</code>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentHeader1 [
	string := 
'
#5 bolt
'.

	expected := '<p>#5 bolt</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentHeader2 [
	string := 
'

# bolt
#5 bolt
'.

	expected := '<h1>bolt</h1>
<p>#5 bolt</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentHeader3 [
	string := 
'
 ### foo
  ## foo
   # foo
'.

	expected := '<h3>foo</h3>
<h2>foo</h2>
<h1>foo</h1>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList01 [
	string := 
'
- one

 two
'.

	expected := '<ul>
<li>
<p>one</p>
</li>
</ul>
<p>two</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList02 [
	string := 
'
- one

  two
'.

	expected := '<ul>
<li>
<p>one</p>
<p>two</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList03 [
	string := 
'
- one

- two
'.

	expected := '<ul>
<li>
<p>one</p>
</li>
<li>
<p>two</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList04 [
	string := 
'
 -    one

     two
'.

	expected := '<ul>
<li>
<p>one</p>
</li>
</ul>
<code> two
</code>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList05 [
	string := 
'
 -    one

      two
'.

	expected := '<ul>
<li>
<p>one</p>
<p>two</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList06 [
	string := 
'
 -    one

      two
'.

	expected := '<ul>
<li>
<p>one</p>
<p>two</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList07 [
	string := 
'
   > > 1.  one
>>
>>     two

'.

	expected := '<blockquote>
<blockquote>
<ol>
<li>
<p>one</p>
<p>two</p>
</li>
</ol>
</blockquote>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList08 [
	string := 
'
>>- one
>>
  >  > two

'.

	expected := '<blockquote>
<blockquote>
<ul>
<li>
<p>one</p>
</li>
</ul>
<p>two</p>
</blockquote>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList09 [
	string := 
'
- foo

      bar

'.

	expected := '<ul>
<li>
<p>foo</p>
<code>bar
</code>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList10 [
	string := 
'
  1.  foo

          bar
'.

	expected := '<ol>
<li>
<p>foo</p>
<code>bar
</code>
</li>
</ol>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList11 [
	string := 
'
1.     indented code

   paragraph

       more code
'.

	expected := '<ol>
<li>
<code>indented code
</code>
<p>paragraph</p>
<code>more code
</code>
</li>
</ol>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList12 [
	string := 
'
1.      indented code

   paragraph

       more code
'.

	expected := '<ol>
<li>
<code> indented code
</code>
<p>paragraph</p>
<code>more code
</code>
</li>
</ol>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList13 [
	string := 
'
-    foo

  bar
'.

	expected := '<ul>
<li>
<p>foo</p>
</li>
</ul>
<p>bar</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList14 [
	string := 
'
-    foo

     bar
'.

	expected := '<ul>
<li>
<p>foo</p>
<p>bar</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList15 [
	string := 
'
- foo


  bar
- baz
'.

	expected := '<ul>
<li>
<p>foo</p>
</li>
</ul>
<p>bar</p>
<ul>
<li>
<p>baz</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList16 [
	string := 
'
- foo
  - bar
    - baz


      bim

'.

	expected := '<ul>
<li>
<p>foo</p>
<ul>
<li>
<p>bar</p>
<ul>
<li>
<p>baz</p>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<code>  bim
</code>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList17 [
	string := 
'
- foo
- bar


- baz
- bim

'.

	expected := '<ul>
<li>
<p>foo</p>
</li>
<li>
<p>bar</p>
</li>
</ul>
<ul>
<li>
<p>baz</p>
</li>
<li>
<p>bim</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList18 [
	string := 
'
-   foo

    notcode

-   foo


    code
'.

	expected := '<ul>
<li>
<p>foo</p>
<p>notcode</p>
</li>
<li>
<p>foo</p>
</li>
</ul>
<code>code
</code>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList19 [
	string := 
'
- a
 - b
  - c
   - d
  - e
 - f
- g
'.

	expected := '<ul>
<li>
<p>a</p>
</li>
<li>
<p>b</p>
</li>
<li>
<p>c</p>
</li>
<li>
<p>d</p>
</li>
<li>
<p>e</p>
</li>
<li>
<p>f</p>
</li>
<li>
<p>g</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList20 [
	string := 
'
- a
- b

- c
'.

	expected := '<ul>
<li>
<p>a</p>
</li>
<li>
<p>b</p>
</li>
<li>
<p>c</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList21 [
	string := 
'
* a
* 

* c
'.

	expected := '<ul>
<li>
<p>a</p>
</li>
<li>
</li>
<li>
<p>c</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList22 [
	string := 
'
- a
- b

  c
- d
'.

	expected := '<ul>
<li>
<p>a</p>
</li>
<li>
<p>b</p>
<p>c</p>
</li>
<li>
<p>d</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList23 [
	string := 
'


- a
  - b

    c
- d
'.

	expected := '<ul>
<li>
<p>a</p>
<ul>
<li>
<p>b</p>
<p>c</p>
</li>
</ul>
</li>
<li>
<p>d</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList24 [
	string := '
* a
  > b
  >
* c
'.

	expected := '<ul>
<li>
<p>a</p>
<blockquote>
<p>b</p>
</blockquote>
</li>
<li>
<p>c</p>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList25 [
	string := '
- a
  - b
'.

	expected := '<ul>
<li>
<p>a</p>
<ul>
<li>
<p>b</p>
</li>
</ul>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentList26 [
	string := '
- a
  - b
  - c

- d
  - e
  - f
'.

	expected := '<ul>
<li>
<p>a</p>
<ul>
<li>
<p>b</p>
</li>
<li>
<p>c</p>
</li>
</ul>
</li>
<li>
<p>d</p>
<ul>
<li>
<p>e</p>
</li>
<li>
<p>f</p>
</li>
</ul>
</li>
</ul>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentParagraphs [
	string := 
'
aaa


bbb
'.

	expected := '<p>aaa</p>
<p>bbb</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentParagraphs2 [
	string := 
'
aaa
bbb

ccc
ddd
'.

	expected := '<p>aaa
bbb</p>
<p>ccc
ddd</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentParagraphs3 [
	string := 
'
  aaa
 bbb
'.

	expected := '<p>aaa
bbb</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentParagraphs4 [
	string := 
'
foo
> bar
'.

	expected := '<p>foo</p>
<blockquote>
<p>bar</p>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentParagraphs5 [
	string := 
'
foo

bar
'.

	expected := '<p>foo</p>
<p>bar</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentParagraphs6 [
	string := 
'
foo
# bar
'.

	expected := '<p>foo</p>
<h1>bar</h1>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote01 [
	string := 
'
># Foo
>bar
> baz
'.

	expected := '<blockquote>
<h1>Foo</h1>
<p>bar
baz</p>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote02 [
	string := 
'
   > # Foo
   > bar
 > baz
'.

	expected := '<blockquote>
<h1>Foo</h1>
<p>bar
baz</p>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote03 [
	string := 
'
    > # Foo
    > bar
    > baz
'.

	expected := '<code>> # Foo
> bar
> baz
</code>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote04 [
	string := 
'
> # Foo
> bar
baz
'.

	expected := '<blockquote>
<h1>Foo</h1>
<p>bar
baz</p>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote05 [
	string := 
'
> Foo
bar
> baz
'.

	expected := '<blockquote>
<p>Foo
bar
baz</p>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote06 [
	string := 
'
>     foo
    bar

'.

	expected := '<blockquote>
<code>foo
</code>
</blockquote>
<code>bar
</code>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote07 [
	string := 
'
>>>     foo
>>      bar
>       baz
'.

	expected := '<blockquote>
<blockquote>
<blockquote>
<code>foo
</code>
</blockquote>
<code> bar
</code>
</blockquote>
<code>  baz
</code>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote08 [
	string := 
'
> foo

> bar
'.

	expected := '<blockquote>
<p>foo</p>
</blockquote>
<blockquote>
<p>bar</p>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote09 [
	string := 
'
> foo
>
> bar
'.

	expected := '<blockquote>
<p>foo</p>
<p>bar</p>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote10 [
	string := 
'
> bar

baz
'.

	expected := '<blockquote>
<p>bar</p>
</blockquote>
<p>baz</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote11 [
	string := 
'
> bar
>
baz
'.

	expected := '<blockquote>
<p>bar</p>
</blockquote>
<p>baz</p>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote12 [
	string := 
'
> > > foo
bar
'.

	expected := '<blockquote>
<blockquote>
<blockquote>
<p>foo
bar</p>
</blockquote>
</blockquote>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote13 [
	string := 
'
>>> foo
> bar
>>baz

'.

	expected := '<blockquote>
<blockquote>
<blockquote>
<p>foo
bar
baz</p>
</blockquote>
</blockquote>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote14 [
	string := 
'
>     code

>    not code
'.

	expected := '<blockquote>
<code>code
</code>
</blockquote>
<blockquote>
<p>not code</p>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-document' }
PPMiniCommonMarkTest >> testDocumentQuote15 [
	string := 
'
> foo
>
> bar
'.

	expected := '<blockquote>
<p>foo</p>
<p>bar</p>
</blockquote>'.

	self parse: string rule: #document to: expected.
]

{ #category : #'test-paragraph' }
PPMiniCommonMarkTest >> testLazyParagraphPrefix [
	self parse: '' rule: #lazyParagraphPrefix.
	
	context := PPContext new.
	context indentStack push: quote.
	self parse: '> ' rule: #lazyParagraphPrefix.
	
	context := PPContext new.
	context indentStack push: quote.
	self fail: '>  >' rule: #lazyParagraphPrefix.
	
	context := PPContext new.
	context indentStack push: quote.
	context indentStack push: quote.
	self parse: ' >       >' rule: #lazyParagraphPrefix.


]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testList [	
	
	context := PPContext new.
	self parse: '- one' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
</li>
</ul>'.

	self assert: context indentStack isEmpty.
	
	context := PPContext new.
	self parse: '- one
- two' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
</li>
<li>
<p>two</p>
</li>
</ul>'	.
	self assert: context indentStack isEmpty.
	
	context := PPContext new.
	self parse: '- one

- two' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
</li>
<li>
<p>two</p>
</li>
</ul>'	.
	self assert: context indentStack isEmpty.
	
	context := PPContext new.
	context indentStack push: quote.
	self parse: '- one
>- two' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
</li>
<li>
<p>two</p>
</li>
</ul>'	.
	self assert: context indentStack size = 1.
	
	context := PPContext new.
	self parse: '- one
- ' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
</li>
<li>
</li>
</ul>'	.	
]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testListBullet [
	context := PPContext new.
	self parse: '- ' rule: #listBullet.
	self assert: context indentStack size = 1.
	self assert: context indentStack top literal = '  '.
	
	self assert: result = { 'ul' . '- ' }.
	
	context := PPContext new.
	self parse: '   - ' rule: #listBullet.
	
	self assert: result = { 'ul' . '   - ' }.
	self assert: context indentStack size = 1.
	self assert: context indentStack top literal = '     '.
	
	context := PPContext new.
	parser := self parserInstanceFor: #listBullet.
	self assert: parser parse: ' -  ' end: 3.
	
	self assert: result = { 'ul' . '   - ' }.
	self assert: context indentStack size = 1.
	self assert: context indentStack top literal = '    '.
]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testListContent [
	context := PPContext new.
	context indentStack push: quote.
	context indentStack push: '  ' asParser.

	self parse: 'one
>   two' rule: #listContent.
	
	self assert: result = '<p>one
two</p>'.

	context := PPContext new.
	context indentStack push: quote.
	context indentStack push: '  ' asParser.

	self parse: 'one
> two' rule: #listContent.
	
	self assert: result = '<p>one
two</p>'.

	context := PPContext new.
	context indentStack push: quote.
	context indentStack push: '  ' asParser.

	self parse: '> one
>   > two' rule: #listContent.
	
	self assert: result = '<blockquote>
<p>one
two</p>
</blockquote>'.
]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testListItem [
	self parse: '- one' rule: #listItem.
	
	self assert: result = '<li>
<p>one</p>
</li>'.
	self assert: context indentStack size = 0.

	context := PPContext new.
	context indentStack push: quote.
	self parse: '- > one
>   > two' rule: #listItem.
	self assert: result = '<li>
<blockquote>
<p>one
two</p>
</blockquote>
</li>'.

	context := PPContext new.
	context indentStack push: quote.
	self parse: '- > one
>
>       > two' rule: #listItem.
	self assertResult: '<li>
<blockquote>
<p>one</p>
</blockquote>
<code>> two
</code>
</li>'.

	context := PPContext new.
	self parse: '- ' rule: #listItem.
	
	self assert: result = '<li>
</li>'.
	self assert: context indentStack size = 0.
]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testListItemCode [
	context := PPContext new.
	self parse: '-     one' rule: #listItem.
	self assertResult: '<li>
<code>one
</code>
</li>'	.
]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testListNested01 [

	context := PPContext new.
	self parse: '- one
  - two' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
<ul>
<li>
<p>two</p>
</li>
</ul>
</li>
</ul>'.
	self assert: context indentStack isEmpty.
	
	context := PPContext new.
	self parse: '- one
  - two
    - three' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
<ul>
<li>
<p>two</p>
<ul>
<li>
<p>three</p>
</li>
</ul>
</li>
</ul>
</li>
</ul>'.
	self assert: context indentStack isEmpty.
]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testListNested02 [
	
	context := PPContext new.
	self parse: '- one
  - two
    - three' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
<ul>
<li>
<p>two</p>
<ul>
<li>
<p>three</p>
</li>
</ul>
</li>
</ul>
</li>
</ul>'.
	self assert: context indentStack isEmpty.
]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testListNested03 [

	context := PPContext new.
	self parse: '- one
  - two
    - three
  - four' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
<ul>
<li>
<p>two</p>
<ul>
<li>
<p>three</p>
</li>
</ul>
</li>
<li>
<p>four</p>
</li>
</ul>
</li>
</ul>'.
	self assert: context indentStack isEmpty.
]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testListNested04 [

	context := PPContext new.
	self parse: '- one
  - two
    - three
  - four' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
<ul>
<li>
<p>two</p>
<ul>
<li>
<p>three</p>
</li>
</ul>
</li>
<li>
<p>four</p>
</li>
</ul>
</li>
</ul>'.
	self assert: context indentStack isEmpty.
]

{ #category : #'test-lists' }
PPMiniCommonMarkTest >> testListNested05 [

	context := PPContext new.
	self parse: '- one
  - two
    - three
  - four
    
    five' rule: #list.
	self assertResult: '<ul>
<li>
<p>one</p>
<ul>
<li>
<p>two</p>
<ul>
<li>
<p>three</p>
</li>
</ul>
</li>
<li>
<p>four</p>
<p>five</p>
</li>
</ul>
</li>
</ul>'.
	self assert: context indentStack isEmpty.
]

{ #category : #'test-paragraph' }
PPMiniCommonMarkTest >> testParagraph [
	self parse: 'abc
def' rule: #paragraph.
	self assert: result = '<p>abc
def</p>'.
	
	self parse: 'abc
     def' rule: #paragraph.
	self assert: result = '<p>abc
def</p>'.

	context := PPContext new.
	context indentStack push: quote.
	self parse: ' abc
def' rule: #paragraph.
	self assertResult: '<p>abc
def</p>'.

	context := PPContext new.
	context indentStack push: quote.
	self parse: 'abc
> def' rule: #paragraph.
	self assertResult: '<p>abc
def</p>'.
]

{ #category : #'as yet unclassified' }
PPMiniCommonMarkTest >> testPrefix [
	self parse: '' rule: #prefix.
	
	context := PPContext new.
	context indentStack push: quote.
	self parse: '> ' rule: #prefix

]

{ #category : #'test-quotes' }
PPMiniCommonMarkTest >> testQuote [
	self parse: '>' rule: #quote.
	self assertResult: '>'.

	self parse: '> ' rule: #quote.
	self assertResult: '> '.
	
	self fail: ('>', String cr) rule: #quote.
]

{ #category : #'test-quotes' }
PPMiniCommonMarkTest >> testQuoteBlock [
	self parse: '> foo' rule: #quoteBlock.
	self assert: result = '<blockquote>
<p>foo</p>
</blockquote>'.

	context := PPContext new.
	self parse: '> foo
> bar' rule: #quoteBlock.
	self assert: result = '<blockquote>
<p>foo
bar</p>
</blockquote>'.

	context := PPContext new.
	self parse: '>> foo
>> bar' rule: #quoteBlock.
	self assertResult: '<blockquote>
<blockquote>
<p>foo
bar</p>
</blockquote>
</blockquote>'.

	context := PPContext new.
	self parse: '># Foo' rule: #quoteBlock.
	self assert: result = '<blockquote>
<h1>Foo</h1>
</blockquote>'.

	context := PPContext new.
	self parse: '>     foo
>
>     bar'  rule: #quoteBlock.
	self assertResult: '<blockquote>
<code>foo

bar
</code>
</blockquote>'.

	context := PPContext new.
	self parse: '>' rule: #quoteBlock.
	self assertResult: '<blockquote>
</blockquote>'.


	context := PPContext new.
	self parse: '>
>  
> ' rule: #quoteBlock.
	self assertResult: '<blockquote>
</blockquote>'.




	context := PPContext new.
	self parse: '>
> foo
>  ' rule: #quoteBlock.
	self assertResult: '<blockquote>
<p>foo</p>
</blockquote>'.

]

{ #category : #'test-quotes' }
PPMiniCommonMarkTest >> testQuoteDedent [
	parser := self parserInstanceFor: #quoteDedent.
	
	context := PPContext new.
	context indentStack push: quote.
	self assert: parser parse: '' end: 0.
	self assert: context indentStack size = 0.
	self assert: parser fail: '' end: 0.
	
	context := PPContext new.
	self assert: parser fail: ''.	
		
	context := PPContext new.
	context indentStack push: quote.
	self assert: parser fail: '>' end: 0.

	context := PPContext new.
	context indentStack push: quote.
	context indentStack push: quote.
	self assert: parser parse: ' > ' end: 0.

	context := PPContext new.
	context indentStack push: quote.
	context indentStack push: '  ' asParser.
	self assert: parser fail: ' > ' end: 0.
	
	context := PPContext new.
	context indentStack push: quote.
	context indentStack push: quote.
	context indentStack push: quote.
	self assert: parser parse: ' >   > ' end: 0.
	
		
	context := PPContext new.
	context indentStack push: quote.
	context indentStack push: quote.
	self assert: parser parse: '' end: 0.
	self assert: parser parse: '' end: 0.
	self assert: parser fail: '' end: 0.
]

{ #category : #'test-quotes' }
PPMiniCommonMarkTest >> testQuoteIndent [
	parser := self parserInstanceFor: #quoteIndent.
	
	context := PPContext new.
	self assert: parser parse: '>' end: 1.
	self assert: context indentStack size = 1.
	self assert: context indentStack top = quote.

	context := PPContext new.
	self assert: parser parse: '   > ' end: 5.	

	context := PPContext new.
	self assert: parser parse: '  >' end: 3.	

	context := PPContext new.
	self assert: parser parse: ' >' end: 2.

	context := PPContext new.
	self assert: parser fail: '    >'.
				
	context := PPContext new.
	context indentStack push: quote.
	self assert: parser parse: '>' end: 1.
	self assert: context indentStack size = 2.
	self assert: context indentStack top = quote.

	context := PPContext new.
	context indentStack push: quote.
	self assert: parser parse: '>  > ' end: 2.

	context := PPContext new.
	context indentStack push: quote.
	self assert: parser parse: ' >    > ' end: 3.
]
