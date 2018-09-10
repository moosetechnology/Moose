"
Define a set of colors.

Examples showing all the palletes:
-=-=-=
| v allLines lbl es lb| 
v := RTView new.
allLines := OrderedCollection new.

(RTPalette class selectors sorted) do: [ :selector |
	lbl := RTLabel elementOn: selector.
	
	v add: lbl.
	
	es := (RTBox new size: 20) elementsOn: (1 to: 5).
	v addAll: es.
	es @ (RTMouseHoverZoom new desiredExtent: [ :anElement | anElement extent * 1.7 ]).
	TRConstraint stick: lbl onTheLeftOf: es first.
	
	RTHorizontalLineLayout new gapSize: 3; on: es.
	RTMetricNormalizer new
		elements: es;
		normalizeColor: #yourself using: (RTPalette perform: selector).
	allLines add: es.
].
RTVerticalLineLayout on: allLines.

lb := RTLegendBuilder new.
lb view: v.
lb onDemand.
lb addText: 'Many color palettes are offered by Roassal'.
lb addText: 'To obtain the a palette, simply evaluate: RTPalette c5'.
lb build.
v
-=-=-=

Using a palette:
-=-=-=
p := RTPalette c10.
b := RTMondrian new.
b shape box
	color: p fifth;
	if: [ :c | '*Line*' match: c name ] color: p first;
	if: [ :c | '*Arrow*' match: c name ] color: p second;
	if: [ :c | '*Arc*' match: c name ] color: p third;
	if: [ :c | '*Abstract*' match: c name ] color: p fourth.
b nodes: (RTShape withAllSubclasses).
b layout flow.
b normalizer normalizeSize: #numberOfMethods.
b
-=-=-=

"
Class {
	#name : #RTPalette,
	#superclass : #RTObject,
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #palettes }
RTPalette class >> c1 [
	^ Array 
		with: (Color r: 225 g: 206 b: 122 range: 255) 
		with: (Color r: 251 g: 255 b: 185 range: 255)
		with: (Color r: 253 g: 214 b: 146 range: 255)
		with: (Color r: 236 g: 115 b: 87 range: 255)
		with: (Color r: 117 g: 79 b: 68 range: 255)
]

{ #category : #palettes }
RTPalette class >> c10 [
	^ Array
		with: (Color r: 51 g: 92 b: 103 range: 255)
		with: (Color r: 255 g: 243 b: 176 range: 255)
		with: (Color r: 224 g: 159 b: 62 range: 255)
		with: (Color r: 158 g: 42 b: 43 range: 255)
		with: (Color r: 84 g: 11 b: 14 range: 255)
]

{ #category : #palettes }
RTPalette class >> c11 [
	^ Array
		with: (Color r: 30 g: 21 b: 42 range: 255)
		with: (Color r: 78 g: 103 b: 102 range: 255)
		with: (Color r: 90 g: 177 b: 187 range: 255)
		with: (Color r: 165 g: 200 b: 130 range: 255)
		with: (Color r: 247 g: 221 b: 114 range: 255)
]

{ #category : #palettes }
RTPalette class >> c12 [
	^ Array
		with: (Color r: 204 g: 88 b: 3 range: 255)
		with: (Color r: 226 g: 113 b: 29 range: 255)
		with: (Color r: 255 g: 149 b: 5 range: 255)
		with: (Color r: 255 g: 182 b: 39 range: 255)
		with: (Color r: 255 g: 201 b: 113 range: 255)
]

{ #category : #palettes }
RTPalette class >> c13 [
	^ Array
		with: (Color r: 123 g: 223 b: 242 range: 255)
		with: (Color r: 178 g: 247 b: 239 range: 255)
		with: (Color r: 239 g: 247 b: 246 range: 255)
		with: (Color r: 247 g: 214 b: 224 range: 255)
		with: (Color r: 242 g: 181 b: 212 range: 255)
]

{ #category : #palettes }
RTPalette class >> c14 [
	^ Array
		with: (Color r: 254 g: 147 b: 140 range: 255)
		with: (Color r: 237 g: 175 b: 151 range: 255)
		with: (Color r: 196 g: 151 b: 146 range: 255)
		with: (Color r: 173 g: 145 b: 163 range: 255)
		with: (Color r: 157 g: 145 b: 163 range: 255)
]

{ #category : #palettes }
RTPalette class >> c2 [
	^ Array
		with: (Color r: 58 g: 96 b: 110 range: 255)
		with: (Color r: 96 g: 123 b: 125 range: 255)
		with: (Color r: 130 g: 142 b: 130 range: 255)
		with: (Color r: 170 g: 174 b: 142 range: 255)
		with: (Color r: 224 g: 224 b: 224 range: 255)
]

{ #category : #palettes }
RTPalette class >> c3 [
	^ Array
		with: (Color r: 239 g: 217 b: 206 range: 255)
		with: (Color r: 222 g: 192 b: 241 range: 255)
		with: (Color r: 183 g: 156 b: 237 range: 255)
		with: (Color r: 149 g: 127 b: 239 range: 255)
		with: (Color r: 113 g: 97 b: 239 range: 255)
]

{ #category : #palettes }
RTPalette class >> c4 [
	^ Array
		with: (Color r: 36 g: 123 b: 160 range: 255)
		with: (Color r: 112 g: 193 b: 179 range: 255)
		with: (Color r: 178 g: 219 b: 191 range: 255)
		with: (Color r: 243 g: 255 b: 189 range: 255)
		with: (Color r: 255 g: 22 b: 84 range: 255)
]

{ #category : #palettes }
RTPalette class >> c5 [
	^ Array
		with: (Color r: 220 g: 220 b: 221 range: 255)
		with: (Color r: 197 g: 195 b: 198 range: 255)
		with: (Color r: 70 g: 73 b: 76 range: 255)
		with: (Color r: 76 g: 92 b: 104 range: 255)
		with: (Color r: 25 g: 133 b: 161 range: 255)
]

{ #category : #palettes }
RTPalette class >> c6 [
	^ Array
		with: (Color r: 216 g: 226 b: 220 range: 255)
		with: (Color r: 255 g: 229 b: 217 range: 255)
		with: (Color r: 255 g: 202 b: 212 range: 255)
		with: (Color r: 244 g: 172 b: 183 range: 255)
		with: (Color r: 157 g: 129 b: 137 range: 255)
]

{ #category : #palettes }
RTPalette class >> c7 [
	^ Array
		with: (Color r: 224 g: 251 b: 252 range: 255)
		with: (Color r: 194 g: 223 b: 227 range: 255)
		with: (Color r: 157 g: 180 b: 192 range: 255)
		with: (Color r: 92 g: 107 b: 115 range: 255)
		with: (Color r: 37 g: 50 b: 55 range: 255)
]

{ #category : #palettes }
RTPalette class >> c8 [
	^ Array
		with: (Color r: 151 g: 249 b: 249 range: 255)
		with: (Color r: 164 g: 222 b: 249 range: 255)
		with: (Color r: 193 g: 224 b: 247 range: 255)
		with: (Color r: 207 g: 186 b: 225 range: 255)
		with: (Color r: 197 g: 159 b: 201 range: 255)
]

{ #category : #palettes }
RTPalette class >> c9 [
	^ Array
		with: (Color r: 237 g: 238 b: 201 range: 255)
		with: (Color r: 221 g: 231 b: 199 range: 255)
		with: (Color r: 191 g: 216 b: 189 range: 255)
		with: (Color r: 152 g: 201 b: 163 range: 255)
		with: (Color r: 119 g: 191 b: 163 range: 255)
]
