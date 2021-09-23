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
_animationController!.forward()
```


