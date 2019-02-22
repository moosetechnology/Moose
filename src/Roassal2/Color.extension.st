Extension { #name : #Color }

{ #category : #'*Roassal2' }
Color >> asThemed [
	"Infer a color that is supposed to be adapted to the current theme"
	^ TRTheme current transformColor: self
]

{ #category : #'*Roassal2' }
Color class >> colorWheel: s alpha: a [
	^ (Color wheel: 6) collect: [:c | c alpha: a ].
]

{ #category : #'*Roassal2' }
Color class >> distinctTenLightColors [
	"This is a list of 10 light colors that can be distinguished b
	the typical human eye even when seen together in the same picture.
	They complement the distinctTenStrongColors.
	They are described in the Show Me the Numbers book by Stephen Few"

	^ OrderedCollection new
		"red"
		add: (Color 
					h: Color red hue
					s: 0.3
					v: Color red brightness);
		"blue"
		add: (Color 
					h: Color blue hue
					s: 0.3
					v: Color blue brightness);
		"orange"
		add: (Color 
					h: Color orange hue
					s: 0.3
					v: Color orange brightness);
		"cyan"
		add: (Color 
					h: Color cyan hue
					s: 0.3 
					v: Color cyan brightness );
		"green"
		add: (Color 
					h: Color lightGreen hue
					s: 0.1
					v: 0.7);
		"pink"
		add: (Color 
					h: Color pink hue
					s: 0.1
					v: Color pink brightness);
		"brown"
		add: (Color 
					h: Color brown hue
					s: 0.2
					v: 1 );
		"purple"
		add: (Color 
					h: Color purple hue
					s: 0.2
					v: Color purple brightness );
		"yellow"
		add: (Color 
					h: Color yellow hue
					s: 0.3
					v: Color yellow brightness);
		"gray"
		add: (Color veryLightGray);
		yourself;


		yourself
]

{ #category : #'*Roassal2' }
Color class >> distinctTenStrongColors [
	"This is a list of 10 light colors that can be distinguished b
	the typical human eye even when seen together in the same picture.
	They complement the distinctTenLightColors.
	They are described in the Show Me the Numbers book by Stephen Few"

	^ (OrderedCollection new)
			add: Color red;
			add: Color blue;
			add: Color orange;
			add: Color cyan;
			add: Color green;
			add: Color pink;
			add: Color brown;
			add: Color purple;
			add: Color yellow;
			add: Color gray;
			yourself
]

{ #category : #'*Roassal2' }
Color class >> fromRgb256Triplet: list [
	^ self red: list first green: list second blue: list third
]

{ #category : #'*Roassal2' }
Color class >> grayScale256: intensity [
	"between 0 and 256"
	| i |
	i := intensity asFloat / 256.
	^ self r:  i g: i b: i 
]

{ #category : #'*Roassal2' }
Color class >> red: r green: g blue: b [
	"Return a color with the given r, g, and b components in the range [0.0..255]."

	^ self red: r green: g blue: b alpha: 1.0
]

{ #category : #'*Roassal2' }
Color class >> red: r green: g blue: b alpha: a [
	"Return a color with the given r, g, and b components in the range [0.0..255]."

	^ self r: (r/255 asFloat) g: (g/255 asFloat) b: (b/255 asFloat) alpha: a
]

{ #category : #'*Roassal2' }
Color >> trans [
	"Make the color transparent"
	^ self alpha: 0.4
]
