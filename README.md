# Command Activity

## Phase 1 - Undstanding the Code Base
Browse to the DesignPatterns-Command package. We will explain the structure of the code, and you will have time to familiarize yourself with it. You're a gameplay programmer at Earth 3 Interactive, where you are making Earth, but 3. You've been assigned to work on the input handling functionality of the Earth3 engine. Currently, there's only 1 core abstraction for the input in the game: a button. This abstraction can be found in the `Button` class and its subclasses. To make a button in the current codebase, you subclass `Button` (as in `ButtonA` etc.) and hardcode the functionality that the button accesses in its `doAction` method. There's an example of how this works in the `ExampleController` class to speed up development for people learning the API. To make it run, you just call `ExampleController new makeExample`. The Entity class in your game is called `GameObject` and simply holds an x and y position in `posX` and `posY`. 

## Phase 2 - Extending the Code Base
### Avoiding Cringe but preserving Pog
Turns out the CEO, Kobby Botick, had his son play the game, and his son thought that having jump on `ButtonA` was "cringe." Your boss told you to make `ButtonA` instead do duck. So, since everything is currently hardcoded, you'll need to take the code from `ButtonB`'s `doAction` and copy it into `ButtonA`'s `doAction`. No big deal! 

The problem is, Mr. Botick's other son played the game with that new change, and he said that having jump ***not*** be on `ButtonA` was "not pog." Therefore, your boss has given you a new requirement: the buttons' functionality should be able to be rebound at run time. In order to accomplish this, create `ButtonAJump` and `ButtonADuck` as subclasses of `ButtonA`, hardcoding the appropriate functionality into each subclass' `doAction` method. Again, not so bad! When you want to rebind functionality at runtime, all you have to do is call replaceButton with `$A` and an instance of `ButtonAJump` or `ButtonADuck`. Try adding to the example code to test this out.

### The ButtonB Problem
You've accomplished your task, but now you need to be able to rebind `ButtonB`'s functionality. In order to do this, you'll need to make `ButtonBJump` and `ButtonBDuck` as subclasses of `ButtonB`, having the exact same functionality as the subclasses of `ButtonA`. You have to do this before you can check in the change and go home because this is the game industry, baby, so do it. 


### Takeaways:

Notice that any time you want to add functionality to one of your buttons, you must create a new subclass, one for each button that you want to be able to perform that action. Worse still, you have to create new subclasses of **each button**, greatly increasing the amount of code duplication. 

Additionally, the idea of a button that performs an action when it is pressed has now been intermingled and coupled to what that action actually is. 


## Interlude: Introducing the Command Pattern
As you contemplate the sheer awfulness of the task that you have been assigned at 8:00 PM in your dark office, you stumble online across something wonderful, something glorious, something that can solve this problem for you with far less code:

✨ 🌈 ✨ 🌈 ✨ ***The Command Pattern*** ✨ 🌈 ✨ 🌈 ✨

The command pattern is a design pattern that enables you to separate the requester of an action from the object that actually performs the action. This means the requester does not need to know what the action is or how to execute the action, just how to communicate to the object that needs to perform it. The separation is accomplished by creating command objects which hold functions and data related to executing the action. These command objects can then be assigned to different requesters, and serve as reusable, reassignable, and reified method calls.

Take our example of a controller with 4 buttons and each button triggering a certain action. Now, suppose that you want to change what each button does. As you saw, without the command pattern, this can be complex code, and require frequent rewriting of code. The command pattern allows you to easily change the assigned actions by treating commands as objects that can be passed around and assigned to different buttons. So instead of needing to create a new subclass for each and every button that wants to do any action, you can simply store the command as an object, and then reuse it at runtime as you please. 


## Phase 3 - A Commanding Performance
- Delete all the subclasses of `Button`.
- Add an instance variable to `Button` that will hold the `Command` assigned to it. 
- Add a `Command` class with only one instance variable: an `object` that the command can modify.
- Add the `execute` instance method to the `Command` class, representing the action that the `Command` **executes**.
- Add subclasses of `Command` for Jump, Shoot, Duck, etc. Define the functionality for each `Command` within the `perform` method. 
- Modify the example code to switch it to the new `Command`-centric style. Instead of creating instances of `ButtonA`, etc., you will now simply create four `Button` instances. You should then create instances of each `Command` subclass, and instead of reassigning the `Button`, you should call `button command:` and pass in the command you want to use to rebind.


### Takeaways:
- Commands make executing arbitrary actions simple.
- Note that in our example, you could replace commands with blocks without issue. This wouldn't be the case, however, if your command needed to hold state that persists across executions, or if, for example, you were writing a level editor and needed your commands to be able to undo themselves. In that instance, it's trivial to just implement an undo method for undoable commands, but not so trivial if you're using blocks for everything. 
- For cases where performance is important, and it doesn't matter what order your commands get executed in, commands lend themselves really well to a producer-consumer pattern of multithreading, where a main thread generates commands and pushes them onto a queue, and a bunch of consumer threads pop them off and work on them. 
- Having a bunch of command objects floating around, especially if they are all equivalent instances of the same class, can be a waste of memory. 
- There's still a lot of subclassing happening, it's just been moved into the command instead of the button, so if big inheritance hierarchies and dynamic dispatch are too slow for your use case, command is not optimal at times. 
- That also means that your code can be difficult to manage because the logic is split among so many subclasses. 
