# Custom Animation Button

<h2>Create a Custom Animation Button via Scale Transition in Flutter</h2>

So, Will be needed first AnimationController with SingleTickerProvider<br>
for start and reverse ScaleAnimation<br><br>

```
_AnimationController? _animationController;
AnimationController _animationController = AnimationController(
  vsync: this,
  duration: Duration(milliseconds: 100),
);
```

and we add via Tween an AnimationController to the ScaleTransition<br><br>
```
ScaleTransition(
  scale: Tween(begin: 1.0, end: 0.9).animate(_animationController!),<br>
  child: Container(
    ...
  )
)
```

We can using ScaleTransition using the AnimationController's forward() method.<br><br>
```
_animationController!.forward();
```

and method to return<br>
```
_animationController!.reverse();
```

Create custom button

```
GestureDetector(
  onTap: () {

    // To start animation from large to small and from small 
    // to large when pressed briefly
    _animationController!.forward().then((value) {
      _animationController!.reverse();
    });

    print("Clicked!");
  },
  onLongPressStart: (v) {

    // To start animation from large to small when start long pressed
    _animationController!.forward();

    print("Click Started!");
  },
  onLongPressEnd: (v) {

    // And To reverse animation from small to large when end long pressed
    _animationController!.reverse();

    print("Click Ended!");
  },

  // Our button custom widget
  child: Container(
    width: 100.0,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
    ),
    alignment: Alignment.center,
    child: Text(
      "Click",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24.0,
      ),
    ),
  ),
)
```

Now we add a button we created to ScaleTransition child

```
ScaleTransition(
  // shrink from 1.0 => Fulsize to 0.9 => 90% size 
  scale: Tween(begin: 1.0, end: 0.9).animate(

    // Curve animation for soft animation
    CurvedAnimation(
      // set controller
      parent: _animationController!,
      // mode curve 
      curve: Curves.easeIn,
    ),
  ),
  child: GestureDetector(
    onTap: () {

      // To start animation from large to small and from small 
      // to large when pressed briefly
      _animationController!.forward().then((value) {
        _animationController!.reverse();
      });

      print("Clicked!");
    },
    onLongPressStart: (v) {

      // To start animation from large to small when start long pressed
      _animationController!.forward();

      print("Click Started!");
    },
    onLongPressEnd: (v) {

      // And To reverse animation from small to large when end long pressed
      _animationController!.reverse();

      print("Click Ended!");
    },

    // Our button custom widget
    child: Container(
      width: 100.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      alignment: Alignment.center,
      child: Text(
        "Click",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    ),
  ),
)
```

You can try to use this example in your code !
