Class {
	#name : #FMPublicInterfaceTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #private }
FMPublicInterfaceTest >> allClasses [

	^Smalltalk allClasses select: [ :each |
		each category beginsWith: 'Fame-' ]
]

{ #category : #private }
FMPublicInterfaceTest >> allInterfaces [

	^self allClasses collect: [ :class |
		Array 
			with: class name 
			with: class class selectors asArray sort 
			with: class selectors asArray sort ]
]

{ #category : #private }
FMPublicInterfaceTest >> prettyPrint: array [

	| stream |
	stream := String new writeStream.
	stream tab; nextPut: $#; nextPut: $(; cr. 
	array do: [ :each |
		stream tab; nextPut: $(; nextPutAll: each first; space; nextPut: $(.
		each second do: [ :sel | stream nextPutAll: sel; space ].
		stream nextPut: $); space; nextPut: $(; cr.
		each third do: [ :sel |
			stream tab; tab; nextPutAll: sel; cr ].
		stream tab; nextPut: $); nextPut: $); cr. ].
	stream tab; nextPut: $); cr.
	^stream contents.
	
]

{ #category : #accessing }
FMPublicInterfaceTest >> printString [

	^self prettyPrint: self publicInterface 
]

{ #category : #accessing }
FMPublicInterfaceTest >> publicInterface [
	^ #(
		#(#FM3 #(#boolean #number #object #string ) #() )
		#(#FM3Element #(#new ) #(#fullName #name #name: #owner ) )
		#(
			#FM3MetaDescription
			#(#new )
			#(
				#allAttributes
				#allAttributesDo:
				#at:
				#attributeNamed:
				#attributeNamed:ifAbsent:
				#attributes
				#attributes:
				#createInstance
				#hasOwner
				#hasPackage
				#hasSuperclass
				#isAbstract
				#isAbstract:
				#isPrimitive
				#isRoot
				#owner
				#ownerAttribute
				#package
				#package:
				#superclass
				#superclass:
			)
		)
		#(
			#FM3PackageDescription
			#(#new )
			#(
				#at:
				#classNamed:
				#classes
				#classes:
				#extensions
				#extensions:
				#hasOwner
			)
		)
		#(
			#FM3PropertyDescription
			#(#new )
			#(
				#getFrom:
				#hasKey
				#hasMmClass
				#hasOpposite
				#hasOwner
				#isComposite
				#isContainer
				#isContainer:
				#isDerived
				#isDerived:
				#isMultivalued
				#isMultivalued:
				#key
				#key:
				#mmClass
				#mmClass:
				#opposite
				#opposite:
				#owner
				#package
				#package:
				#setOn:values:
				#type
				#type:
			)
		)
		#(
			#FMDebugClient
			#(#new )
			#(#contents #exportString #replayOn: #reset )
		)
		#(
			#FMImporter
			#(#new )
			#(
				#fromString:
				#repository
				#repository:
				#run
				#stream
				#stream:
			)
		)
		#(#FMInferencer #(#new ) #(#client #client: #run ) )
		#(
			#FMLicense
			#()
			#(#authors #copyrightNotice #copyrightNoticeFull )
		)
		#(
			#FMMSEParser
			#(#new )
			#(
				#client
				#client:
				#run
				#fromString:
				#stream:
				#stream
			)
		)
		#(#FMMSEPrinter #(#new ) #() )
		#(
			#FMMetaRepository
			#(#fm3 #with: )
			#(
				#add:
				#addSmalltalkClasses:
				#addSmalltalkNamespace:
				#at:
				#classes
				#descriptionOf:
				#descriptionOf:ifAbsent:
				#elementNamed:
				#isMetaMetamodel
				#isMetamodel
				#packages
				#properties
			)
		)
		#(
			#FMModelBuilder
			#(#new )
			#(
				#a:of:
				#add:with:
				#an:of:
				#client
				#client:
				#document:
				#id:
				#new:with:
				#ref:
			)
		)
		#(
			#FMParserClient
			#(#new )
			#(
				#beginAttribute:
				#beginDocument
				#beginElement:
				#endAttribute:
				#endDocument
				#endElement:
				#primitive:
				#referenceName:
				#referenceNumber:
				#serial:
			)
		)
		#(
			#FMPragmaProcessor
			#(#new )
			#(#asMetamodel #asTower #buildFM3 #queue: #run )
		)
		#(
			#FMPrintClient
			#(#new )
			#(#onString #onString: #stream #stream: )
		)
		#(
			#FMRepository
			#(#with: )
			#(
				#accept:
				#add:
				#addAll:
				#asMetarepository
				#compositeDelete:
				#containerOf:
				#elements
				#exportOn:
				#exportString
				#get:element:
				#importStream:
				#importString:
				#isEmpty
				#isMetaMetamodel
				#isMetamodel
				#metaDescriptionOf:
				#metamodel
				#selectKindOf:
				#set:element:values:
				#size
			)
		)
		#(
			#FMRuntimeElement
			#(#with: )
			#(#at: #at:put: #description #description: )
		)
		#(
			#FMTower
			#(#new )
			#(
				#fameDescriptionByClass:
				#fameDescriptionFor:
				#metaMetamodel
				#metamodel
				#model
			)
		)
		#(#FMXMLPrinter #(#new ) #() )
		#(
			#FMMultivalueLink
			#(#on:opposite: #on:update:from:to: )
			#()
		)
		#(
			#FMMultiMultivalueLink
			#(#on:opposite: #on:update:from:to: )
			#()
		)
	)
]

{ #category : #running }
FMPublicInterfaceTest >> testPublicInterface [
	self publicInterface do:
			[ :array | 
			| class constructors methods |
			class := self class environment at: array first ifAbsent: nil.
			constructors := array second.
			methods := array third.
			class notNil should beTrue.
			class category should beginWith: 'Fame'.
			constructors do:
					[ :sel | self assert: (class class allSelectors includes: sel) description: class name asString , ' class >> #' , sel ].
			methods do: [ :sel | self assert: (class allSelectors includes: sel) description: class name asString , ' >> #' , sel ] ]
]

{ #category : #running }
FMPublicInterfaceTest >> testPublicInterfacePrintString [

	self shouldnt: [ self printString ] raise: Error	
]
