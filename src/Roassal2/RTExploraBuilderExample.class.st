"
A ROExploraBuilderExample is xxxxxxxxx.

"
Class {
	#name : #RTExploraBuilderExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Explora'
}

{ #category : #sources }
RTExploraBuilderExample >> exampleCircularList [
| builder lst |
	lst := LinkedList new.
	lst add: 1; add: 2; add: 3; add: 4.
	lst lastLink nextLink: (lst firstLink).
	
	builder := RTExploraBuilder new.
	builder layout: RTCircleLayout new;
		withPopup;
		node: lst firstLink;
		onClickExplore: [ :link | Array with: link nextLink ].
	builder build.
	^ builder 
]

{ #category : #icons }
RTExploraBuilderExample >> exampleCircularListIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABKElEQVR4XuXUQQ2AMBBFQZxX
QD1wpaoq5Rd6ICggJcxL1sBOdrcx/L7U5q/AB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/E
zwfxQfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAf
xM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/H4FkqvjSGpNek98kMW1lpTyjA+yuHkZPsiHmm/q
xth3H8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/EzwfxQfx8EB/Ezwfx
Qfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH
8fNBfBC/NzsB4oWgQHkqZ3wAAAAASUVORK5CYII='
]

{ #category : #sources }
RTExploraBuilderExample >> exampleClassHierarchy [
| builder |
	builder := RTExploraBuilder new.
	builder shape circle
		size: 20;
		color: (Color blue alpha: 0.5);
		if: [ :cls | cls subclasses isEmpty ] fillColor: (Color red alpha: 0.5);
		if: [ :cls | cls == ProtoObject ] fillColor: (Color green alpha: 0.5).
	builder
		onRightClickExplore: [ :cls | Array with: cls superclass] edges: #To;
		onLeftClickExplore: [ :cls | cls subclasses ] edges: #From;
		withPopup;
		dragChildren;
		node: String.
	builder build.
	^ builder
]

{ #category : #sources }
RTExploraBuilderExample >> exampleClassHierarchy2 [
| builder |
	builder := RTExploraBuilder new.
	builder shape circle
		size: [ :cls | cls numberOfMethods / 3 + 10];
		color: (Color blue alpha: 0.5);
		if: [ :cls | cls subclasses isEmpty ] fillColor: (Color red alpha: 0.5);
		if: [ :cls | '*Array*' match: cls name] fillColor: (Color green alpha: 0.5).
	builder
		layout: [RTClusterLayout new horizontalGap: 80];
		onClickExplore: [ :cls | cls subclasses ];
		withPopup;
		dragChildren;
		node: Collection.
	builder build.
	^ builder
]

{ #category : #icons }
RTExploraBuilderExample >> exampleClassHierarchy2Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAB4ElEQVR4XuXZP0tCYRTAYb95
gzhHIOggNjans/hntE2HIsgP4SKiHuMt7hIF1n0lX58fnC/gg17PuY3j0e+SavgfgQ/i54P4
IH4+iA/i54P4IH4+iA/i54P4+SA+iJ8P4oP4+SA+iJ8P4oP4+SB+PogP4ueD+CB+PogP4ueD
+CB+PoifD+KD+PkgPoifD+KD+PkgPoifD+Lng/ggZ+1wiFitIp6fI9brCB/kH9puIx4fI25u
vp+7u4jX1zJxigOZz3+G+Dq9Xnzkg5yph4fTMappNiP2+3JQigF5evo9RjW3tz5I1na7v2NU
Mx6XgVIEyHBYHySND5KpHBhpFovLR2mUsGfkAhmNfJDapaUvF8j9vQ9Su5eXfCDdrg9Su3QO
yQWS/hz4IBf0UJ9MfJAstdt5QErY2IsAeXurj9Hv+3tI1tKhsA7IZuODZC1dbVutv2Gkb5h/
yzrTkpjedVwrRnEgVbPZaUtgKT9TxYNULZef55D0wO50IgaDiOm0rPcfVwVyjfkgPoifD+KD
+PkgPoifD+KD+PkgPoifD+Lng/ggfj6ID+Lng/ggfj6ID+Lng/j5ID6Inw/ig/j5ID6Inw/i
g/j5IH4+iA/i54P4IH4+iA/i54P4IH4+iJ8PcuG9A1urjXPuUt/yAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTExploraBuilderExample >> exampleClassHierarchy3 [
| builder |
	builder := RTExploraBuilder new.
	builder shape rectangle
		width: [ :cls | cls numberOfVariables * 10 max: 5 ];
		height: [ :cls | cls numberOfMethods / 2 max: 5];
		color: (Color blue alpha: 0.5);
		if: [ :cls | cls subclasses notEmpty ] borderColor: (Color red alpha: 0.5).
		
	builder
		layout: [ RTClusterLayout new horizontalGap: 80 ];
		onClickExplore: [ :cls | cls subclasses ];
		withPopup;
		dragChildren;
		node: Collection.
	builder view canvas color: Color white.
	builder build.
	^ builder
]

{ #category : #icons }
RTExploraBuilderExample >> exampleClassHierarchy3Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABJElEQVR4XuXRMQGAIBRAQRpb
hxTYAJkZHYzhyPixBnIvwrs0p99KJX+BD+Lng/ggfj6ID+Lng/ggfj6ID+Lng/j5ID6Inw/i
g/j5ID6Inw/ig/j5IH4+iA/i54P4IH4+iA/i54P4IH4+iJ8P4oP4+SA+iJ8P4oP4+SA+yF8b
/Y4nt/BBFuk9ryhH9UF8EB/EB/FBfBAfxAfxQXwQH8QH8UF8EB/EB/FBfBAfxAfxQXwQH8QH
8UF8EB/EB/FBfBAfxAfxQXwQH8QH8UF8kD1BdsoH8UH8fBAfxM8H8UH8fBAfxM8H8UH8fBA/
H8QH8fNBfBA/H8QH8fNBfBA/H8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQ
Px/E7AM6t39d4/ReMAAAAABJRU5ErkJggg=='
]

{ #category : #icons }
RTExploraBuilderExample >> exampleClassHierarchyIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABKElEQVR4XuXUQQ2AMBBFQZxX
QD1wpaoq5Rd6ICggJcxL1sBOdrcx/L7U5q/AB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/E
zwfxQfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAf
xM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/H4FkqvjSGpNek98kMW1lpTyjA+yuHkZPsiHmm/q
xth3H8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/EzwfxQfx8EB/Ezwfx
Qfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH
8fNBfBC/NzsB4oWgQHkqZ3wAAAAASUVORK5CYII='
]

{ #category : #sources }
RTExploraBuilderExample >> exampleFileSystem [
	<noTest>
	| builder |
	builder := RTExploraBuilder new.
	builder shape circle size: 10;
		if: [ :x | x isFile ] fillColor: (Color yellow alpha: 0.8);
		if: [ :x | x isDirectory ] fillColor: (Color brown alpha: 0.8).
	builder
		layout: (RTTreeLayout new);
		onLeftClickExplore: [ :elem | (elem isFile) ifTrue: [ #() ] ifFalse: [elem children] ];
		onRightClickExplore: [ :elem | Array with: elem parent ];
		withPopup: [ :file | file basename ];
		dragChildren;
		node: TRPlatform current workingDirectory.
	builder build.
	^ builder
]

{ #category : #icons }
RTExploraBuilderExample >> exampleFileSystemIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABF0lEQVR4XuXRAQkAIRAAQTN9
GQWTGEmwwVX5LKcpBGE2wk7Z2++lir/AB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/Ezwfx
Qfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H
8fNBfBA/H8QH8fNBfBA/H8QH8fNB/HwQH+Ruf8yM0dIHeaQYNVf/fBA/H8QH8fNBfBA/H8TP
B/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/EzwfxQfx8EB/E
zwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBCrA0O5p25G3Cng
AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTExploraBuilderExample >> exampleNumbers [
| builder |
	builder := RTExploraBuilder new.
	builder shape circle size: 30;
		if: [:n | (n < 100)] fillColor: (Color green alpha: 0.5);
		if: [:n | (n > 100) and: (n < 500)] fillColor: (Color yellow alpha: 0.5);
		if: [:n | (n >= 500)] fillColor: (Color red alpha: 0.5);
		withText.
	builder
		layout: [RTClusterLayout new verticalGap: 40];
		withPopup;
		dragChildren;
		node: 1;
		onClickExplore: [ :aNumber | aNumber*5 to: (aNumber*5 + 5) ].
	builder build.
	^ builder
]

{ #category : #icons }
RTExploraBuilderExample >> exampleNumbersIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABUklEQVR4XuXVsQnCQBiG4Uya
7JAFBIXgEhHMHqZwkwQsXOKPf1IIamlx4vN+zdX3cFy1LH6/VOVfgQ/i54P4IH4+iA/i54P4
IH4+iA/i54P4+SA+iJ8P4oP4+SA+iJ8P4oP4+SB+PogP4ueD+CB+PogP4ueD+CB+PoifD+KD
+PkgPoifD+KD+PkgPoifD+Lng/ggfj6ID+Lng/ggfj6ID+Lng3zXHHOccsfcNeeDFGyKKXZv
O+d8kEL10W8I7a19QfFBCtVF9/FCfJCCrX/GCtCMTdSXejsfcj5IwYYYni9jn7vnfBA/H8QH
8fNBfBA/H8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/E
zwfxQfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H+ZseLViO
+siI4bsAAAAASUVORK5CYII='
]

{ #category : #basic }
RTExploraBuilderExample >> exploreCircularList [
	"
	self new exploreCircularList
	"
	| builder lst |
	
	" A circular linked list "
	lst := LinkedList new.
	lst add: 1; add: 2; add: 3; add: 4.
	lst lastLink nextLink: (lst firstLink).
	
	builder := RTExploraBuilder new.
	builder layout: RTCircleLayout new;
		withPopup;
		node: lst firstLink;
		onClickExplore: [ :link | Array with: link nextLink ].
	
	^ builder 
]

{ #category : #basic }
RTExploraBuilderExample >> exploreClassHierarchy [
	"
	self new exploreClassHierarchy
	"
	| builder |
	builder := RTExploraBuilder new.
	builder shape circle
		size: 20;
		color: (Color blue alpha: 0.5);
		if: [ :cls | cls subclasses isEmpty ] fillColor: (Color red alpha: 0.5);
		if: [ :cls | cls == ProtoObject ] fillColor: (Color green alpha: 0.5).
	builder
		onRightClickExplore: [ :cls | Array with: cls superclass] edges: #To;
		onLeftClickExplore: [ :cls | cls subclasses ] edges: #From;
		withPopup;
		dragChildren;
		node: String.
	^ builder
]

{ #category : #basic }
RTExploraBuilderExample >> exploreClassHierarchy2 [
	"
	self new exploreClassHierarchy2
	"
	| builder |
	builder := RTExploraBuilder new.
	builder shape circle
		size: [ :cls | cls numberOfMethods / 3 + 10];
		color: (Color blue alpha: 0.5);
		if: [ :cls | cls subclasses isEmpty ] fillColor: (Color red alpha: 0.5);
		if: [ :cls | '*Array*' match: cls name] fillColor: (Color green alpha: 0.5).
	builder
		layout: [RTClusterLayout new horizontalGap: 80];
		onClickExplore: [ :cls | cls subclasses ];
		withPopup;
		dragChildren;
		node: Collection.
	^ builder
]

{ #category : #basic }
RTExploraBuilderExample >> exploreClassHierarchy3 [
	"
	self new exploreClassHierarchy3
	"
	| builder |
	builder := RTExploraBuilder new.
	builder shape rectangle
		width: [ :cls | cls numberOfVariables * 10 max: 5 ];
		height: [ :cls | cls numberOfMethods / 2 max: 5];
		color: (Color blue alpha: 0.5);
		if: [ :cls | cls subclasses notEmpty ] borderColor: (Color red alpha: 0.5).
		
	builder
		layout: [ RTClusterLayout new horizontalGap: 80 ];
		onClickExplore: [ :cls | cls subclasses ];
		withPopup;
		dragChildren;
		node: Collection.
	builder view canvas color: Color white.
	^ builder
]

{ #category : #basic }
RTExploraBuilderExample >> exploreFileSystem [
	<noTest>
	"
	self new exploreFileSystem
	"
	| builder |
	builder := RTExploraBuilder new.
	builder shape circle size: 10;
		if: [ :x | x isFile ] fillColor: (Color yellow alpha: 0.8);
		if: [ :x | x isDirectory ] fillColor: (Color brown alpha: 0.8).
	builder
		layout: (RTTreeLayout new);
		onLeftClickExplore: [ :elem | (elem isFile) ifTrue: [ #() ] ifFalse: [elem children] ];
		onRightClickExplore: [ :elem | Array with: elem parent ];
		withPopup: [ :file | file basename ];
		dragChildren;
		node: TRPlatform current workingDirectory.
	^ builder
]

{ #category : #basic }
RTExploraBuilderExample >> exploreNumbers [
	"
	self new exploreNumbers
	"
	| builder |
	builder := RTExploraBuilder new.
	builder shape circle size: 30;
		if: [:n | (n < 100)] fillColor: (Color green alpha: 0.5);
		if: [:n | (n > 100) and: (n < 500)] fillColor: (Color yellow alpha: 0.5);
		if: [:n | (n >= 500)] fillColor: (Color red alpha: 0.5);
		withText.
	builder
		layout: [RTClusterLayout new verticalGap: 40];
		withPopup;
		dragChildren;
		node: 1;
		onClickExplore: [ :aNumber | aNumber*5 to: (aNumber*5 + 5) ].
	^ builder
]

{ #category : #basic }
RTExploraBuilderExample >> label [
	^ 'Explora'
]
