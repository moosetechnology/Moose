"
RTAnimationExample new installTitle: 'Smooth' 
		code:
'

'
	
"
Class {
	#name : #RTAnimationExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #sources }
RTAnimationExample >> dustEffect: e and: v [
	| e2 anim |
	e2 := (RTEllipse new 
		size: 10; 
		color: (Color random alpha: 0.5)) element.
	v add: e2.
	e2 translateTo: e position.
	anim := RTAccelerationMove to: 
		e2 position + ((30 atRandom - 15) @ (30 atRandom - 15)) during: 3 on: e2.
	anim after: [ anim element remove. ].
	v addAnimation: anim
]

{ #category : #sources }
RTAnimationExample >> exampleActive [

| v anim |
v := RTView new.

anim := RTActiveAnimation new.
anim intervalInMilliseconds: 1000.
anim blockToExecute: [ 
	| e |
	e := (RTEllipse new size: 40 atRandom; color: (Color red alpha: 0.2)) element.
	e translateTo: (500 atRandom @ 500 atRandom) - (250 @ 250). 
	v add: e.
].
anim inView: v.
^ v

]

{ #category : #icons }
RTAnimationExample >> exampleActiveIcon [
	^ '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
1pT2H/WKWFJXbkccAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTAnimationExample >> exampleCircle [

	| view shape el |
	view := RTView new.
	shape := RTEllipse new color: (Color purple alpha: 0.2); size: 80.
	100 timesRepeat: [ 
		el := shape element translateTo: 500 atRandom @ 500 atRandom.
		el @ RTDraggable.
		view add: el. 
		view addAnimation: (RTLinearMove to: 500 atRandom @ 500 atRandom during: 2 on: el).
	].	
	^ view

]

{ #category : #icons }
RTAnimationExample >> exampleCircleIcon [
	^ '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
QmCC'
]

{ #category : #sources }
RTAnimationExample >> exampleCoolAnimation [
| v shape elements |
v := RTView new.
shape := RTEllipse new color: (Color purple alpha: 0.1); size: #yourself.
elements := shape elementsOn: (1 to: 100 by: 10).
v addAll: elements.

v canvas addMenu: 'Right!' callback: [  elements do: [ :e | RTLinearMove new to: e model @ 0 during: 1 on: e in: v ] ].

v canvas addMenu: 'Left!' callback: [  elements do: [ :e | RTLinearMove new to: e model negated @ 0 during: 1 on: e in: v ] ].

v canvas addMenu: 'Up!' callback: [  elements do: [ :e | RTLinearMove new to: 0 @ e model negated during: 1 on: e in: v ] ].

v canvas addMenu: 'Down!' callback: [  elements do: [ :e | RTLinearMove new to: 0 @ e model during: 1 on: e in: v ] ].

^ v
]

{ #category : #icons }
RTAnimationExample >> exampleCoolAnimationIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAEgklEQVR4XuXZ/U+bZRQG4Ht8
0xbKN6UUOqAtpR9QCi1tocJa2CYbQzLYYEFUMDObY3O4GZeoqOhi4rKZaOIW/1nPHV6SSch+
alFzX8kJtG8LyTk9z/Oep9CnT5++/5c1izsWaefxpvNzxuLuO9735xmvKbz1fpy6xv+z8Y6/
N6xfimP3LI6cRD52fvK5hxY7Z7y+ZJG0eHDGa5YtDpy/kTt1bdd5b9Ziz/kQ7FusW8xbdOuX
4tikRdEiYfGtxX2nW6YtFk+99tAi5Lyeif3CSSbe6ipee2EROXVt3rnO52edx4yo0x1J/VLo
06dPnz59+vTp06dPnz59+vTp06dPnz59+vTp06dPnz59+vTp06dPnz59+vTp06dPnz59+vTp
06dPn77/tAs1dWhwWbhrUNugn49/ST0aPc1o6XGhzd+CrqFWdI940D7ggrevHk2tNahr1M/S
Oai1RDej1deKnlA7/IlODEz2YCjXg+F8F4JT9jjFa260BawwLfoZq24xmtgRbeiLdeNi1odw
sR9jiwNIXBtE8noAsct+REu9GCmwMC3ovNgId4d+5qqA+wOXI3YFE87kBzFxYxjTt0KY2Q4j
tzOCzOYQ0jetOMt9iMyzezzoCDbC1a6fwQprgqeLnWHL00wA8atDmNoII78zhvc+i2PhQRyX
9vn7KAq7VpitQYyvOEVJsausoPX6Waxgd7jRHuAnnkuUFWN9FLO7MSx8Po7LT1J4/9kklr+Z
wJWvEig9iqJ4l93CwnFv8cIX1V+6KqgBzV4vesNcqmw5uhZC9k4M8/dZgDSuH2bwwc9ZrP0y
hRtHLE4S5cdWsD1bvtatgOXjLvH26WeyQuyuqrcDgXE/RkvcI0Yxt5fE4oEV47sM1p7ncfu3
AjZ/z2H9xTRWj1goLl/cX9hRTkH8HFr0s1kB/HQzqUwuk8xkM+lMfh63XhWx/aaID/8qWGGs
W35K4erX1kH3rJO2BhC/0o3gNGcU/X2kigWxveOpLVE/sCtmsfXHHLZfszj/7JDM7X7Elrow
mOZccgE1tfrZrMgdlrvT7rDGfAgV7VZ3NYL8R3GUHnK/YAFmcPPXHDZeWnc8T2PlkMU6Y8nS
30Mqpc6OSex4ZNiGwQznj5MuSWLpwJanZ1NY+d665ceTOy1u+GGbTYJIrfLWtwP9SU73+pms
wrJlG/sCu2TE7rSOZ5BL++NY+pJdkUD5EZ+LoPAJ5xR2B5crj03sPHzUz2IF8VyKU7ezl5RP
pnQOh1HMfcrZwwrx8cm0zmLYEJnlMKnfHVWc1nmyy6JwKeKGzYmc8wY7gp1j51rLLAaXNztm
ibOz9O+uqlwU65RBm0smeLprw+Is5xM7VCzzsNEm8xwLZoNkxCmG/nck57DJu5ls2xuCTDw3
bRaoDb4x+14kxGt2VNKpPwiee2EaXPV2rMIvqrhP8LyKX1xZHfQLoU+fPn369OnTp0+fPn36
9OnTp0+fPn369OnTp0+fPn369OnTp0+fPn369OnTp0+fPn369OnTp0+fPn369OnTp0+fPn36
JPwNXt+qEqTBc4UAAAAASUVORK5CYII='
]

{ #category : #sources }
RTAnimationExample >> exampleHappy2014 [

	| view txt x y el shape size offset |
	txt := 
	'
	xxxxx  xxxxx     xxx      x
	x   x  x   x    x  x     x
	   x   x   x   x   x    x x 
	  x    x   x       x    xxxxx
	 x     x   x       x      x
	xxxxx  xxxxx       x      x
	'.
	view := RTView new.
	x := 0.
	y := 0.
	size := 20.
	offset := 100 @ 100.
	txt linesDo: [ :line |
		y := y + 1.
		line do: [ :c |
			x := x + 1.
			c = $x ifTrue: [ 
				shape := (RTEllipse new size: size; color: (Color purple alpha: 0.2)).
				el := shape element.
				el translateTo: (800 atRandom @ 450 atRandom).
				view add: el.
				view addAnimation: (RTLinearMove new to: ((x * size) @ (y * size) + offset) during: 0.5 on: el).
			]
		].
	   x := 0.
	].
	^ view

]

{ #category : #icons }
RTAnimationExample >> exampleHappy2014Icon [
	^ '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'
]

{ #category : #sources }
RTAnimationExample >> examplePathAnimation [

| v els eb effect t example |
v := RTView new.
"v canvas color: Color black."
v add: (RTBitmap new form: RTIcon robowo) element.
els := RTBox elementsOn: (1 to: 4).
v addAll: els.

eb := RTEdgeBuilder new.
eb view: v.
eb objects: (1 to: 4).
eb useAssociations: (Array with: 1->2 with: 3->4).	

t := 10.
example := RTAnimationExample new.
effect := [ :e| example dustEffect: e and: v ].
v addAnimation: ((RTPathAnimation on: els first path:
 ('L0,100L-110,110', (RTSVGPath 
		goldenSpiral: 10 
		start: 0@0
		side: 200
		direction: 1@ 1
		type: true)) seconds: t) repeat; duringDo: effect).

v addAnimation: ((RTPathAnimation on: els third path:
 ('L0,100L110,110', (RTSVGPath 
		goldenSpiral: 10 
		start: 0@0
		side: 200
		direction: 1@ -1
		type: true)) seconds: t) repeat; duringDo: effect).

v addAnimation: ((RTPathAnimation on: els second path:
 ('L0,-100L-110,-110', (RTSVGPath 
		goldenSpiral: 10 
		start: 0@0
		side: 200
		direction: -1@ -1
		type: true)) seconds: t) repeat; duringDo: effect) .

v addAnimation: ((RTPathAnimation on: els fourth  path:
 ('L0,-100L110,-110', (RTSVGPath 
		goldenSpiral: 10 
		start: 0@0
		side: 200
		direction: -1@ 1
		type: true)) seconds: t) repeat; duringDo: effect).
v canvas camera scale: 0.4.
^ v



]

{ #category : #icons }
RTAnimationExample >> examplePathAnimationIcon [
	^ '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
gg=='
]

{ #category : #sources }
RTAnimationExample >> exampleSmooth [

| v e |
v := RTView new.
v when: TRMouseClick do: [ :event | v clean ].
v when: TRMouseMove do: [ :event |
	e := (RTBox new color: (Color red alpha: 0.2); size: 20 atRandom + 5) element.
	e translateTo: event position.
	v add: e.
	v addAnimation: (RTAccelerationMove to: 
		event position + ((150 atRandom - 75) @ (150 atRandom - 75)) during: 5 on: e)
].
^ v

]

{ #category : #icons }
RTAnimationExample >> exampleSmoothIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFZUlEQVR4XuWdy0rtMBSGfXUf
waFTcehQnDhRHImI4MTLRAR1IghHFAQhnq7uru4kTdMkTZvLHwjq5tB290vWfeXs/P3hj5zG
Dv4rwAeCP/CB4APBH/hA8IHgD3wg+EDwR61AxNeXEHd36nx+FvgIUgH590+Iqyt1NlDwEeAD
wQeCDwQfCD6QSSC/v6KFIs9G0Q/+3evrABw+kIQDH0huQJ6ehDg5UefPj8AHkgrI46MQBwfq
/Pz0BkIQFfHYiEx8ICFA3t6GOyQEiC76Gij4QGJZYwsDGUQQDMYGPpA1gej3S7ibqg0uEsQW
Ck+LYYAPJDd4+EAy9H0cdxMsEHzHsFIg/XWalT/7me7vF4/D7USRuRG+LD4QRyCtXf7+LtYA
0vsB19fb2Xnas/WDZDoPdIbj8+cBhB5CB0LeM4c16PdYQPjLymGTBfTIYEE5Xp/eQw9Reydp
RRYokGyVeglAdE+9/YwDjrUBWdyy2tvbzrMzd5HC3jn/1IEYci34QKZeKM3Dw+08P59UoP2L
5Z3Lcn7khYcodRl2cUDaGiwtXRss411eFou5/f0+XK/HsqJ4893zsDVYDhB64BkiIRhIp3MW
270sDhcUc1kCieGojokXW4FFtTpkdSBymSr9btldumMn+xb4QGLdj14qp3sfHjY/XYFI3ne9
QGYqde/7UR6edciEmdxabTQvLjYgHIHYxGC9Zq+e25bCEzaz0+TsueqbFEHK8hxDw5eXzU58
IDkAse0QQ+/JmPkcDARSZEUO6xuBrKjb8IHMdDDxgWQWQ8MHoq/ihftFBrVaLMZqdwznAJkS
M6aSHddIbAmtDvkAIafu6EhNTnUet1XPkHK2mMRVAWlXn2fxmEks2FZu6ynTJBjHxyoQSlBJ
WUM50qoAGdkhCgBDjsQERHx/J23ftgORHS5HpWfMyrmG0DnJxJPyGw5AnJ7FAUj7GYVV5Huu
3AuZDRAjnN3dzZQad/odxdMSRld2q8PzD4DwfWn3riTeouuQGED6a0XopPJeCPhALNeiyK08
I7Wl9c/Y7DDjrtKrX4oGMmLrx/Dcoy8aExBq3+acvBaqr2aHrGZCdzpv7AUr1iN91lhU1fsh
IUDmtq/pZvqYCIKMZaUEMipC8YHkA6S0kUW0t1eiNGdaUvKCwAeSA1x8IHZTFa1HsGogSujG
I56Uq0mLC4S860IPR6sTSISWs1RitygdwmGZpcI9vkCUBROpgmVVK8urDopjYnL1YmdBLWWZ
KX9zLobnVIGeBmRwnKGjOb+ztkk65U33iShqiaYkFRe9OR7E7JqpnFwMeujfBMSSUQ09PyUf
x1Dv7zg93YS9u5fueqrp4Dr6yXI0HdLRLgUXXqK7WCCcvu1WplE8+AAJTSlDA5G3PokqgzJd
HQgVO8ghHc8TgooGMhb6mATikMmLmcH0ghB4j3xPAyIlzoUMjR4xHsR8czPdMj0TiK29ulog
xtX/8rLVJ5RGDbWYqN3N0giED8QHiFxkkKj21gdIcY6hF5CPj221CRUZaIXRazTPKA5qt1tx
gXDNrvbyU/V8OGc/Z+Zj8jN7J2qJkwFxPROlBiDeK5WVfYZdUXBAfMTHEkp96b7E8nYIK9jG
o8cHkpNIMOUvYp9sx+EXfCCBoCKZwbGB+Byeid+Fa3qB5PuQWGxSAFGu53G8bDZAZF8kG7Fo
qI6vEojR4YsMZE66V9zebiIEl5eDlgqnXLvu5FIsLmsgoZFXj8zfnIIIW6FGEBCP5ygLSIq8
Bj4QfCDFeehJgTicJuTTp18kkLHTqBcDEvi/J8A4hkpI3rOcp7SB7xjiA8Ef+EDwgeAPfCD4
QPAHPhB8IPgDHwj4+A+pNt+eBhQLBgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTAnimationExample >> exampleVerySimple [
| view circle |
	view := RTView new.
	circle := (RTEllipse new size: 40; color: (Color purple alpha: 0.2)) element.
	view add: circle.
	view addAnimation: (RTLinearMove to: 100 @ 100 during: 2 on: circle). 

	^ view

]

{ #category : #icons }
RTAnimationExample >> exampleVerySimpleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABX0lEQVR4XuXXzQqCQBSAUd//
1ewdXEUJUYnK2A9jTdAiMJeOcj64K3cenDsW4+i3pgr/Ffggfj6ID+Lng/ggfj6ID+Lng/gg
fj6Inw/ig/j5ID6Inw/ig/j5ID6Inw/i54P4IH4+iA/i54P4IH4+iA/i54P4+SA+iJ8P4oP4
+SA+iJ8P4oP4+SB+PogP4ueD+CB+PogP4ueD+CCbrDuHeNl3sT2F6INk7DE8Y7WrY1X+zq2/
Rx8kQ1MY3/FBMhxT/zDSNHUffZAFSztjDiQ990EWLC3wOZDrwf9Clt8hpb9DVtXwvk1NYYTW
v2VlrTn2n52x1WPK/1P3Qfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx80H8
fBAfxM8H8UH8fBAfxM8H8UH8fBA/H8QH8fNBfBA/H8QH8fNBfBA/H8TPB/FB/HwQH8TPB/FB
/HwQH8TPB8F7AZYRl347ncDSAAAAAElFTkSuQmCC'
]

{ #category : #accessing }
RTAnimationExample >> label [
	^ 'Animation'
]
