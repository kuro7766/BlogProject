arg parser action

Action: Arguments can trigger different actions, specified by the action argument to add_argument(). There are six built-in actions that can be triggered when an argument is encountered:

- store: Save the value, after optionally converting it to a different type. This is the default action taken if none is specified explicitly.

- store_true/store_false: Save the appropriate boolean value.

- store_const: Save a value defined as part of the argument specification, rather than a value that comes from the arguments being parsed. This is typically used to implement command line flags that aren’t booleans.

- append: Save the value to a list. Multiple values are saved if the argument is repeated.

- append_const: Save a value defined in the argument specification to a list.

version: Prints version details about the program and then exits.

