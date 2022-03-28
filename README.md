# Command Activity

## Phase 1 - Understanding the Code Base
Browse to the DesignPatterns-Command package. We will explain the structure of the code, and you will have time to familiarize yourself with it. You're a gameplay programmer at Earth 3 Interactive, where you are making Earth, but 3. You've been assigned to work on the input handling functionality of the Earth3 engine. Currently, there's only 1 core abstraction for the input in the game: a button. This abstraction can be found in the `Button` class and its subclasses. To make a button in the current codebase, you create a subclass of `Button` (`ButtonA` etc.). Each subclass must implement two abstract methods: `isNamed:` identifies which button is being implemented, and `doAction` implements the functionality that the button performs. The entity controlled by the button called `GameObject`, which holds game state such as the x and y position in `posX` and `posY`. The buttons will eventually be attached to a controller by name, but for this prototype they are simply stored in an `OrderedCollection` and accessed by the literal string for their name: `$A, $B, $X, $Y`.

There's an example of how this works in the `makeExample` methods of the `ExampleController` class. To make it run, call `ExampleController new makeExample` in the playground. 

## Phase 2 - Extending the Code Base
### Avoiding Cringe but preserving Pog
Turns out the CEO, Kobby Botick, had his son play the game, and his son thought that having jump on `ButtonA` was "cringe." Your boss told you to make `ButtonA` instead do duck. So, since everything is currently hardcoded, you'll need to take the code from `ButtonB`'s `doAction` and copy it into `ButtonA`'s `doAction`. No big deal!

The problem is, Mr. Botick's other son played the game with that new change, and he said that having jump ***not*** be on `ButtonA` was "not pog." Therefore, your boss has given you a new requirement: the user should be able to switch the  buttons' functionality at runtime. In order to accomplish this, create `ButtonAJump` and `ButtonADuck` as subclasses of `ButtonA`, hardcoding the appropriate functionality into each subclass' `doAction` method. Again, not so bad! When you want to rebind functionality at runtime, add a `replaceButton: with:` method to GameObject. The two parameters should be a button name (`$A`) and an instance of that button or a subclass.  You can browse the `OrderedCollection` methods by inspecting `OrderedCollection new` into the playground, clicking on the `Meta` tab, and clicking `OrderedCollection` in the class hierarchy. Finally, update the `makeExample` method to test this out!


### The ButtonB Problem
You've accomplished your task, but now you need to be able to rebind `ButtonB`'s functionality. In order to do this, you'll need to make `ButtonBJump` and `ButtonBDuck` as subclasses of `ButtonB`, having the exact same functionality as the subclasses of `ButtonA`. You have to do this before you can check in the change and go home because this is the game industry, baby, so do it. 


### Takeaways:

* Every time you want to add functionality to one of your buttons, you must create a new subclass of that button. Worse still, you have to create a new subclasses for **each** combination of action and button, resulting in a quadratic number of subclasses. 
* While subclasses can inherit the `isNamed:` code, the `doAction` code can't be reused: greatly increasing the amount of code duplication and potential for future bugs.
* Our double-jumping code requires state in a `Button`, and also must be duplicated between different parts of the class hierarchy. While this state should arguably be in the `GameObject`, other state (like "repeat delay") that does belong in some buttons and not others.
* These are consequences of tightly coupling the identity of a button and the action it performs when it is pressed. This also means we could not use our button framework for any other games! We have intermingled the idea of input with the state of the game, but why should buttons be aware of the game mechanics?


## Interlude: Introducing the Command Pattern
As you contemplate the sheer awfulness of the task that you have been assigned at 8:00 PM in your dark office, you stumble online across something wonderful, something glorious, something that can solve this problem for you with far less code:

✨ 🌈 ✨ 🌈 ✨ ***The Command Pattern*** ✨ 🌈 ✨ 🌈 ✨

The command design pattern enables you to separate the *requester* of an action from the object that actually *performs* the action. This means the requester does not need to know what the action is or how to execute the action, just how to communicate to the object that can perform it. The separation is accomplished by creating command objects: objects which hold functions and data needed to execute the action. A command object may contain a great deal of state, but exposes only a single `execute` method. The invoker can then execute the command without having to be aware of what the action is. These command objects can then be assigned to different requesters, and serve as reusable, reassignable, and [reified](https://www.merriam-webster.com/dictionary/reify) method calls.

![A command encapsulates a request into a composed object](https://learning.oreilly.com/api/v2/epubs/urn:orm:book:9781492077992/files/assets/f0206-02.png)

Take our example of a controller with 4 buttons, where each button triggers a certain action. Without the command pattern, changing what each button does this can be quite complicated. The command pattern allows you to easily change the assigned actions. Buttons are *invokers* that hold commands and know how to execute them. The commands themselves are objects, which can be passed around and assigned to different buttons. Instead of needing to create a new subclass for each and every button that wants to do any action, you can simply store the command as an object, and then reuse it at runtime as you please. 


## Phase 3 - A Commanding Performance
- Delete all the subclasses of `ButtonA` and `ButtonB`.
  - Optionally, replace the subclasses of `Button` by using an instance variable that holds the identity of the button.
   - Add an instance variable to `Button` that will hold the `Command` assigned to it. 
- Add a `Command` class with only one instance variable: an `object` that the command can modify.
   - Add an abstract `execute` instance method to the `Command` class, representing the action that the `Command` *peforms*.
   - Add subclasses of `Command` for Jump, Shoot, Duck, and Attack. Define the functionality for each `Command` within the `execute` method. 
- Replace the `GameObject >> replaceButton: with:` method with a `bind: with:` method. The first parameter will still be a button name, but the second will now be a `Command` object. Select the button with that name and update it's command!
  - Optionally, define a `swapButton: with:` method that takes two button names and swaps their commands.
  - Optionally, replace the `OrderedCollection` with a `Dictionary` mapping the `name` of a button to the button itself.
- Modify the example code to switch it to the new `Command`-centric style. You will create four buttons and four commands. Be sure to test out reassigning buttons!

### Takeaways:
- Commands make executing arbitrary actions simple.
- In our example, you could replace commands with blocks without issue, possibly excluding jump. This wouldn't be the case, however, if your command needed to hold a state that persists across executions, or if, for example, you were writing a level editor and needed your commands to be able to undo themselves. In that instance, it's trivial to just implement an undo method for undoable commands, but not so trivial if you're using blocks for everything. 
- There's still a lot of subclassing happening, it's just been moved into the command instead of the button, so if big inheritance hierarchies and dynamic dispatch are too slow for your use case, command is not optimal at times. 
- That also means that your code can be difficult to manage because the logic is split among so many subclasses. 

### Further Notes
- For cases where performance is important, and it doesn't matter what order your commands get executed in, commands lend themselves really well to a producer-consumer pattern of multithreading, where a main thread generates commands and pushes them onto a queue, and a bunch of consumer threads pop them off and work on them. 
- Having a bunch of command objects floating around, especially if they are all equivalent instances of the same class, can be a waste of memory. Stay tuned for a possibly resolution next Monday!
