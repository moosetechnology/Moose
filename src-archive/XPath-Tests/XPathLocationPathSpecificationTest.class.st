"
This class has tests for abbreviated and unabbreviated location path expressions taken directly from the XPath 1.0 specification.
"
Class {
	#name : #XPathLocationPathSpecificationTest,
	#superclass : #XPathTest,
	#instVars : [
		'specificationDocument'
	],
	#category : #'XPath-Tests'
}

{ #category : #running }
XPathLocationPathSpecificationTest >> setUp [
	super setUp.

	specificationDocument := self specificationXML parseXML.
]

{ #category : #'source XML' }
XPathLocationPathSpecificationTest >> specificationXML [
	"adapted from the DocBook article example in #docBookArticleSource and
	expanded so every XPath expression tested will have a non-empty result
	for at least one context node in the DOM-parsed document"
	^ '
	<doc lang="en">
		<chapter name="Chapter 1">
			<title>Introduction</title>
			<section>
				<para>Pharo''s goal is to deliver a clean, innovative, free open-source environment. Here is the to be revised Pharo vision document.</para>
				<para>By providing a stable and small core system, excellent developing tools, and maintained releases, Pharo is an attractive platform to build and deploy mission critical applications.</para>
				<para>Pharo fosters a healthy ecosystem of both private and commercial contributors who advance and maintain the core system and its external packages.</para>
			</section>
		</chapter>
		<chapter name="Chapter 2">
			<title>Pharo Features</title>
			<section>
				<para>Pharo has the following features:</para>
				<div>
					<olist>
						<item>A dynamic, pure object-oriented programming language in the tradition of Smalltalk</item>
						<item>An IDE (integrated development environment)</item>
						<item>A huge library and set of external packages</item>
					</olist>
				</div>
			</section>
			<section>
				<para>The goal of Pharo is to sustain and grow business.</para>
				<para type="warning">Pharo is supported by the industrial Pharo consortium.</para>
				<para type="warning">Pharo has also an association of users: Pharo association.</para>
				<para type="warning">Pharo is a work in progress.</para>
				<para type="warning">Pharo is continually evolving.</para>
				<para type="warning">Pharo is not always backwards compatible.</para>
		   </section>
		</chapter>
		<chapter name="Chapter 3" status="unfinished">
			<section>
				<figure>1</figure><figure>2</figure><figure>3</figure><figure>4</figure><figure>5</figure>
				<figure>6</figure><figure>7</figure><figure>8</figure><figure>9</figure><figure>10</figure>
				<figure>11</figure><figure>12</figure><figure>13</figure><figure>14</figure><figure>15</figure>
				<figure>16</figure><figure>17</figure><figure>18</figure><figure>19</figure><figure>20</figure>
				<figure>21</figure><figure>22</figure><figure>23</figure><figure>24</figure><figure>25</figure>
				<figure>26</figure><figure>27</figure><figure>28</figure><figure>29</figure><figure>30</figure>
				<figure>31</figure><figure>32</figure><figure>33</figure><figure>34</figure><figure>35</figure>
				<figure>36</figure><figure>37</figure><figure>38</figure><figure>39</figure><figure>40</figure>
				<figure>41</figure><figure>42</figure><figure>43</figure><figure>44</figure><figure>45</figure>
			</section>
		</chapter>
		<chapter name="Chapter 4" status="unfinished">
			<section><para>Unfinished.</para></section>
		</chapter>
		<chapter name="Chapter 5" status="unfinished">
			<section><para>Unfinished.</para></section>
			<section><para>Unfinished.</para></section>
		</chapter>
		<appendix name="Appendix 1">
			<title>Version History</title>
			<section>
				<div>
					<olist>
						<item>Pharo 1.0 was released April 15, 2010.</item>
						<item>Pharo 1.1 was released July 26, 2010.</item>
						<item>Pharo 1.2 was released March 29, 2011.</item>
						<item>Pharo 1.3 was released in August 2011.</item>
						<item>Pharo 1.4 was released in April 2012.</item>
						<item>Pharo 2.0 was released March 18, 2013.</item>
						<item>Pharo 3.0 was released in April 2014.</item>
						<item>Pharo 4.0 was released in April 2015.</item>
						<item>Pharo 5.0 was released in May 2016</item>
					</olist>
				</div>
			</section>
		</appendix>
	</doc>'
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedAttributeAxis [
	specificationDocument allNodesDo: [:node |
		"selects the name attribute of the context node"
		self
			assertNodeSet: (node xpath: '@name')
			hasNodes:
				(node isElement
					ifTrue: [node attributeNodes select: [:each | each isNamed: 'name']]
					ifFalse: [#()]).

		"selects all the attributes of the context node"
		self
			assertNodeSet: (node xpath: '@*')
			hasNodes:
				(node isElement
					ifTrue: [node attributeNodes]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedChildAxis [
	specificationDocument allNodesDo: [:node |
		"selects the para element children of the context node"
		self
			assertNodeSet: (node xpath: 'para')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node elementsAt: 'para']
					ifFalse: [#()]).

		"selects all element children of the context node"
		self
			assertNodeSet: (node xpath: '*')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node elements]
					ifFalse: [#()]).

		"selects all text node children of the context node"
		self
			assertNodeSet: (node xpath: 'text()')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node stringNodes]
					ifFalse: [#()]).

		"selects all the children of the context node, whatever their node type"
		self
			assertNodeSet: (node xpath: 'node()')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node nodes]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedChildAxisAttributePredicate [
	specificationDocument allNodesDo: [:node |
		"selects all para children of the context node that have a type
		attribute with value warning"
		self
			assertNodeSet: (node xpath: 'para[@type="warning"]')
			hasNodes:
				(node canHaveChildren
					ifTrue: [
						(node elementsAt: 'para') select: [:each |
							each hasAttributes
								and: [(each attributeAt: 'type') = 'warning']]]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedChildAxisAttributePredicatePositionPredicate [
	specificationDocument allNodesDo: [:node |
		"selects the fifth para child of the context node that has a type
		attribute with value warning"
		self
			assertNodeSet: (node xpath: 'para[@type=''warning''][5]')
			hasNodes:
				(node canHaveChildren
					ifTrue: [
						(((node elementsAt: 'para') select: [:each |
							each hasAttributes
								and: [(each attributeAt: 'type') = 'warning']])
							at: 5)
								ifNil: [#()]
								ifNotNil: [:para | Array with: para]]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedChildAxisChildAxis [
	specificationDocument allNodesDo: [:node |
		"selects all para grandchildren of the context node"
		self
			assertNodeSet: (node xpath: '*/para')
			hasNodes:
				(node canHaveChildren
					ifTrue: [| paras |
						paras := OrderedCollection new.
						node elementsDo: [:each |
							paras addAll:
								(each elementsAt: 'para')].
						paras]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedChildAxisChildPredicate [
	specificationDocument allNodesDo: [:node |
		"selects the chapter children of the context node that have one or more
		title children with string-value equal to Introduction"
		self
			assertNodeSet:
				(node xpath: 'child::chapter[child::title=''Introduction'']')
			hasNodes:
				(node canHaveChildren
					ifTrue: [
						(node elementsAt: 'chapter') select: [:chapter |
							(chapter elementsAt: 'title') anySatisfy: [:each |
								each stringValue = 'Introduction']]]
					ifFalse: [#()]).

		"selects the chapter children of the context node that have one or more title children"
		self
			assertNodeSet:
				(node xpath: 'child::chapter[child::title]')
			hasNodes:
				(node canHaveChildren
					ifTrue: [
						node elementsSelect: [:chapter |
							(chapter isNamed: 'chapter')
								and: [(chapter elementAt: 'title') notNil]]]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedChildAxisDescendantAxis [
	specificationDocument allNodesDo: [:node |
		"selects the para element descendants of the chapter element children
		of the context node"
		self
			assertNodeSet: (node xpath: 'chapter//para')
			hasNodes:
				(node canHaveChildren
					ifTrue: [| paras |
						paras := OrderedCollection new.
						node
							elementsAt: 'chapter'
							do: [:each |
								paras addAll:
									(each descendantElementsNamed: 'para')].
						paras]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedChildAxisPositionPredicate [
	specificationDocument allNodesDo: [:node | | paras |
		paras :=
			node canHaveChildren
				ifTrue: [node elementsAt: 'para']
				ifFalse: [#()].

		"selects the first para child of the context node"
		self
			assertNodeSet: (node xpath: 'para[1]')
			hasNodes:
				(paras size > 0
					ifTrue: [Array with: paras first]
					ifFalse: [#()]).

		"selects the last para child of the context node"
		self
			assertNodeSet: (node xpath: 'para[last()]')
			hasNodes:
				(paras size > 0
					ifTrue: [Array with: paras last]
					ifFalse: [#()]).

		"selects the last but one para child of the context node"
		self
			assertNodeSet: (node xpath: 'para[last()-1]')
			hasNodes:
				(paras size > 1
					ifTrue: [Array with: (paras at: paras size - 1)]
					ifFalse: [#()]).

		"selects all the para children of the context node other than
		the first para child of the context node"
		self
			assertNodeSet: (node xpath: 'para[position()>1]')
			hasNodes:
				(paras size > 1
					ifTrue: [paras allButFirst]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedChildAxisPositionPredicateAttributePredicate [
	specificationDocument allNodesDo: [:node | | paras |
		paras :=
			node canHaveChildren
				ifTrue: [node elementsAt: 'para']
				ifFalse: [#()].

		"selects the fifth para child of the context node if that child
		has a type attribute with value warning"
		self
			assertNodeSet: (node xpath: 'para[5][@type="warning"]')
			hasNodes:
				((paras size >= 5
					and: [(paras at: 5) hasAttributes
						and: [((paras at: 5) attributeAt: 'type') = 'warning']])
					ifTrue: [paras copyFrom: 5 to: 5]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedDescendantAxis [
	specificationDocument allNodesDo: [:node |
		"selects the para element descendants of the context node"
		self
			assertNodeSet: (node xpath: './/para')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node descendantElementsNamed: 'para']
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedParentAxis [
	specificationDocument allNodesDo: [:node |
		"selects the parent of the context node"
		self
			assertNodeSet: (node xpath: '..')
			hasNodes:
				(node hasParent
					ifTrue: [Array with: node parent]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedParentAxisAttribute [
	specificationDocument allNodesDo: [:node |
		"selects the lang attribute of the parent of the context node"
		self
			assertNodeSet: (node xpath: '../@lang')
			hasNodes:
				((node hasParent
					and: [node parent isElement
						and: [node parent hasAttributes]])
					ifTrue: [
						(node parent attributeNodes select: [:each |
							each isNamed: 'lang'])]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedRootChildAxisChildAxisChildAxisPositionPredicate [
	specificationDocument allNodesDo: [:node | | sections |
		sections := OrderedCollection new.
		((specificationDocument root elementsAt: 'chapter')
			at: 5)
			ifNotNil: [:chapter |
				((chapter elementsAt: 'section')
					at: 2)
					ifNotNil: [:section |
						sections addLast: section]].

		"selects the second section of the fifth chapter of the doc
		document element"
		self
			assertNodeSet: (node xpath: '/doc/chapter[5]/section[2]')
			hasNodes: sections]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedRootDescendantAxis [
	specificationDocument allNodesDo: [:node |
		"para selects all the para descendants of the document root and thus
		selects all para elements in the same document as the context node"
		self
			assertNodeSet: (node xpath: '//para')
			hasNodes: (specificationDocument descendantElementsNamed: 'para')]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedRootDescendantAxisChildAxis [
	specificationDocument allNodesDo: [:node |
		"selects all the item elements in the same document as the
		context node that have an olist parent"
		self
			assertNodeSet: (node xpath: '//olist/item')
			hasNodes:
				((specificationDocument descendantElementsNamed: 'item')
					select: [:each |
						each hasParent
							and: [each parent isElementNamed: 'olist']])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedRootDescendantAxisPositionPredicate [
	specificationDocument allNodesDo: [:node |
		"selects the forty-second figure element in the document"
		self
			assertNodeSet: (node xpath: '//figure[42]')
			hasNodes:
				(((specificationDocument descendantElementsNamed: 'figure')
					at: 42)
						ifNil: [#()]
						ifNotNil: [:figure | Array with: figure])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testAbbreviatedSelfAxis [
	specificationDocument allNodesDo: [:node |
		"selects the context node"
		self
			assertNodeSet: (node xpath: '.')
			hasNode: node]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedAncestorAxis [
	specificationDocument allNodesDo: [:node |
		"selects all div ancestors of the context node"
		self
			assertNodeSet: (node xpath: 'ancestor::div')
			hasNodes:
				(node ancestorElements select: [:each |
					each isNamed: 'div'])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedAncestorOrSelfAxis [
	specificationDocument allNodesDo: [:node |
		"selects the div ancestors of the context node and, if the context node is
		a div element, the context node as well"
		self
			assertNodeSet: (node xpath: 'ancestor-or-self::div ')
			hasNodes:
				((node ancestorNodes copyWith: node) select: [:each |
					each isElementNamed: 'div'])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedAttributeAxis [
	specificationDocument allNodesDo: [:node |
		"selects the name attribute of the context node"
		self
			assertNodeSet: (node xpath: 'attribute::name')
			hasNodes:
				((node isElement
					and: [node hasAttributes])
					ifTrue: [
						node attributeNodes select: [:each |
							each isNamed: 'name']]
					ifFalse: [#()]).

		"selects all the attributes of the context node"
		self
			assertNodeSet: (node xpath: 'attribute::*')
			hasNodes:
				(node isElement
					ifTrue: [node attributeNodes]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedChildAxis [
	specificationDocument allNodesDo: [:node |
		"selects the para element children of the context node"
		self
			assertNodeSet: (node xpath: 'child::para')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node elementsAt: 'para']
					ifFalse: [#()]).

		"selects all element children of the context node"
		self
			assertNodeSet: (node xpath: 'child::*')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node elements]
					ifFalse: [#()]).

		"selects all text node children of the context node"
		self
			assertNodeSet: (node xpath: 'child::text()')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node stringNodes]
					ifFalse: [#()]).

		"selects all the children of the context node, whatever their node type"
		self
			assertNodeSet: (node xpath: 'child::node()')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node nodes]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedChildAxisAttributePredicate [
	specificationDocument allNodesDo: [:node |
		"selects all para children of the context node that have a type
		attribute with value warning"
		self
			assertNodeSet: (node xpath: 'child::para[attribute::type="warning"]')
			hasNodes:
				(node canHaveChildren
					ifTrue: [
						(node elementsAt: 'para') select: [:each |
							each hasAttributes
								and: [(each attributeAt: 'type') = 'warning']]]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedChildAxisAttributePredicatePositionPredicate [
	specificationDocument allNodesDo: [:node |
		"selects the fifth para child of the context node that has a type
		attribute with value warning"
		self
			assertNodeSet:
				(node xpath: 'child::para[attribute::type=''warning''][position()=5]')
			hasNodes:
				(node canHaveChildren
					ifTrue: [
						(((node elementsAt: 'para') select: [:each |
							each hasAttributes
								and: [(each attributeAt: 'type') = 'warning']])
							at: 5)
								ifNil: [#()]
								ifNotNil: [:para | Array with: para]]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedChildAxisChildAxis [
	specificationDocument allNodesDo: [:node |
		"selects all para grandchildren of the context node"
		self
			assertNodeSet: (node xpath: 'child::*/child::para')
			hasNodes:
				(node canHaveChildren
					ifTrue: [| paras |
						paras := OrderedCollection new.
						node elementsDo: [:element |
							paras addAll:
								(element elementsAt: 'para')].
						paras]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedChildAxisChildPredicate [
	specificationDocument allNodesDo: [:node |
		"selects the chapter children of the context node that have one or more
		title children with string-value equal to Introduction"
		self
			assertNodeSet:
				(node xpath: 'child::chapter[child::title=''Introduction'']')
			hasNodes:
				(node canHaveChildren
					ifTrue: [
						node elementsSelect: [:chapter |
							chapter name = 'chapter'
								and: [
									(chapter elementsAt: 'title') anySatisfy: [:each |
										each stringValue = 'Introduction']]]]
					ifFalse: [#()]).

		"selects the chapter children of the context node that have one or more title children"
		self
			assertNodeSet:
				(node xpath: 'child::chapter[child::title]')
			hasNodes:
				(node canHaveChildren
					ifTrue: [
						node elementsSelect: [:chapter |
							(chapter isNamed: 'chapter')
								and: [(chapter elementAt: 'title') notNil]]]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedChildAxisDescendantAxis [
	specificationDocument allNodesDo: [:node |
		"selects the para element descendants of the chapter element children
		of the context node"
		self
			assertNodeSet: (node xpath: 'child::chapter/descendant::para')
			hasNodes:
				(node canHaveChildren
					ifTrue: [| paras |
						paras := OrderedCollection new.
						node
							elementsAt: 'chapter'
							do: [:each |
								paras addAll:
									(each descendantElementsNamed:  'para')].
						paras]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedChildAxisPositionPredicate [
	specificationDocument allNodesDo: [:node | | paras |
		paras :=
			node canHaveChildren
				ifTrue: [node elementsAt: 'para']
				ifFalse: [#()].

		"selects the first para child of the context node"
		self
			assertNodeSet: (node xpath: 'child::para[position()=1]')
			hasNodes:
				(paras size > 0
					ifTrue: [Array with: paras first]
					ifFalse: [#()]).

		"selects the last para child of the context node"
		self
			assertNodeSet: (node xpath: 'child::para[position()=last()]')
			hasNodes:
				(paras size > 0
					ifTrue: [Array with: paras last]
					ifFalse: [#()]).

		"selects the last but one para child of the context node"
		self
			assertNodeSet: (node xpath: 'child::para[position()=last()-1]')
			hasNodes:
				(paras size > 1
					ifTrue: [Array with: (paras at: paras size - 1)]
					ifFalse: [#()]).

		"selects all the para children of the context node other than
		the first para child of the context node"
		self
			assertNodeSet: (node xpath: 'child::para[position()>1]')
			hasNodes:
				(paras size > 1
					ifTrue: [paras allButFirst]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedChildAxisPositionPredicateAttributePredicate [
	specificationDocument allNodesDo: [:node | | paras |
		paras :=
			node canHaveChildren
				ifTrue: [node elementsAt: 'para']
				ifFalse: [#()].

		"selects the fifth para child of the context node if that child
		has a type attribute with value warning"
		self
			assertNodeSet:
				(node xpath: 'child::para[position()=5][attribute::type="warning"]')
			hasNodes:
				((paras size >= 5
					and: [(paras at: 5) hasAttributes
						and: [((paras at: 5) attributeAt: 'type') = 'warning']])
					ifTrue: [paras copyFrom: 5 to: 5]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedChildAxisSelfPredicate [
	specificationDocument allNodesDo: [:node | | elements |
		elements :=
			node canHaveChildren
				ifTrue: [
					node elementsSelect: [:each |
						each isNamedAny: #('chapter' 'appendix')]]
				ifFalse: [#()].

		"selects the chapter and appendix children of the context node"
		self
			assertNodeSet:
				(node xpath: 'child::*[self::chapter or self::appendix]')
			hasNodes: elements.

		"selects the last chapter or appendix child of the context node"
		self
			assertNodeSet:
				(node xpath:
					'child::*[self::chapter or self::appendix][position()=last()]')
			hasNodes:
				(elements size > 0
					ifTrue: [Array with: elements last]
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedDescendantAxis [
	specificationDocument allNodesDo: [:node |
		"selects the para element descendants of the context node"
		self
			assertNodeSet: (node xpath: 'descendant::para')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node descendantElementsNamed: 'para']
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedDescendantOrSelfAxis [
	specificationDocument allNodesDo: [:node |
		"selects the para element descendants of the context node and, if
		the context node is a para element, the context node as well"
		self
			assertNodeSet: (node xpath: 'descendant-or-self::para')
			hasNodes:
				(node canHaveChildren
					ifTrue: [node allElementsNamed: 'para']
					ifFalse: [#()])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedFollowingSiblingAxisPositionPredicate [
	specificationDocument allNodesDo: [:node | | chapters |
		chapters := OrderedCollection new.
		node followingSiblingNodesDo: [:each |
			((each isElementNamed: 'chapter')
				and: [chapters isEmpty])
				ifTrue: [chapters addLast: each]].

		"selects the next chapter sibling of the context node"
		self
			assertNodeSet: (node xpath: 'following-sibling::chapter[position()=1]')
			hasNodes: chapters]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedPrecedingSiblingAxisPositionPredicate [
	specificationDocument allNodesDo: [:node | | chapters |
		chapters := OrderedCollection new.
		node precedingSiblingNodesDo: [:each |
			((each isElementNamed: 'chapter')
				and: [chapters isEmpty])
				ifTrue: [chapters addLast: each]].

		"selects the next chapter sibling of the context node"
		self
			assertNodeSet: (node xpath: 'preceding-sibling::chapter[position()=1]')
			hasNodes: chapters]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedRootAxis [
	specificationDocument allNodesDo: [:node |
		"selects the document root (which is always the parent of the document element)"
		self
			assertNodeSet: (node xpath: '/')
			hasNodes: (Array with: specificationDocument)]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedRootChildAxisChildAxisChildAxisPositionPredicate [
	specificationDocument allNodesDo: [:node | | sections |
		sections := OrderedCollection new.
		((specificationDocument root elementsAt: 'chapter')
			at: 5)
			ifNotNil: [:chapter |
				((chapter elementsAt: 'section')
					at: 2)
					ifNotNil: [:section |
						sections addLast: section]].

		"selects the second section of the fifth chapter of the doc
		document element"
		self
			assertNodeSet:
				(node xpath:
					'/child::doc/child::chapter[position()=5]/child::section[position()=2]')
			hasNodes: sections]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedRootDescendantAxis [
	specificationDocument allNodesDo: [:node |
		"selects all the para elements in the same document as the context node"
		self
			assertNodeSet: (node xpath: '/descendant::para')
			hasNodes: (specificationDocument descendantElementsNamed: 'para')]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedRootDescendantAxisChildAxis [
	specificationDocument allNodesDo: [:node |
		"selects all the item elements that have an olist parent and that
		are in the same document as the context node"
		self
			assertNodeSet: (node xpath: '/descendant::olist/child::item')
			hasNodes:
				((specificationDocument descendantElementsNamed: 'item')
					select: [:each |
						each hasParent
							and: [each parent isElementNamed: 'olist']])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedRootDescendantAxisPositionPredicate [
	specificationDocument allNodesDo: [:node |
		"selects the forty-second figure element in the document"
		self
			assertNodeSet: (node xpath: '/descendant::figure[position()=42]')
			hasNodes:
				(((specificationDocument descendantElementsNamed: 'figure')
					at: 42)
						ifNil: [#()]
						ifNotNil: [:figure | Array with: figure])]
]

{ #category : #tests }
XPathLocationPathSpecificationTest >> testUnabbreviatedSelfAxis [
	specificationDocument allNodesDo: [:node | | result |
		"selects the context node if it is a para element, and otherwise
		selects nothing"
		result := node xpath: 'self::para'.
		(node isElementNamed: 'para')
			ifTrue: [
				self
					assertNodeSet: result
					hasNode: node]
			ifFalse: [self assert: result isEmpty]]
]
